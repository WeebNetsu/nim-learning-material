import std/terminal # allows you to do cool stuff with the terminal

# NOTE: code commented out works! Was just annoying to run every time

# the below will style the text it displays
stdout.styledWriteLine(fgRed, "This text is red") # make text color red
stdout.styledWriteLine(fgWhite, bgBlue, "This text is white with a blue background")
stdout.styledWriteLine({ styleBright }, "Bright/Bold text")
stdout.styledWriteLine({ styleBlink }, "Blinking text")
stdout.styledWriteLine({ styleUnderscore }, "Underscored text")
# the above will only affect that one line of text

# the below will affect any text that gets displayed to the terminal after it
setBackGroundColor(bgRed, true) # true - bright
echo "Red BG"
setForeGroundColor(fgBlue, false) # false - dark
echo "Blue FG"

stdout.setStyle({styleReverse}) # will reverse the style (blue bg and red fg now)
echo "hello!"

resetAttributes() # resets all attributes to their normal values

#[ 
    List of availible colors & styles:
        Background Colors:
            bgBlack, bgRed, bgGreen, bgYellow, bgBlue, bgMagenta, bgCyan, bgWhite, bgDefault
        Foreground Colors:
            fgBlack, fgRed, fgGreen, fgYellow, fgBlue, fgMagenta, fgCyan, fgWhite, fgDefault
        Text Styles:
            styleBright, styleDim, styleUnderscore, styleBlink, styleReverse, styleHidden, styleStrikethrough, styleItalic
            [NOTE: styleItalic will appear reversed if the terminal does not support it!]
 ]#

stdout.write("Hello World")
stdout.eraseLine() # will erase the current line (so the above wont be displayed in the terminal)
echo "some cool"
echo "text"
stdout.cursorUp(2) # moves the cursor back up 2 lines in the terminal
echo "test"
stdout.cursorDown(1)
stdout.cursorForward(2) # cursorBackwards also exists
write(stdout, "Hello World!")

# stdout.eraseScreen() # will erase (not clear) everything in the terminal and return the cursor home

# var s = getch() # will halt all processes until a character has been entered (user input)
# echo s

hideCursor() # hides the cursor
showCursor()

# stdout.setCursorPos(10, 5) # sets cursor position 10 x and 5 y from the top left of terminal
# echo "My cursor is here"

# below will get user input, but will not display to the user what is being typed
# var a = readPasswordFromStdin("Password: ")
# echo a

echo "\n", terminalHeight() # get terminal height - in rows
echo terminalWidth() # get terminal width - in columns
echo terminalSize() # returns terminal width and height
