# modules are files outside of your file, that you can use to your advantage
# there are a bunch of modules to import, they are in the "standard library"
import strutils # imports useful string utilities

var
    a = "This is my very long string"

echo a.split() # splits string into sequence (from strutils)
echo a.toUpper() # all letters to exist
echo a.toUpperAscii() # only letters A-Z (normal english)
echo '!'.repeat(10)

# this imports a custom module (if the module is in a different folder, simply: import foldername/myModule)
import myModule except say_goodbye # this will import everything public except the say_goodbye procedure

say_hello("Nick")
# echo subtract(10, 5) # subtract was not exported, so cannot be used

from custom/myOtherModule import draw_line # import specific items from module

draw_line()

import example/[mod1, mod2] # import multiple modules from the same directory

from custom/anotherModule as am import nil # import it so you have to use it by a name

am.call_me("075 674 2342")

include components/variables # this basically copy/paste the code in this module into this file

echo name, age
