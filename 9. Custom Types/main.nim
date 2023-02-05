type
    # MyTuple = (string, int) -> is allowed and also compatible with Person
    Person = tuple[name: string, age: int]
    Animal = tuple # you can declare tuples in multiple ways
        species: string
        edible: bool
    MyRange = range[0..5] # custom type that can only hold values 0-5
    Dog = object # basic objects in nim
        name: string # unlike with tuples, it is mandatory to declare field names
        age: int

var
    jack: Person = ("Jack", 24)
    pet: Animal = ("dog", false)
    my_dog = Dog(name: "mumu", age: 5)

echo jack.name, " is ", jack.age, " years old and has a ", pet.species

var t: MyRange = 4
# var t: MyRange = 6 # wont work, since my range can specifically only hold values 0-5

echo(t)

echo my_dog.name