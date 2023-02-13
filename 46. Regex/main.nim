import std/re

# below is an example of a regex string
let a = re"\S" # \S -> any character that is not a whitespace

echo contains("Hello World", a)
# re"e" -> find the letter 'e', start at index 6
echo contains("Hello World", re"e", 6) # false

# below will find the ven number in the text and return its index
echo find("I am 28 tomorrow", re"\d*[02468]") # same as contains but returns the starting index of the pattern
echo find("I am 28 tomorrow", re"\d*[02468]", 7) # same as above but start from index 7

# finds all the substrings with even numbers and returns it as a sequence
echo findAll("I am 28 tomorrow. Today I am 27", re"\d*[02468]")

# below will check if the text ends with an even number
echo endsWith("I am 28", re"\d*[02468]")
# same as above but checks the start
echo startsWith("50 days ago", re"\d*[02468]")

# match only returns true if the ENTIRE string matches the regex
echo match("I am 28 tomorrow", re"\d*[02468]")
echo match("28", re"\d*[02468]")
# same as above but returns the length of the matched string, -1 if not a match
echo matchLen("28", re"\d*[02468]")

# replaces any matches of a regex with the givin value
echo multiReplace("I am 28 tomorrow. Today I am 27", [(re"\d*[02468]", "NUMBER"), (re"tomorrow", "today")])
echo replace("I am 28 tomorrow. Today I am 27", re"\d*[02468]", "NUMBER") # same as above but only for one regex
 # same as above but can modify the string with the matched values in the string ($1 = am, $2 = even number)
echo replacef("I am 28 tomorrow. Today I am 27", re"(am) (\d*[02468])", "$1 (but not is) $2$2")

# split a piece of text into a seq wherever the match is true (note that true matches will be removed)
echo split("I am 28 tomorrow. Today I am 27", re"\d*[02468]")
