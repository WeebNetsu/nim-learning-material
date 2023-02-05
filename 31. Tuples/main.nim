# TUPLES
# tuples have a fixed size (like arrays), but can contain multiple types, unlike arrays and sequences
var
    firstTuple: (string, float) = ("Cat", 45.6) # tuple
    # the below are named tuples
    example: tuple[name: string, age: int] = ("Luke", 59) # tuple
    person: tuple[name: string, age: int] # tuple

echo firstTuple[0] # access item in tuple

person = ("Jack", 55)
echo person
echo example.name   

var pet: tuple[animal: string, breed: string, cool: bool];
pet[0] = "Cat" # set the 0th index (animal) to 'cat'
pet.animal = "Dog" # you can also use this method to reassign values in the tuple
pet.breed = "Husky"
pet.cool = true

echo pet