type
    Animal* = object  # normal object
        name*: string # these are public variables
        alive*: bool
        fullness*: int

proc unlive(animal: var Animal) =
    animal.alive = false
    echo animal.name, " was overfed."

proc feed*(animal: var Animal) =
    if animal.fullness < 100:
        animal.fullness += 1
    else:
        # if the animal is over fed
        animal.unlive()

proc isFull*(animal: Animal): bool = # if no 'var' is included, then the variables in Animal class cannot be modified
    # animal = this = self
    return animal.fullness > 80
