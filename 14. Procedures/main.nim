# procedures are functions
# argument types are mandatory!
proc say_hello(name: string = "Nick"): void = # void is an empty type, this function returns nothing (saying void is purely optional)
    # "Nick" is name's default value
    echo "Hello, ", name, "!"

say_hello("Nick")

proc sum(x, y: int): int = # since both x and y are integers, we just have to specify the last argument as an int
    return x + y

echo sum(5, 7)

proc sum(x, y, z: int): int = # function overloading
    return x + y + z

echo sum(10, 5, 20)

proc getLargest(values: seq[int]): int =
    say_hello("Steve") # you can call other procedures inside procedures

    for value in values:
        if value > result:
            # if the return type is int, then the result is 0 by default, so passing in a sequence with only negative numbers
            # will cause some errors
            result = value # result gets automatically returned once the function ends, alternative to 'return'
            # NOTE: if you declare result (var result = 0), then the above is invalid, you then need to use 'return'
            # NOTE: but if you just say result = 0 (no var), then it's still fine
            # it is recommended to use result whenever possible instead of return

echo getLargest(@[1, 6, 9, 5, 2, -5, -9, 99, 7, 4])

proc count(num: var int) =
    # num: var int -> allowed the actual value that is passed in to be mutated
    num += 1

var number = 0

count(number) # this will actually modify the number variables because it was passed in with "var int"
count(number)
count(number)
count(number)
count(number)

echo number

var a = 0
proc increment(x: var int, y: int) =
    x += y

a.increment(10) # this is valid, where number is the FIRST argument and any other arguments goes inside the ()
echo a

increment a, 50 # this is also allowed (so basically no brackets required)
echo a

# you have to declare a procedure BEFORE you can use it, but Nim allows you a trick around it
proc subtract(x, y: int): int # declare it here

echo subtract(7, 10) # you can now call it before you declare it

# define the function here
proc subtract(x, y: int): int =
    return x - y

var my_arr_1: array[10, int]
var my_arr_2: array[5, int]

# open array is a special parameter that allows you to take in an array
# as a parameter, and you do NOT have to indicate the array size
proc get_arr_len(arr: openArray[int]) =
    echo len(arr)

# no problem working with different sized arrays
get_arr_len(my_arr_1)
get_arr_len(my_arr_2)

# varargs allows us to take in multiple (as many as we want) arguments (basically ...args in JS)
proc print(data: varargs[string]) =
    # echo data # data is an array
    var output = ""
    for word in data:
        # &= -> append
        output &= word & " "

    echo output

print("Hello", "World", "I", "am", "here")

# the `$` allows you to take in any 'type' in your varargs
proc display(data: varargs[string, `$`]) =
    for index in data:
        echo index

display 1, "My world", @[22.1, 55.6, 44.8] # can take more than just strings

proc `-`(x, y: int): int = # operator overloading
    return x + y # the "-" wil now add

echo 10 - 7 # 17, since we overloaded the "-" operator

proc `+`(x, y: array[2, int]): int =
    for i in 0 ..< len(x):
        result += x[i] + y[i] # make that + adds values in arrays together

echo [2, 4] + [10, 99] # valid now, since we overwrote what "+" does with arrays

# auto is used for nim to automatically guess parameters and/or return types of a function
# it can only be used with procedures. Try not to use it if you don't have to
proc anyType(x: auto): auto =
    result = 99 + x

echo anyType(1)

# STATIC
# static is a value that cannot change, this means that it has to be a set value
# so if used in an function, we are not allowed to pass in variables, instead
# we should pass in the value we want as is (so NOT x(myVar), BUT x(2))

proc speak(name: string, script: static string) =
    # extra text should be passed in AS IS, whilst name can be a variable
    echo name, ": ", script

let ghost = "Ghostly Jack"
speak(ghost, "BOO! What are you doing here?!")

# let script = "#Some test text"
# speak(ghost, script) # will cause error because you cannot pass in a variable on static parameter!

# anonymous function
var summation = (proc(num1, num2: int): int = num1 + num2)
echo summation(2, 6)

proc exec(someFunc: proc, x: int): int =
    return someFunc(x, 100)

echo exec((proc(num1, num2: int): int = num1 * num2), 55) # example of how an anonymous function can be useful

# arrow functions
import sugar # this is used to allow more syntax in Nim

let say_goodbye = (name: string) => echo "Goodbye " & name

say_goodbye("Jack")
