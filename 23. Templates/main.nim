# templates do not return anything, they substitute for something else, in this case !! = !=
# fun fact: !=, >, >= and in are all templates
# untyped - parameters can be passed in before they're even assigned a value
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
