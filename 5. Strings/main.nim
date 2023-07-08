var first = "Hello"
var second = " World"

var full = first & second # add 2 strings together
echo full
echo full[0] # get first letter in string
echo full[3 .. 6] # get letters l - W (index 3 to index 6 (both included))
echo full[full.low] # low -> returns lowest index in string
echo full[full.high] # high -> returns highest (last) index in string

first.add(second) # will append 2 strings (will change first string)
echo first

echo first.len() # get string length
echo len(first) # another way of getting the length

first.setLen(3) # resizes the string to be only 3 letters in length
echo first

# escape characters
var special = "Hello\nWorld\tI\'m Steve\\Netsu (pronounced \"Ste-ve-su\")"
echo special

# r = Allows you to escape "" by doubling the amount of them; This also escapes escape characters
# this is also known as a "raw string", their only escape sequence is ""
echo r"Hello, my name is ""Steve"" and I am cool\n"

import strformat # allows you to format strings

let
    name = "Jack"
    age = 19
    food = "pizza"

# first metod is fmt
echo fmt"{name} is {age} and likes to eat {food}"
# NOTE: fmt takes strings litterally! \n and \t will be seen as text
echo fmt"{name} is {age} and likes \t to eat {food}"

# same as fmt, but sees escape characters as escape characters
# and not as text
echo &"{name} is {age} and likes \t to eat {food}"
