var friends = @["Jack", "Nick", "Lucas", "Paul", "Jesse"]

for index, friend in friends: # index is optional
    echo "Friend ", index, ": ", friend

for friend in friends:
    echo "My Friend: ", friend

for num in 1 .. 5: # loop through numbers
    echo num

for i in 1 ..< 5: # loop from 1 to 4
    echo i

for count in countup(1, 10, 2): # count up to 10, by 2 steps
    echo count

for count in countdown(10, 1): # count down (by 1 step, default)
    echo count

var letter_count: int = 0

for letter in "Hello World":
    if letter == 'o':
        letter_count += 1 # add 1 to variable

echo letter_count
