import ropes

# Ropes can represent very long strings efficiently; in particular, concatenation is done in O(1) instead of O(n)

let a = rope("Hello World") # create a rope
echo $a # convert a rope back into a string

# basically strformat for ropes
var b = "$1 is $2 and likes to eat $3" % [rope("Nick"), rope("16"), rope("pizza")]

echo b
echo b[5] # can get specific letter in rope
echo len(b) # get rope length

let c = rope(". And I like to eat it too!")
echo b & c # concationation (can do ropes+strings as well)

# !!!!!!!!!!!!!!! I ENDED HERE !!!!!!!!!!!!!!
# add rope c to rope b
b.add(c)
echo b

# can be used to concationate an Array of ropes
echo &[rope("Hello "), rope("World")]

let inFile: Rope = rope("Hello there, I am cool")
# note you have to compile from inside this folder for below to work
# will return false if file not found
echo equalsFile(inFile, "file.txt")

var f: File = open("written.txt", fmWrite)
write(f, b) # writes rope into file
close(f)