import os

echo commandLineParams() # returns parameters passed into commandline
# so -> nim r main.nim test me => @["test", "me"]

for param in 1..paramCount(): # paramCount - number of parameters entered (nim r main.nim par1 par2)
    echo paramStr(param) # returns the parameters, the 0th index is the file name

# useful constants
echo CurDir # gives current directory symbol
echo AltSep # uses alt path seperator
echo DirSep # uses directory seperator (\\ on windows, / on mac/linux)
echo doslikeFileSystem # returns true if file system is dos-like (windows)
echo ExeExt # returns the extention of an executable on the system
# ExeExt will return nothing on Arch Linux, due to there not being
# a valid executable file on Arch. ExeExt will however return 'exe' on windows
echo ExeExts # return array of valid executable file extensions. On Arch
# the above would not return anything. On Windows it will return ["exe", "cmd", "bat"]
echo FileSystemCaseSensitive # true if file system is case sensitive
echo invalidFilenameChars # returns invalid characters to have in file names
echo invalidFilenames # returns array of invalid file names for the OS (Currently this is Windows only)
echo ParDir # returns characters used to reference parent directory
echo PathSep # character used to seperate components in the PATH variable

echo "path" / "to" / "file" # / will add the strings together with '/'
echo joinPath("my", "path", "to/file") # same as above
echo isAbsolute("/home/netsu") # path is absolute
echo isAbsolute("netsu/Documents") # path is not absolute

# below returns path to directory
echo getHomeDir()
echo getConfigDir()
echo getTempDir()
echo getCurrentDir()
echo getAppDir() # returns location (folder) of application EXECUTABLE
echo getAppFilename() # returns the path to executable and the executable name

setCurrentDir("mydir") # change current directory
setCurrentDir(ParDir) # lol, change it back

echo absolutePath("test/is/cool") # returns absolute path with the following appended
echo expandFilename("lolz.txt") # returns absolute path to existing file
echo extractFilename(expandFilename("lolz.txt")) # removes the path and only returns the file
var myWeirdPath = "/home//netsu///Documents"
echo myWeirdPath
echo normalizedPath(myWeirdPath) # normalizes the path for the OS

echo fileExists("lolz.txt") # true if file exists
echo fileNewer("main.nim", "lolz.txt") # returns true if main.nim is newer (or has been modified after) lolz.txt
echo getCreationTime("main.nim") # gets creation (last modified) time of file in seconds and nanoseconds
# below splits file into dir (path), name (lolz) and ext (.txt) [aka a tuple]
echo splitFile(getCurrentDir() / "lolz.txt")

echo sameFile("main.nim", "lolz.txt") # true if the 2 files are the same file or directory
echo sameFileContent("main.nim", "main.nim") # true if the 2 files share the same content

var file: string = "secret"
file = addFileExt(file, "txt") # add extension to file IF there is not one there already
echo file

echo file.changeFileExt("html") # changes file extension
echo file.changeFileExt("") # remove file extension

var myPath: string = "/home/netsu/Documents"
# below returns 0 if 2 paths are the SAME, it will return more than 0
# if the paths are not the same. On a filesystem that is caseinsensitive,
# the below will compare paths caseinsensitively
echo cmpPaths(myPath, "/home/netsu/Documen")

# below will copy a directory and it's content to a new location
# the below will also give the copied folder NEW permissions,
# the new permissions will be the ones that are given
# by DEFAULT when creating a new file/folder
copyDir("mydir", "testDir")

# same as above, but preserves the folder/file permissions
copyDirWithPermissions("mydir", "alsoDir")

# same as above, but just for files
copyFile("lolz.txt", "mydir/lolz.txt")
copyFileWithPermissions("lolz.txt", "alsoDir/lolz.txt")

createDir("Noice Directory") # creates directory
echo dirExists("Noice Directory") # true if the directory does exist
# the below combines the above 2 commands
echo existsOrCreateDir("My Directory")

# the below can do 2 things.
#   1 - Rename a directory
#   2 - Move the CONTENTS of a direcory into another direcory (then delete original), 
#       but ONLY if directory it is being moved to is EMPTY
# moveDir("My Directory", "BRUH")

# below can do 2 things
#   1 - Rename a file
#   2 - Move AND rename a file (below will be renamed pp -> bigpp)
# moveFile("pp", "BRUH/bigpp")

removeDir("BRUH") # deletes a folder and everything in it
# removeDir("BRUH", true) # check if folder exists, then delete it (if it does not exist, an OSError will be thrown)
removeFile("myfile.txt") # deletes a file
echo tryRemoveFile("x.js") # tries to remove file. Returns false if failed, true if success or if the file does not exist

#[ 
    File permissions:
        fpUserExec,  ## execute access for the file owner
        fpUserWrite,  ## write access for the file owner
        fpUserRead,  ## read access for the file owner
        fpGroupExec,  ## execute access for the group
        fpGroupWrite,  ## write access for the group
        fpGroupRead,  ## read access for the group
        fpOthersExec,  ## execute access for others
        fpOthersWrite,  ## write access for others
        fpOthersRead  ## read access for others
 ]#

# what file permissions to EXCLUDE from a file (remove permissions),
# the below will remove file permissions if it exists from a file
# but will NOT add any permissions

var perms = getFilePermissions("lolz.txt") # returns a files file permissions
exclFilePermissions("lolz.txt", {fpGroupExec, fpGroupWrite, fpGroupRead})
echo getFilePermissions("lolz.txt") # returns a files file permissions
# below will ERASE other file permissions and apply NEW permissions
setFilePermissions("lolz.txt", {fpUserExec, fpUserWrite, fpUserRead})
echo getFilePermissions("lolz.txt")
setFilePermissions("lolz.txt", perms) # restore file permissions to default
echo getFilePermissions("lolz.txt") 
echo getFileInfo("lolz.txt") # returns ton of file info
echo getFileSize("main.nim") # file size in bytes

putEnv("NODE_ENV", "test") # sets environment variable
echo getEnv("NODE_ENV") # returns environment variable value
delEnv("NODE_ENV") # deletes environment variable
echo existsEnv("PATH") # true if environment variable exists

# below will return 0 on success
echo execShellCmd("dir") # execute shell (terminal) command

echo getCurrentProcessId() # returns app process id
echo isValidFilename("myF^le") # true if file name is allowed cross-platform
echo isValidFilename("myFile")

sleep(1000) # sleeps the system for 1 second

# for env, val in envPairs():
#     # envPairs returns all environment variables and their values 
#     echo env, ": ", val

var loop_path = "/home/netsu/Documents"
# below will print out every path until it gets to the root dir
for path in loop_path.parentDirs():
    echo path

# same as above, but starts at root and works its way up
for path in loop_path.parentDirs(fromRoot=true):
    echo path

# Types of returns from below code:
#   pcFile, ## path refers to a file
#   pcLinkToFile,   ## path refers to a symbolic link to a file
#   pcDir,  ## path refers to a directory
#   pcLinkToDir ## path refers to a symbolic link to a directory

# below loops through a directory and display all file/folder/link etc. in it
for item in walkDir(loop_path):
    # you can: walkDir(loop_path, checkDir=true) which will return an OS error if the directory does not exist
    echo item

let yt_path = loop_path / "YouTube"
# below does the same as above, but also loops throught the folders inside that directory
for item in walkDirRec(yt_path):
    echo item

# below will return all files ending in .mp4
for video in walkFiles(yt_path / "Steve's teacher/Finished/*.mp4"):
    echo video

# returns anything that matches the entered pattern
for item in walkPattern(loop_path / "A*"):
    echo item