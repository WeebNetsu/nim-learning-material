echo "What's your name?"

# we use let, since we don't want to change the user input
let name: string = readLine(stdin) # get user input from standard input

echo "Your name is ", name

import strutils

echo "When were you born?"
let dob = readLine(stdin).parseInt() # convert it into an integer

echo "You are ", 2021 - dob, " years old"
