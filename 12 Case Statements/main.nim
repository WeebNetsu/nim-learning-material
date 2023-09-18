let x = 10

case x
of 1, 3, 5, 7, 9: # multiple values that can be checked
    echo "x is odd"
of 2, 4, 6, 8:
    echo "x is even"
of 10: # single value to check
    echo "x is 10!!"
else: # otherwise do this
    echo "x is not a valid number!"

type
    Color = enum RED, GREEN, BLUE

var text_color = Color.RED

# a case statement has to cover all possible cases!
case text_color
of Color.RED:
    echo "Text Color is Red"
of Color.GREEN:
    echo "Text Color is Green"
of Color.Blue:
    echo "Text Color is Blue"
    # NO else statement needed, since it covers all available cases


case text_color
of Color.RED:
    echo "Text Color is Red"
of Color.GREEN:
    echo "Text Color is Green"
else: # since blue is still left, we may not want to cover that case
    discard # if you don't want to use the else, you can use this to skip it
