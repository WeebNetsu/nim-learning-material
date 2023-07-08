import options

# options allows you to say if a value has a value or not
# so if a return value or variable is empty or not
# very useful with async functions, where an API might return a
# response or not

# the below function can return either an integer or nothing
proc getLetterPos(word: string, letter: char): Option[int] =
    for index, character in word:
        if character == letter:
            # if the character was found, return some() to say that
            # something was found, and pass in index
            return some(index)

    # if the character was not found, return none() to say that nothing
    # was found, and pass in the data type you have to return
    return none(int)

let a = getLetterPos("My name is steve", 'e')
if isSome(a): # check if "some()" was returned, which means something was returned
    echo "Letter found at index ", get(a) # get() gets the value from some()

let b = getLetterPos("My name is steve", 'x')
if isSome(b):
    echo "Letter found at index ", get(b)
elif isNone(b): # check if "none()" was returned, meaning nothing was returned
    echo "Letter not found"

# $ -> convert to string, without '$', the below would throw error
echo $b == "none(int)"
echo a == b # compare if 2 Options are the same

# flatten removes 1 level of a nested option, so the below would be
# some(some(6)), but flatten removes one of the some()
echo flatten(some(a))