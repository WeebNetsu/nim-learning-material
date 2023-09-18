import json, options # import json to work with json

# Convert Data into JSON
let age = 19

# the %* {} allows you to create a JSON object
let convertedJSON = %* [
    {                    # this can also be on one line, I split it so it's easier to read
        "name": "Steve",
        "age": age,
        "hobbies": ["Eating", "Coding"],
        "username": nil, # same as null value in json
        "type": "human"
    },
    {
        "name": "Jack",
        "age": 24,
        "hobbies": ["Hunting"],
        "username": "HunterBoy247",
        "type": "lizard"
    },
]

echo convertedJSON

# Parse and Use JSON
# the $ converts a JSON object into a string, since parseJson takes a string NOT a JSON object
let parsed = parseJson($convertedJSON)[0] # parses first item in JSON into a Nim object
echo parsed["name"].getStr() # getStr converts the value into a Nim string data type
var jsonAge = parsed["age"].getInt() # converts into Nim integer (would get errors without it)
echo parsed["username"].getStr("anon") # you can pass in a default value to return if it does not exist
# getBool and getFloat exists as well
echo jsonAge + 20

echo parsed["hobbies"][1].getStr() # access arrays
# below code will add "old" field to json
# we use "%" to convert normal Nim type to json type
parsed.add("old", %false)
echo "I am old? ", parsed["old"].getBool()
echo parsed.contains("username") # check if key exists in json object

let a = parsed.copy() # does a deep copy of json
echo a

parsed.delete("old") # deletes a field from json
echo parsed

# echo $parsed  # converts to string
echo escapeJson($parsed) # converts to string escaping quotes
echo escapeJsonUnquoted($parsed) # same as above, but without quotes before and after
echo hasKey(parsed, "username") # returns true if key exists in object
echo len(parsed["hobbies"]) # length of array in json

# Convert JSON to Nim Object
type
    Person = object
        name: string
        age: int
        # use sequence, since we don't know how many elements is in the array
        hobbies: seq[string]
        username: Option[string] # since username may not exist
        `type`: string           # use `` to allow for preserved words in nim

let jack = convertedJSON[1].to(Person) # convert JSON to Person object
echo jack.hobbies
echo jack.`type` # access Nim preserved word in json

let f = parseFile("./users.json") # parse json from a file
echo f
echo f.pretty(4) # prettify json (indentation of 4 spaces, default = 2)
