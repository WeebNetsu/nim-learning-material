# STILL NEEDS TO BE COMPLETED AND UNDERSTOOD
# https://nim-lang.org/docs/manual.html#userminusdefined-pragmas
#[ # User defined pragmas

# Declare a new pragma named "debug" that enables debug mode.
# The pragma is conditionally applied based on the value of "isDebugMode".
{.pragma: debug.}

# Define a procedure "calculate" with the "debug" pragma, which prints debug information during execution.
proc calculate(a, b: int): int {.debug.} =
    when defined(debug):
        echo "Calculating..."

    result = a + b

discard calculate(1, 2)
# NOTE: link users to https://nim-lang.org/docs/manual.html#pragmas for more pragmas they can use

# Define a custom pragma named "toJson" that converts a type to JSON format.
template toJson(t: typedesc) {.pragma.}

# Define a custom pragma named "log" that logs a message with a specified log level.
template log(level: string) {.pragma.}

# Define a type "Person" and apply the "toJson" pragma to enable JSON serialization.
type
    Person {.toJson.} = object
        name: string
        age: int

    # Define a type "Car" and apply the "log" pragma to log important events.
    type
        Car {.log("info").} = object
            make: string
            model: string
            year: int

        # Use the custom pragmas in the code

        # Calculate the sum of two numbers
        let result = calculate(10, 20)

        # Create a person object
        let person = Person(name: "John Doe", age: 30)

        # Create a car object
        let car = Car(make: "Toyota", model: "Camry", year: 2022)

        # Print the JSON representation of the person object
        echo person.toJson()

        # Log an important event about the car
        car.log("Car successfully started")
            ]#
