var x = 20

while x > 10:
    dec x # you can use inc & dec in place of ++ and --

    if x == 15:
        continue # skip iteration
    
    echo "loop! ", x

    if x == 12:
        break # exit loop before it finishes
