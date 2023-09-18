var
    x: int = 5
    y: float = 10.5
    z: string = "15"

# Note: integer and floats cannot be added together, both either has to be int or float
echo x.type # you can use .type to check the type of a variable
echo float(x) + y #[ float() convert to float ]#
echo x.toFloat() + y # also converts to float (NOTE: () are optional)
echo x + int(y) # convert to int. NOTE: This always rounds DOWN
echo x + y.toInt # convert to int. NOTE: This rounds to the closest integer
echo type($x) # '$' converts to a string, you can also use type() like that

import strutils # required to use parseInt

echo z.parseInt() + x # parseInt converts string to integer
echo z.parseFloat() + y # parseFloat converts to float
