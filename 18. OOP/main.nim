# NOTE: For tutorial, first do the below import in the SAME file, then move it
# to a new file to show how it can be moved to a different file for easier use
import Animal # import class from outside file (private variables can't be accessed from inside this file)

var timmy = Animal(name: "Timmy", alive: true, fullness: 50)
echo timmy.name

for i in 1 .. 51:
    timmy.feed() # public functions can be called from this file

# Object Inheritance
type
    # NOTE: ref is just used to extend (inherit) from an object
    # rootObj is an object provided by NIM, inheriting from RootObj Allows inheritance for the object
    # without RootObj, other objects would not be allowed to inherit from your object
    Person = ref object of RootObj # create an object (inheritance), this is the correct way to do OOP
        name*: string              # public property
        age: int                   # private property

    Student = ref object of Person # since student inherits from person, it gets name and age as properties
        grade: int
        iq: int

# the below is a method of object student
method study(this: Student) {.base.} = # all methods require base
    # note: this can be anything, self, student, anything, since Nim doesn't have a specific
    # * word for it
    # this is assigned as the student object
    this.iq += 5

# another example, but this time with a return statement
method getIq(this: Student): string {.base.} =
    return this.name & " has an IQ of " & $this.iq

var
    student: Student = Student(name: "Jack", age: 16, grade: 10, iq: 50)
    person: Person

person = Person(name: "Nick", age: 50)
echo person.name # display the name property

echo student[] # display the object
student.study()
echo student.getIq()

if student of Student: # check if an variable is of type object
    echo "student is of object type Student"
