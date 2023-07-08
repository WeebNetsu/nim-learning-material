# NOTE: Mention in tutorial that this module offers a lot more than is shown in the video, you're just not very math savvy
# so do not understand what most of it does. Non-math loves should still follow a long for the first part
import std/math

# ------- Section for non-math enthusiasts -------
echo E # returns Euler's number
echo MaxFloat32Precision # returns max amount of digits after the decimal that can be trusted in a float
echo MaxFloat64Precision # same as above, but for 64bit
echo PI
echo TAU # Circle constant (2 * PI)
echo Inf # infinity
echo -Inf # negative infinity
echo NaN # Not a Number

echo 2 ^ 6
echo pow(5.0, 2.0) # same as above
echo sqrt(4.0)
echo round(3.5)
echo floor(2.9)
echo ceil(2.9)
echo trunc(1.75) # Truncate
echo isPowerOfTwo(16) # Powers of Two
# echo copySign(10.0, -1.0) # will return -10.0 (copied the '-' sign), ONLY availibe in NEWER versions of Nim
echo cumsummed([1, 2, 3, 4]) # calculates the combined values of array: [1, 3, 6, 10] (1+2=3; 3+3=6; 6+4=10;)
echo radToDeg(1.57079633) # Radians to Degrees
echo degToRad(90.2) # converts degrees to radians
echo gcd(12, 8) # Greatest common divisor
echo floorMod(8, 3) # Floor Modulo
echo floorDiv(8, 3) # Floor Division same as floor(10 / 3), but returns an integer and not float

# ------- Section for math lovers -------
# Tell viewers that I might not know what a lot of these actually do in math, but if they are mathy people
# then they'll at least know that these exist
echo cos(0.15) # Cosine
echo cosh(1.0) # hyperbolic cosine
echo sin(10.0)
echo tan(10.0)
# echo 2.82842712474619 * 2.82842712474619 # this will return 8 (helpful for below)
echo cbrt(8.0) # Get Cube root of value - basically floor(sqrt(8))
# echo almostEqual(PI, 3.14159265358979) # gets if floats are almost equal to each other (only on newwer versions of Nim)
echo binom(6, 2) # Calculates the binomial coefficient, whatever that is

echo fac(4) # calculates factorial of positive integer
echo log(10.0, 2.0) # Computes the logarithm of x to base base

echo Inf.isNaN() # false, Inf is a number
echo isNaN(NaN) # true

echo sum([1, 2, 3, 4]) # 1 + 2 + 3 + 4
echo prod([1, 2, 3, 4]) # 1 * 2 * 3 * 4