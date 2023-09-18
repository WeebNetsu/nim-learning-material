# * SEQUENCES
# unlike with arrays, sequences doesn't have to be given a length, it can change at any point
var
    shopping_list: seq[string] # sequence is basically a list or array
    f: seq[int] = @[1, 2, 3]   # they ise '@' to symbolize a sequence
    g = newSeq[int]()          # you can declare a sequence like this too

shopping_list = @["Cake", "Pizza", "Bleach"]

shopping_list.add("Milk")
shopping_list.del(0) # will delete the item at index 0

if "Pizza" in shopping_list:
    echo "We have Pizza and ", shopping_list.len - 1, " other shopping items"

echo shopping_list[0]


import sequtils # this module can modify sequences, arrays AND strings

let
    a = @[10, 20, 30]
    b = @[40, 50, 60, 70]
    c = @[100, 1000]
echo concat(a, b, c) # will return a new sequence with these 3 sequences contaminated

let
    e = "hello"
    d = @[1, 1, 2, 3, 6, 6, 7, 7, 7, 7, 9]
var l = @[5, 6, 7, 7, 8, 4, 5, 7, 2, 5, 7, 1, 7]

# cound number of letters/numbers of the same value is in string/sequences
echo e.count('l') # works on both sequences and strings
echo count(l, 7) # normal function, can use int in multiple ways
echo e.minIndex() # works on strings too (via ASCHII, so 'E' is smaller than 'e')

echo l.minIndex() # returns the index of the smallest/lowest value
echo l.maxIndex() # returns the index of the largest value
echo l.deduplicate() # removes all duplicates
# normal filter, will return all items in array that is less than 5
echo l.filter(proc(x: int): bool = x < 5)
l.keepIf(proc(x: int): bool = x > 5) # same as filter, but modifies original sequence
echo l
echo l.map(proc(x: int): int = x * 2) # normal map, will * 2 all items in array

# if true is passed in, then the array should be SORTED. This method is also faster
echo d.deduplicate(true)
echo d.distribute(3) # will split sequence into 3 parts

var k = @["my", "code", "works"]
echo k.cycle(5) # repeats the sequence 5 times

k.insert(@["I", "was", "added"], 1) # insert array into k at index 1
echo k

echo repeat("XD", 5) # returns a sequence with "XD" repeated 5 times

let
    h = @[1, 2, 3, 4, 5, 6]
    i = @["Hello", "Tom", "!"]
    j = zip(h, i) # will combine the 2 arrays, creating a new one

echo j
echo j.unzip() # will unzip zipped array
