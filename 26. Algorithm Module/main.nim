import algorithm

var
    a: array[6, int]
    b: array[5, int] = [5, 1, 8, 9, 7]
    c: array[5, int] = [5, 1, 8, 9, 7]
 # the below will fill the array with a specific value
 # fill(where to start, how many to fill, what to fill it with)
 # the below will create [0, 9, 9, 0, 0, 0], because the array has 6 spaces open
 # we start at index 1 (note, not 0), then for the next 2 spaces we fill with the value 9
a.fill(1, 2, 9)
echo a

# the below will fill all spaces with 5
a.fill(5)
echo a

# the below will reverse the items from index 1 FOR 3 indexes, so
# 5, 1, 8, 9, 7 -> will become -> 5, 9, 8, 1, 7
b.reverse(1, 3)
echo b

c.reverse() # this will just reverse the entire array
echo c

# returns a squence with indexes 1 to 3 (reversed)of array c
var d = c.reversed(1, 3)
echo d

# do a binary search or something in an array
# returns the index of the item if found, otherwise it will return -1
echo binarySearch(['a', 'b', 'c', 'd'], 'c') # 2
echo binarySearch(['a', 'b', 'c', 'd'], 'f') # -1

# rotate an array
var e = [1, 2, 3, 4, 5, 6]
e.rotateLeft(0 .. len(e) - 1, 1) # rotate the whole array left (from index 0, to the very last index) by 1
echo e

# the below does the same as the above, BUT it does not modify the original array
echo rotatedLeft([1, 2, 3, 4, 5, 6], 0 .. len(e) - 1, 1) # rotate the whole array left (from index 0, to the very last index) by 1
