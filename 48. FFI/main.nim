#[ Foreign Function Interface (FFI) is a mechanism that allows programming languages to interoperate with code written in another language. It provides a way to call functions, use data types, and exchange data between different programming languages. FFI is often used when integrating with languages like C, C++, or Rust, as they often provide stable and widely-used APIs.

# Nim allows you to interface C/C++/Objective-C and JavaScript. However note that JavaScript interfacing cannot be mixed with C/C++/Objective-C
# as C/C++/OC are backwards compatible, whilst JS is a whole different language

In Nim, FFI is supported through the importc and importcpp pragmas. These pragmas allow you to declare and call functions from C or C++ libraries. ]#

# with this we can call the C printf method
# int printf(const char *format, ...); // C version of the function

# importc -> importing from C
# varargs -> allows for multiple argument pass-ins
# header -> header to import to use this function
# discardable -> since printf returns a value (cint), we can add this optional pragma to not have to write
# discard printf("sds") when calling the function
proc printf(format: cstring): cint {.importc, varargs, header: "stdio.h", discardable.}

# note that the string we pass in is not a string, but instead a cstring
# a Nim string is an object, whilst a C style string is `const char *` and
# will not be considered the same type (you won't get an error, but instead no output)
printf("My name is %s and I am %d years old!\n", "Jack", 25)

# NOTE: the function name should be the same as the one you are trying to import, unless you specify the
# function you are trying to use
proc coolPrint(format: cstring): cint {.importc: "printf", varargs, header: "stdio.h".}

 # have to use discard, since I did not add discardable to pragmas
discard coolPrint("Another print for %s\n", "Mike")

# couple of C types in Nim
#[ cstring
cint, cuint
pointer
clong, clonglong, culong, culonglong
cchar, cschar, cuchar
cshort, cushort
cint
csize
cfloat
cdouble, clongdouble
cstringArray ]#

# wrapping a C/C++ type in Nim with FFI
type
    CTime = int64

# time_t time( time_t *arg );
proc time(arg: ptr CTime): CTime {.importc, header: "<time.h>".}

#[ struct tm { // how the struct is structured in C
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
}; ]#

type
    TM {.importc: "struct tm", header: "<time.h>".} = object
        tm_min: cint
        tm_hour: cint


# struct tm *localtime( const time_t *time );
proc localtime(time: ptr CTime): ptr TM {.importc, header: "<time.h>".}

var seconds = time(nil)
let tm = localtime(addr seconds)
echo(tm.tm_hour, ":", tm.tm_min) # get current time using only C FFI

# BIG thanks to https://livebook.manning.com/book/nim-in-action/chapter-8/96
# you can also learn about JS ffi in above link
