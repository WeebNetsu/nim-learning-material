# tables are like arrays, but they contain key + value pairs (like tuples)
import std/tables

var
    # since there are multiple types of tables, we have to convert it to the one we want
    user1 = {"username": "nick17740", "password": "p@sW04d"}.toTable()
    # tables are unordered by default, this increases its speed
    # the below is a table that keeps its order, at the cost of speed
    user2 = {"username": "nick17740", "password": "p@sW04d"}.toOrderedTable()
    # the count table gives an additional parameter for displaying number of duplicates
    user3 = {"username": "nick17740", "password": "p@sW04d", "username": "nick17740"}.toCountTable()

echo user1
echo user1["username"]
user1["username"] = "Mike123" # change value of that key
echo user1["username"]

echo user2 # this one kept its order
user2["securityQuestion"] = "What is your dogs name?" # add new key/value to table
echo user2

if user2.hasKey("securityQuestion"): # check if key exists in table
    echo "This user has a security question"

echo user3 # will show a 2 next to username, to display there are duplicates

var
    friends = initTable[string, int]()     # creates an empty table
    letters = initCountTable[char]()       # creates an empty count table
    a = initOrderedTable[string, string]() # creates an empty ordered table

friends["Jack"] = 18 # add data to table
# string can also be converted to count table
letters = toCountTable("Hello World! This is a great place to be!")
a["lol"] = "cat"

echo friends
echo letters
echo friends == friends # you can do comparison operations on same type of tables
friends.clear() # empties a table
echo friends

letters.inc('H') # increments the amount at key 'H' (CountTables only)
echo letters
echo letters.largest() # returns the key (and value) with the highest count (value)
echo letters.smallest() # opposite of above

# note these functions can also work on other tables, not just count tables
echo letters.contains('p') # true if item exists inside of table
letters.del(' ') # deletes item from table
echo letters

var b: int
echo letters.pop('i', b) # same as 'del', but makes 'b' = to the value and returns true if item existed in table
echo b

echo letters.getOrDefault('z') # gets the item, if it does not exist, return the default for the type (integer would default to 0)
echo letters.hasKey('l') # true if key exists in table
# returns true if key exists in table, however, if it does not, then
# it will add that key to the table (does not work with count tables)
echo friends.hasKeyOrPut("Nick", 20)

echo len(friends) # returns length  (amount of item in) of a table

let moreLetters = toCountTable("My name is Steve and I am very cool!")
letters.merge(moreLetters) # merges 2 tables together
echo letters

letters.sort() # sorts in (value) descending order highest number to lowest
echo letters

for key in letters.keys(): # loop through the table keys
    echo key

# mpairs allows you to loop through the key and value
for key, value in mpairs(letters): # mpairs or pairs, both works
    echo key, ": ", value

# same as .keys(), but only values this time
for value in mvalues(letters): # mvalues or values, both work
    echo value
