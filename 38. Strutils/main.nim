import strutils

echo Letters # returns set of letters
echo Digits # returns set of digits

var spaces = "    Hello World,I am Steve     "
echo spaces.strip() # remove blank spaces from beginning and end of string
echo spaces.strip().split({' ', ','}) # split text into sequence via spaces and commas
echo spaces.contains("ll") # see if string contains these letters/words

# below allows you to do to insert items at specific indexes, almost
# like strformat
# NOTE: we can specify to only use specific indexes (starting at 1)
# so the 3rd item will not be used
echo "$1 is my $2. My fav color is $4" % ["Jack", "friend", "moon", "blue"]

# below does the same as above, but just takes the next item and doesn't care
# what index it is. You can use $$ to escape the '$' character ($$$# -> $<value>)
echo "$# is my $#. My fav color is $#. I have $$$# in my pocket!" % ["Jack", "friend", "moon", "200"]

# below returns the index of an item in an array,
# 1 -> the index it has been found at
# -1 -> not found
# -2 -> There is more than one item with the same pattern
echo abbrev("plo", ["park", "plot", "plaza"]) # 1
echo abbrev("plo", ["park", "plot", "plop"]) # -2
echo abbrev("plo", ["park", "nick", "pizza"]) # -1

var a: string = "Hello"
a.add(" World!")
# below will add text to the existing string
a.addf(" My name is $1", ["Nick"])
echo a

# below aligns text to right with 30 characters (above text length is
# 28 characters, so it will add 2 spaces to the strat of the text)
echo align(a, 30)
# same as above, but text will be aligned to the left
echo alignLeft(a, 35) & "is aligned"
# same as above, but text will be aligned to the center
echo center(a, 50, ' ') & "is aligned"

# capitalize first letter in string
echo capitalizeAscii("i am very cool")

echo a.contains("name") # true if string contains substring "name"
echo a.startsWith("Hello") # true if string starts with word
echo a.endsWith("Nick") # true if string ends with string

var b = "I am very cool. It is very\ninteresting to see very high\nplaces from very far away."
echo b.count("very") # returns amount of times word appears in string
echo b.countLines() # amount of lines in string
b.delete(3 .. 10) # deletes items at index 4 up to 9 (both included)
echo b

let c = """
    Hello World!
        This is
            Intented!
"""
echo c.dedent() # unindents the first word in string string
# below will indent all lines in text by 10 spaces
# note: below does not preserve the new line characters
echo indent(dedent(c), 10)
echo indentation(c) # amount of spaces used in indentation

let d = """The name's Jack. Pronounced "Mack". I am\was cool"""
echo d.escape() # escapes all the special characters
echo d.escape(prefix=":", suffix=";") # to modify the prefix and suffix

let k = d.escape()
echo k.unescape() # escape, but does the oppisite

let e = "0b_0100_1000_1000_1000_1110_1110_1001_1001"
echo fromBin[uint8](e) # converts binary to unsigend 8-bit integer

let f = "10000000000"
# insert seperator (mainly useful for numbers stored in string format)
echo insertSep(f)
echo insertSep(f, sep='-', digits=2)

let g = 2014
# converts an integer to a string
echo intToStr(g)
echo intToStr(g, 6) # minimum amount of characters 

echo isAlphaAscii('a') # checks if item exists in alphabet
echo isAlphaAscii('-') # false
echo isAlphaAscii('9') # false

echo isAlphaNumeric('c') # same as above, but includes numbers
echo isAlphaNumeric('9') # true
echo isAlphaNumeric('-') # false

echo isDigit('9') # check if it's a number between 0 and 9

# check if string is empty or only contains white space
echo isEmptyOrWhitespace("")
echo isEmptyOrWhitespace("     ")

echo isLowerAscii('c') # check if character is lowercase
echo isUpperAscii('C') # check if character is uppercase

echo toLowerAscii("Hello World") # convert string/character to lowercase
echo toUpperAscii("Hello World") # convert string/character to uppercase

# check if character is a space
echo isSpaceAscii(' ')
echo isSpaceAscii('\n') # true

# merges array of strings together
echo ["Eat", "Work", "Sleep", "Repeat"].join(" -> ")

let h = "my name is tom and I am my worst enemy";

# replace text
# NOTE: this will trigger on any match! So: name -> naree
echo h.replace("am", "are")

# will replace both 'my' and 'worst' with 'your' and 'ultimate'
# NOTE: this will trigger on any match! So: enemy -> eneyour
echo h.multiReplace([("my", "your"), ("worst", "ultimate")])

# same as above but will only trigger on words
echo h.replaceWord("my", "your")

# parseBiggestInt -> convert string to int
# value error if string is not a number
echo parseInt("99923") + 9

# converts string to boolean
# true -> y, yes, true, 1, on
# false -> n, no, false, 0, off
# value error if not valid string
echo parseBool("yes")
echo parseBool("off")

var i = "xxHelo World...."
removePrefix(i, 'x') # removes 'x' from start of string
echo i
i.removeSuffix('.') # remove '.' from end of string
echo i

# repeat text 10 times
echo "Good boy! ".repeat(10)

echo h.find("my") # returns index of SUBstring (-1 if not found)
echo h.rfind("my") # same as above, but from behind (NOT word, substring!)

echo toBin(100, 10) # converts int to binary of 10 characters
echo toHex("Hello") # convert string/int to hexadecimal
echo toHex(2004)

var j = "3.14150000000"
j.trimZeros('.') # . -> seperator; removes 0s from string float value
echo j
