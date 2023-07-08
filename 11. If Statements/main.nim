#[ 
    Normal condition operations apply
    >, <, >=, <=
    ==, !=

    and, or, not
    xor -> returns true if one of the conditions are false and the other is true
 ]#

# if statements are very similar to Python

var
    age = 24
    name = "Jack"
    birthday = true

if age > 60:
    echo "You are elderly, may not enter!"
elif age <= 17:
    echo "You are too young. You may not enter"
else:
    echo "You may enter"

    if (name == "Jack" xor birthday): # will run if their name is jack or if it's their bday (only 1 may be true)
        echo "drinks are on us!"

if birthday and (name == "Jack" or age > 30):
    echo "50% off!"

# ternary operator!
var greet = if birthday: "Happy Birthday!" else: "Welcome!"

echo greet
