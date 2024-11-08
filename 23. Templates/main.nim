# templates do not return anything, they substitute for something else, in this case !! = !=
# fun fact: !=, >, >= and in are all templates
# untyped - parameters can be passed in before they're even assigned a value, since it does not enforce type checking
template `!!` (a, b: untyped): untyped =
    not(a == b)

echo "Hello" !! "Hello"

var x: int
echo x !! 8 # will work, because we used untyped parameters, so x won't be checked and 8 will be accepted as is
x = 8

# a typed means that what is passed in should have a type
template `setStr` (a: typed) =
    var a: string = "Hello" # we make it a string assigned to "Hello"

var s: string
setStr(s) # fine
echo s

# setStr("5") # not possible, since 5 has not been declared in a variable with a type

template withFile(f, fileName, mode, actions: untyped): untyped =
    var f: File

    if open(f, fileName, mode):
        try:
            actions # do whatever the user passed in
        finally:
            close(f)
    else:
        quit("Cannot open file '" & fileName & "'")

# even though textFile hasn't been declared, we can still use it thanks to untyped
withFile(textFile, "myFile.txt", fmRead):
    # actions is whatever is being passed in here
    echo textFile.readLine()


# Define a mixed template that combines typed and untyped parameters
template `swapIfGreater`(a, b: untyped, T: typed) =
    # a and b are untyped, so in this case the template will work with both strings and integers
    # T being passed in is the type we want to enforce the check against
  if a > b:
    #  we assign a temporary variable to store the original value of a
    let temp: T = a
    # we swap the 2 variables
    a = b
    b = temp

var num1 = 10
var num2 = 5

swapIfGreater(num1, num2, int)
echo (num1, num2)  # Output: (5, 10)

var str1 = "world"
var str2 = "hello"

swapIfGreater(str1, str2, string)
echo (str1, str2)  # Output: (hello, world)