block:
    # block statements have a syntax like "if statements", but will always be executed, unlike if statements
    echo "This is a block statement"

block blockName:
    for i in 1 .. 100:
        if i == 50:
            echo i
            break blockName # break out of the block statement
        
        if i == 70: # won't execute, since the forloop broke before it got here
            echo i

let x = 22
block:
    # block statements can be used for scoping
    let x = "hello" # works, since scoping allows it
    echo x
