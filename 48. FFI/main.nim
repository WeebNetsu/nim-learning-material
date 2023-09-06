#[ Foreign Function Interface (FFI) is a mechanism that allows programming languages to interoperate with code written in another language. It provides a way to call functions, use data types, and exchange data between different programming languages. FFI is often used when integrating with languages like C, C++, or Rust, as they often provide stable and widely-used APIs.

In Nim, FFI is supported through the importc and importcpp pragmas. These pragmas allow you to declare and call functions from C or C++ libraries. ]#

# with this we can call the C printf method
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

# you can learn more about FFI here
# https://livebook.manning.com/book/nim-in-action/chapter-8/136

# todo show bigger examples
# todo show how to interface with JS FFI (both can be found in above link)
