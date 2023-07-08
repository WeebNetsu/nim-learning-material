import strutils

var users: File

if open(users, "users.txt"):
    try:
        var
            a = users.readLine()
            b = parseInt(a)
    except ValueError as e: # specifically get Value Errors
        # we got the exception as e (which is optional)
        # .msg gets the message given by the error
        echo "Value error! (can't parseInt string in variable a).\n Message: ", e.msg
    except: # handle any and all exceptions
        let e = getCurrentException() # get the exception (alternative way)
        echo "Exception! ", getCurrentExceptionMsg() # this is alternative to e.msg
    finally: # if an exception happened or not, this will execute!
        close(users) # close the file used

# you can also use try/except to assign variables
var
    a = try: parseInt("one")                       # try to give parsed int as value
        except: -1                                 # otherwise make it -1
        finally: echo "Variable 'a' was assigned!" # do something after assigned (optional)

    # do the above in 1 line by using ()
    b = (try: parseInt("123") except: -1 finally: echo "Done!")

# ! ----- PART 2 -----

# raise (call) an exception
try:
    # this will throw an exception
    raise newException(IOError, "Custom IO failed error message")
except IOError as e:
    echo "An IO Error has occurred: ", e.msg

# You can specify what type of exceptions can be raised by your procedure
# however, this means that your procedure is ONLY allowed to raise these
# errors
proc throwError(ioErr: bool){.raises: [IOError, OSError].} =
    if ioErr:
        raise newException(IOError, "IO Error Was Raised")
    else:
        raise newException(OSError, "OS Error Was Raised")

try:
    throwError(true)
except IOError as e:
    echo e.msg
except OSError as e:
    echo e.msg

# you can still return normal values
proc throwErrorTwo(ioErr: bool): string {.raises: [OSError].} =
    if ioErr:
        raise newException(OSError, "OS Error Was Raised")

    return "Cool, no error"

try:
    echo throwErrorTwo(false)
except OSError as e:
    echo e.msg

# this means that the function was made to always run, and never
# throw an exception. Due to this, it is your job as the developer
# to make sure no errors occur
proc throwErrorThree(): string {.raises: [].} =
    # note - if we do the below, it will throw an exception,
    # exceptions inheriting from system.Defect is allowed to
    # run without being checked
    # discard 10 div 0

    # so we need to wrap our function in a try/catch block if needed
    try:
        # discard - we don't care about the value it returns, so we don't
        # store it in a variable, we just throw it away
        discard 10 div 0
        # since DivByZeroDefect is inherited from system.Defect
        # we can raise it without getting an error in the function
        # NOTE: for tutorial, show users the error we get when raising
        # an OSError
        raise newException(DivByZeroDefect, "division by zero")
    except DivByZeroDefect: # we need to do this, since we specified raises: []
        return "Failed"

    return "Passed"

# since it is not expected to throw an error, developers will usually not place
# it in a try/except block
echo throwErrorThree()

# Creating custom Exceptions
type
    CustomError = object of Exception # create your own custom exception
    CustomError2 = object of Exception # create your own custom exception

var c = 2
try:
    if c == 1:
        # throw custom error/exception
        raise newException(CustomError, "This is my custom error")
    elif c == 2:
        raise newException(CustomError2, "This is my SECOND custom error")
    else:
        raise newException(IOError, "You can raise existing errors as well!")
except CustomError: # catch exception
    echo "Custom error occurred"
except CustomError2 as e:
    echo e.msg
except:
    echo "Other error occurred"

# DEFER
# defer cannot be used on top level, so you have to put it inside a function
proc defs() =
    var d = open("users.txt", fmAppend)
    defer: close(d) # defer will allow a finally to be created in 1 line
    d.write("\nJason")
    #[
        The above will basically become:
        try:
            d.write("\nJason")
        finally:
            close(d)
        ]#
defs()
