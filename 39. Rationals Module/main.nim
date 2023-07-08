# this bring the power of rational numbers to Nim (so 3 over 4 or 5 over 10)
import std/rationals

let a = 3 // 4 # 3 over 4
echo $a # will convert to a string

var b = 9 // 5
echo a * b # will times the 2 rational numbers together
# you of course also have /, +, -

b -= 2 // 5 # will subtract 2/5 from 9/5
# you of course also have *=, /= & +=
echo b

echo a > b
# you of course also have <, >=, <=, ==, !=

echo abs(-5//2) # returns absolute (positive) value

var c = Rational[int](num: 6, den: 24) # another way to create rational number
echo c

reduce(c) # reduces rational number until num and denominator no longer has common dividable numbers
echo c # from 6/24 to 1/4

echo c.toFloat() # converts rational to float
echo c.toInt() # converts rational to integer
echo toRational(0.19) # converts to rational
echo toRational(0.19, 20) # converts to rational, but max value of denominator is 20
