#[ 
    This module contains methods that allows you to extract
    substrings without needing to use Regex!

    it uses a scanf macro, these values may be of importance:
    $b	Matches a binary integer. This uses parseutils.parseBin.
    $o	Matches an octal integer. This uses parseutils.parseOct.
    $i	Matches a decimal integer. This uses parseutils.parseInt.
    $h	Matches a hex integer. This uses parseutils.parseHex.
    $f	Matches a floating-point number. Uses parseFloat.
    $w	Matches an ASCII identifier: [A-Za-z_][A-Za-z_0-9]*.
    $c	Matches a single ASCII character.
    $s	Skips optional whitespace.
    $$	Matches a single dollar sign.
    $.	Matches if the end of the input string has been reached.
    $*	Matches until the token following the $* was found. The match is allowed to be of 0 length.
    $+	Matches until the token following the $+ was found. The match must consist of at least one char.
    ${foo}	User defined matcher. Uses the proc foo to perform the match. See below for more details.
    $[foo]	Call user defined proc foo to skip some optional parts in the input string. See below for more details.
 ]#

import std/strscans

const input = "(1,2,4)"
var x, y, z: int

# scanf returns true if the values matches what was expected
# it then stores them in the provided variables
# in this case $i checks for an integer
if scanf(input, "($i,$i,$i)", x, y, z):
    echo "Has matched!\n\tx: ", x, "\n\ty: ", y, "\n\tz: ", z

# check if input string matches an ISO date followed by an identifier followed
# by whitespace and a floating point number:
var year, month, day: int
var identifier: string
var myfloat: float
if scanf(input, "$i-$i-$i $w$s$f", year, month, day, identifier, myfloat):
    echo "yes, we have a match!"

const dateInp = "2002-08-05 CZF243 12.30"
if scanf(dateInp, "$i-$i-$i $w$s$f", year, month, day, identifier, myfloat):
    echo "This date is correct!"
