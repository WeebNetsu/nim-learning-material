# Most of these modules are small, and are probably still in development
# they may change in the future, so mention in the tutorial that if something
# in this tutorial does not work, it could've possibly been depricated or changed


# CPUINFO
# I just do this so other modules won't cause problems, you won't have to use 'as' in tutorial
import cpuinfo as cpuinfo

# counts amount of processors your system has
# no kidding, this was the only thing in the docs for cpuinfo
echo cpuinfo.countProcessors()


# CSTRUTILS
import cstrutils as cstrutils

var a: cstring = "Hello world!" # I guess a C-style string?
echo cstrutils.startsWith(a, "He") # checks a cstring if it starts with "He"
echo cstrutils.endsWith(a, "!") # checks a cstring if it ends with "!"


# STRMISC
import strmisc as strmisc

# the below lengthens the tabs (sets them to 4 spaces)
# NOTE: Tabs work in columns, so the below will look like this
# Hello   World   I   am  very    cool
# uneven tab spacing, BECAUSE, they work in columns, so |Hell|o   |Worl|d   |I   |am  |very|    |cool
# will be the output, since the columns are now 4 spaces wide (those "|" represents the tabs)
echo strmisc.expandTabs("Hello\tWorld\tI\tam\tvery\tcool", 4)

echo strmisc.partition("var:int", ":") # will return a tuple with 3 strings, splitted by the FIRST ":"
echo strmisc.partition("foobarbar", "bar") # will return a tuple with 3 strings, splitted by the FIRST "bar"
echo strmisc.partition("foobarfoobar", "foo") # will return a tuple with 3 strings, splitted by the FIRST "foo"

echo strmisc.rpartition("foobarfoobar", "foo") # same as above, but will split by the LAST "foo"


# UNIDECODE
import unidecode as unidecode

# this will decode the unicode string to the closest UTF-8 type string
echo unidecode.unidecode("北京") # Bei Jing
echo unidecode.unidecode("さようなら") # lol, almost like a better google translate


# WORDWRAP
import std/wordwrap as wordwrap

var b: string = "Hello! My name is Steve! I come from a land far in the east called Shubalubagust and it is a great place."
echo wordwrap.wrapWords(b, maxLineWidth = 20, splitLongWords = true) # applies word wrap to text


# DISTROS
import distros as distros

echo distros.detectOs(Manjaro) # detect your OS or Linux Distro
#[
    AVAILIBLE CHECKS
  Windows,                  ## some version of Windows
  Posix,                    ## some Posix system
  MacOSX,                   ## some version of OSX
  Linux,                    ## some version of Linux
  Ubuntu, Debian, Gentoo, Fedora, RedHat, OpenSUSE, Manjaro, Elementary, Zorin,
  CentOS, Deepin, ArchLinux, Antergos, PCLinuxOS, Mageia, LXLE, Solus, Lite,
  Slackware, Androidx86, Puppy, Peppermint, Tails, AntiX, Kali, SparkyLinux,
  Apricity, BlackLab, Bodhi, TrueOS, ArchBang, KaOS, WattOS, Korora, Simplicity,
  RemixOS, OpenMandriva, Netrunner, Alpine, BlackArch, Ultimate, Gecko, Parrot,
  KNOPPIX, GhostBSD, Sabayon, Salix, Q4OS, ClearOS, Container, ROSA, Zenwalk,
  Parabola, ChaletOS, BackBox, MXLinux, Vector, Maui, Qubes, RancherOS, Oracle,
  TinyCore, Robolinux, Trisquel, Voyager, Clonezilla, SteamOS, Absolute, NixOS, ## NixOS or a Nix build environment
  AUSTRUMI, Arya, Porteus, AVLinux, Elive, Bluestar, SliTaz, Solaris, Chakra,
  Wifislax, Scientific, ExTiX, Rockstor, GoboLinux, BSD, FreeBSD, OpenBSD,
  DragonFlyBSD, Haiku
 ]#

# Returns the distro's native command line to install the software, AND if it requires sudo
# Just because the native install tool gets returned, DOESN'T mean it's the one that the distro
# uses now, like Manjaro uses pacman (pkg is for build packages)
echo distros.foreignDepInstallCmd("tmux")

# add dependencies for your application
distros.foreignDep "lbiblas-dev"
distros.foreignDep "libvoodoo"

# print out the dependencies your app needs (and how to install them with the NATIVE install tool)
distros.echoForeignDeps()


# SUMS
import std/sums as sums

# will add all the values in the array together to give you the total
echo sums.sumKbn([1, 2, 3])

import std/random as random # import the random module

random.randomize() # just like in Lua, Delphi and C++, you need to specify something to generate new random values

echo random.rand(5.9) # returns a random number between 0.0 and 5.9

var arr = [1, 5, 6, 7, 8]
echo random.sample(arr) # picks random value from array/seq/etc.
echo random.sample(@["jack", "mike", "nils", "lulu"])

random.shuffle(arr) # randomizes array order
echo arr

# PARSEUTILS
import std/parseutils

const text = "Hello World"

# return whatever is between the first 'e' in the string and the end of the string
echo captureBetween(text, 'e')
# return whatever is between the first 'e' and first 'r' in the string
echo captureBetween(text, 'e', 'r')
# return whatever is between the first 'o' (starting at index 5) in the string and the end of the string
echo captureBetween(text, 'o', start = 5)

var c: float64
    # returns string length and converts the string to c float64 and
    # store it inside the 'c' variable
    # you also have parseBiggestInt, parseBin, parseChar, parseFloat, parseInt
    # there are c lot more in the docs, but they all do basically
    # the same thing, just with different types
echo parseBiggestFloat("19.23532212", c)
echo c


# RANDOM NUMBERS
import random

# randomize seeds the numbers, so they are more random
randomize()
# randomize(2) # you can manually pass in a seed

# without randomize, the below will return the same value on every run
# random numbers include min and max values passed in
echo rand(100) # radnom number between 0 and 100
echo rand(1..5) # random number between 1 and 5
echo rand(3.14) # random number between 0 & 3.14
echo rand(int8) # random number that can fit in a integer of 8 bytes

let x = @["Mark", "Jack", "Luke", "Nick"]
echo sample(x) # returns random value from array, sets, sequences...

var z = [1, 2, 3, 4, 5, 6, 7, 8] # has to be var to be reordered
shuffle(z) # reorder sequence in random order

echo z
