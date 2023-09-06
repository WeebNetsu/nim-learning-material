# pragmas is a way of giving the compiler more information
# pragmas are enclosed inside {. .}

# this will tell the compiler that this variable/function is deprecated (no longer used)
let MY_VAR {.deprecated.}: string = "Some important variable"
echo MY_VAR

proc noUse() {.deprecated: "Use myFunc instead".} = # this will show helpful text in the warning that the compiler throws
    echo "This function is deprecated"

noUse() # the compiler will throw a waring, since it's deprecated

proc calc1(x, y: int): int {.noSideEffect.} = # make sure the function cannot have a side effect
    # a function without a side effect is a function thats output only changes
    # when the input is changed. It also doesn't touch anything outside of its scope
    return x + y

echo calc1(10, 2)

#[ proc calc2(x, y: int): int {. noSideEffect .} =
    echo "Hello" # error -> this function has a side effect
    return x - y

echo calc2(10, 2) ]#

# func is syntax sugar for noSideEffect, so you can use this or the noSideEffect pragma
func calc3(x, y: int): int =
    return x - y

echo calc3(10, 5)

func calc4(x, y: int): int =
    # cast allows you to overwrite the compilers noSideEffect, and use something with sideEffect
    {.cast(noSideEffect).}:
        echo "Hello!"
    return x * y

echo calc4(10, 5)

# NOTE: you need a new version of Nim to use some of the below! (like v1.4.8)
# this pragma will throw an error (this will not always stop the program from executing tho!)
proc calc5(x, y: int): int {.error.} =
    return x / y

# the below doesn't work correctly for some reason
proc throwFatalError() =
    # {.fatal: "This is a fatal error!".}
    echo "This will throw an error with a message. This WILL stop the program from"
    echo "executing, unlike the 'error' pragma"

proc warning() =
    # this pragma will show a warning when compiling
    {.warning: "This is a warning pragma!".}
    echo "Hello! Warning ahead!"

{.hint: "Using warning can be confusing!".}
warning()

import sugar

# use a pragma with an arrow function
let arrow = () {.noSideEffect.} => 10

echo arrow()

# * I do not completely understand how to use UDPs, so do not include in tutorial
# * but mention it!
# https://nim-lang.org/docs/manual.html#userminusdefined-pragmas
#[ # User defined pragmas

# Declare a new pragma named "debug" that enables debug mode.
# The pragma is conditionally applied based on the value of "isDebugMode".
{.pragma: debug.}

# Define a procedure "calculate" with the "debug" pragma, which prints debug information during execution.
proc calculate(a, b: int): int {.debug.} =
    when defined(debug):
        echo "Calculating..."

    result = a + b

discard calculate(1, 2)
# NOTE: link users to https://nim-lang.org/docs/manual.html#pragmas for more pragmas they can use

# Define a custom pragma named "toJson" that converts a type to JSON format.
template toJson(t: typedesc) {.pragma.}

# Define a custom pragma named "log" that logs a message with a specified log level.
template log(level: string) {.pragma.}

# Define a type "Person" and apply the "toJson" pragma to enable JSON serialization.
type
    Person {.toJson.} = object
        name: string
        age: int

    # Define a type "Car" and apply the "log" pragma to log important events.
    type
        Car {.log("info").} = object
            make: string
            model: string
            year: int

        # Use the custom pragmas in the code

        # Calculate the sum of two numbers
        let result = calculate(10, 20)

        # Create a person object
        let person = Person(name: "John Doe", age: 30)

        # Create a car object
        let car = Car(make: "Toyota", model: "Camry", year: 2022)

        # Print the JSON representation of the person object
        echo person.toJson()

        # Log an important event about the car
        car.log("Car successfully started")
            ]#
