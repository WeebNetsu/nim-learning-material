var 
    # the below are called bitsets
    # these types of sets are limited and can only store very small data types
    # (Like characters), this is for performance reasons...
    my_set: set[char] = {'a' .. 'z', 'A' .. 'Z', '0' .. '9'} # store all the letters in the alphabed and all numbers (as characters)

echo my_set

import std/sets # to use Hash and ordered sets

# hash sets do not have the limitations of normal sets
# they cannot contain duplicates and is not ordered
let a = toHashSet([1, 5, 6, 3, 4, 5])
echo a

# an ordered set is the same as a hash set, but keeps the original
# order of the set (in return for performance of course)
var b = toOrderedSet(["hello", "world", "! I", "am", "cool"])
echo b

let c = toHashSet([1, 5, 9, 8, 0])

# below will return what is in both set A and set C
echo a * c # same as: a.intersection(c)

# will merge the 2 sets
echo a + c # same as: a.union(c)

# returns what is inside A and not inside C
echo a - c # same as a.difference(c)

# returns what is in one or the other, but not both of the sets
echo a -+- c # same as a.symmetricDifference(c)

let d = toHashSet([9, 0, 5])

# returns true if D is a subset of C (if all in D exists in C)
echo d <= c

# returns true if D is a proper subset of C, meaning that
# C has more items than D and that D is a subset of C
echo d < c

let e = toHashSet([2, 10])
# returns true if set D and set E has NONE of the same items
echo d.disjoint(e)

echo c == d # returns true if both sets are the same size with same items
echo card(c) # return set length; same as len(c)

clear(b) # empties a set
echo b

# return true if C set contains the value 9
echo c.contains(9) # same as 9 in c

# if B contains "cool", then return true; ELSE if B does NOT
# contain "cool" add it to B and return false
echo b.containsOrIncl("Cool")
echo b
echo b.containsOrIncl("Cool")

# ! TUTORIAL: Do not include below in tutorial
echo e.map(proc (num: int): int = num * 2)
