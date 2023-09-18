# the "*" means that this functions is availible for use outside this file
proc say_hello*(name: string) =
    echo "Hello ", name, "!"

proc say_goodbye*(name: string) =
    echo "Goodbye ", name, "!"

# since this does not have a *, it will not be usable outside the file
proc subtract(x, y: int): int =
    return x - y
