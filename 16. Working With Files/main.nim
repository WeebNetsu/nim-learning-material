import strutils

let file_content = readFile("readme.txt") # read the file
echo file_content, "\n"

var f: File
if open(f, "readme.txt"): # check if file can be opened
    echo "File successfully opened"
    echo f.readLine() # read single line
    close(f) # close the file after using it

let lines = file_content.splitLines() # split lines into sequences
echo lines

writeFile("myFile.txt", "Hello\nWorld!\tI am here!\\")

var a = open("myFile.txt", fmWrite) # open file in write mode
                                    # you can use fmAppend to append, fmRead to read, fmReadWrite to read and write
a.write("HEYO!") # write to file
a.close()
