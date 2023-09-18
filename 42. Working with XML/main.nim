import std/xmltree

# you can use xmltree to generate XML
# for tutorial: explain what XML is

# create a element <fullName></fullName>
var nameElement = newElement("fullName")
# add text to the element
nameElement.add(newText("Jack Smith"))
# here I did not add () to show that you can use this
# syntax to make it look neater if you prefer it
# add a comment
nameElement.add newComment("This is the users full name")

var emailElement = newElement("email")
emailElement.add(newText("jack@gmail.com"))

# get text inside an element
echo emailElement.innerText()

var addressElement = newElement("address")
# you can add elements inside other elements
addressElement.add(newElement("street"))
addressElement.add(newElement("postalCode"))
addressElement.add(newElement("country"))

# returns amount of children in element
echo len(addressElement)

# delete a child of an XML element
addressElement.delete(2) # deletes country

# create the XML tree
var myXML = newXmlTree("userData", [nameElement, emailElement, addressElement], {"secure": "no",
        "class": "user data-holder"}.toXmlAttributes)

# use $ to convert to string
echo $myXML

echo xmlHeader # gives generally used XML header

# return the 0th element in the xml tree
echo myXML[0]

# get amount of attributes on xml node
echo myXML.attrsLen()
# get the address element and all its children
echo myXML.child("address")

# will find all of the <email> tags and return a sequence
echo myXML.findAll("email")

# clears an xml node of all its children
myXML.clear()
echo $myXML

# insert a new element at selected index
myXML.insert(newElement("age"), 0)
echo $myXML

# get the name of an element
echo myXML.tag

# changes the tag name of an element
myXML.tag = "myTag"
echo $myXML


import std/xmlparser

# load an xml file
let xml = loadXml("index.xml")

echo $xml

# convert a string to xml
# parseXml will return an XML node
let nxml = parseXml("""
<person>
  <name>Jack</name>
  <surname>Magee</surname>
  <address>
    <street>14 Pall Mall str.</street>
    <local>New York</local>
    <postalCode>1932</postalCode>
  </address>
</person>
""")

echo $nxml
