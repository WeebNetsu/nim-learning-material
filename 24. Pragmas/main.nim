# pragmas is a way of giving the compilier more information
# pragmas are enclosed inside {. .}

# this will tell the compilier that this variable/function is depricated (no longer used)
let MY_VAR {.deprecated.}: string = "Some important variable"
echo MY_VAR

proc noUse() {.deprecated: "Use myFunc instead".} = # this will show helpful text in the warning that the compilier throws
    echo "This function is deprecated"

noUse() # the compilier will throw a waring, since it's depricated

proc calc1(x, y: int): int {. noSideEffect .} = # make sure the function cannot have a side effect
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
    # cast allows you to overwrite the compiliers noSideEffect, and use something with sideEffect
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
    # this pragman will show a warning when compiling
    {.warning: "This is a warning pragma!".}
    echo "Hello! Warning ahead!"

{.hint: "Using warning can be confusing!".}
warning()

import sugar

# use a pragma with an arrow function
let arrow = () {.noSideEffect.} => 10

echo arrow()