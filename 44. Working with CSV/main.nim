import std/parsecsv

#[
CsvParser = object of BaseLexer
    row*: CsvRow -> current row
    filename: string
    sep, quote, esc: char
    skipWhite: bool
    currRow: int
    headers*: seq[string] -> columns defined in csv file
]#

var parser: CsvParser

# open users.csv, separator is ;
parser.open("users.csv", ';')

# by default the header titles are empty
echo parser.headers
# first read the header row to get the columns
parser.readHeaderRow()
# now you will always have access to the header row
echo parser.headers

echo parser.readRow() # read a row, shows true if the row was read
echo parser.row # read the current row data
echo parser.rowEntry("username") # get a value in a row by its column

echo parser.readRow()
echo parser.row
echo parser.rowEntry("email")

# below will return the number of rows that has been read/processed
echo parser.processedRows()

# close the file
parser.close()
