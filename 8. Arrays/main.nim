# * ARRAYS
var
    a: array[3, int] = [1, 2, 3]
    b: array[2, string] = ["Jack", "Luke"]
    c = [1, 2, 3, 4, 5, 6, 7]
    # NOTE: You cannot declare an empty array, without defining the length
    e: array[4, bool]
    z: array[2, array[3, int]] = [ # multi dimensional array
        [1, 2, 3],
        [4, 5, 6]
    ]

# note: arrays are created at compile time, so:
let num = 5
const num2 = 6
# var d: array[num, int] # not allowed because let is declared in runtime and not compile time
var d: array[num2, int] # not allowed because let is declared in runtime and not compile time

echo a[0] # indexing starts at 0
echo a[^1] # get the last element
echo a[^2] # get 2nd last element

echo c[1 .. 3] # all from index 1-3
echo c[1 ..< 3] # all from index 1-2

c[1] = 78 # change item at that index
echo c

echo z[0][2] # access item in multi dimensional array
