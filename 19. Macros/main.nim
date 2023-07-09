# a macro is a function that is executed at compile time

assert(25 == 25) # this is a macro, if false, will throw error during compile

import std/macros

# example from the docs
# here we create a macro that will debug code for us
macro debug(args: varargs[untyped]): untyped =
    # A macro always has to return a `NimNode`. A `nnkStmtList` node in this case.
    result = nnkStmtList.newTree()
    # iterate over any argument that is passed to this macro:
    for n in args:
        # `toStrLit` converts an AST to its string representation (so variable x => "x"):
        result.add newCall("write", newIdentNode("stdout"), newLit(n.repr))
        # write ":" to the terminal
        result.add newCall("write", newIdentNode("stdout"), newLit(": "))
        # show the value inside the variable
        result.add newCall("writeLine", newIdentNode("stdout"), n)

var
    a: array[0..1, int] = [20, 30]
    x = "some string"

debug(a[0], a[1], x)
