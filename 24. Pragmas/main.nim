# pragmas is a way of giving the compiler more information
# pragmas are enclosed inside {. .}

# this will tell the compiler that this variable/function is deprecated (no longer used)
let MY_VAR {.deprecated.}: string = "Some important variable"
echo MY_VAR

proc noUse() {.deprecated: "Use myFunc instead".} = # this will show helpful text in the warning that the compiler throws
    echo "This function is deprecated"

noUse() # the compiler will throw a waring, since it's deprecated

# no side effects:
# - Its output only depends on its inputs.
# - It does NOT modify or access anything outside of its scope.
# - It does NOT perform I/O (printing, reading files, modifying global vars, etc.).
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

import sugar

# use a pragma with an arrow function
let arrow = () {.noSideEffect.} => 10

echo arrow()

proc warning() =
    # this pragma will show a warning when compiling
    {.warning: "This is a warning pragma!".}
    echo "Hello! Warning ahead!"

{.hint: "Using warning can be confusing!".}
warning()

# exclude from tutorial
# inline removes overhead by calling the code directly from a procedure.
# This can provide performance benefits at the cost of a larger code size being generated
# proc fastAdd(x, y: int): int {.inline.} =
#     return x + y

# echo fastAdd(10, 5) # The compiler replaces this with: "10 + 5"

# NOTE: you need a new version of Nim to use some of the below! (like v1.4.8)
# this pragma will show an error during compile time, BUT will not prevent compiling if it is not called
proc calc5(x, y: int): int {.error.} =
    return x / y

# calc5(1, 2) # this will throw an error during compilation and prevent the code from compiling

proc throwFatalError() =
    # fatal will cause an error during compile time and stop the program from compiling
    # {.fatal: "This is a fatal error!".}
    echo "This will throw an error with a message. This WILL stop the program from"
    echo "executing, unlike the 'error' pragma"

# here is a real world example of where using fatal could be useful
# in this example we will throw an error if the nim version is
# less than 2 OR if it is 2 but less than 2.2
when NimMajor < 2 or (NimMajor == 2 and NimMinor < 2):
    {.fatal: "This code requires Nim 1.6 or higher!".}

# another example can be if we have a specific feature that needs to be a specific value when compiled
const USE_ADVANCED_FEATURE = true
when not USE_ADVANCED_FEATURE:
    {.fatal: "This feature must be enabled to compile.".}

# note that fatal has its time and place, do not use it for runtime errors, like division by 0
# just use it for compile time errors to stop the program from compiling
