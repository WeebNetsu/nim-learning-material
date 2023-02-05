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

# you can also use try/except to assign variab;es
var 
    a = try: parseInt("one") # try to give parsed int as value
        except: -1 # otherwise make it -1
        finally: echo "Variable 'a' was assigned!" # do something after assigned (optional)
    
    # do the above in 1 line by using ()
    b = (try: parseInt("123") except: -1 finally: echo "Done!")

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
    echo "Custom error occured"
except CustomError2 as e:
    echo e.msg
except:
    echo "Other error occured"

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