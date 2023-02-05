#[ 
    Data Types
    string
    float
    bool
    char
    int
    uInt
    float64
]#

var x = 5 # declare variable like this
var y: int = 15 # specify variable type like this
echo x, " ", y

# NOTE: A variable has a specific type, so if declared as string, it has to stay a string
var name: string = "Jack" # double quotes for strings
var money: float = 5.98
var class: char = 'A' # single quotes for chars

echo name, " has $", money, " and is in grade 8", class

name = "Nick" # you can reassign variables
echo "New name: ", name

var my_var: string = "Hello"
# ! The below is the same as the above!!!! Nim ignores '_'!
# var myVar: string = "World"

echo mYVAR # works fine.
# NOTE: Myvar != my_var, these are 2 DIFFERENT variables, if the first character is uppercase, it's a different character

#[ 
    Basic data types:
        string
        int
        bool
        float
 ]#
const lol = "jack" # constant variable
echo lol

var # you can delcare multiple variables like this
    a = 22
    b: int = 12

const # declare multiple constants
    c = 50
    d: bool = false

echo a, b, c, d

# NOTE: Constants are created on compile and variables are created on run time!
# const GO = a + 5 # this is invalid, since GO is declared immediately, but a is not
const GO = c + 10 # this is valid because c is also a constant
echo GO

let ABA = a + 10 # let is the same as const, but it gets created on runtime, the same as variables
# thus a can be used inside of ABA, since let and var are created at runtime
echo ABA
# it is recommended to use let wherever possible

# NOTE: const is faster than let (because of the compile-time compiling)

# the below is another way to declare variables
let `strange var` = "Hello!"
echo strange_var #it gets converted to this, and to strangeVar

var z: auto = 99 # to guess the type (useless for variables, since it does this automatically without the auto)
echo z