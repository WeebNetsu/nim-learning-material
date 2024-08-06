import std/logging

# this will log to the console/terminal - alternatively we could use FileLogger
# to log to files instead
var logger = newConsoleLogger()

# this will log at info level - meaning it is useful to provide context for the application
# in case an error occurs, having info logs to say what happened before the error may help
# developers find a solution quicker
logger.log(lvlInfo, "now connecting to youtube")
# you get more levels
# lvlError - in case an error occurs, good to print the error out with this
# lvlFatal - in case an error occurs that stops the application process from running
# lvlWarn - warning that something unexpected happen that does not cause an immediate error
#           but might in the future, such as showing a deprecation message or something missing
#           from an .ini file etc.


# defined(release) - true if compiled using -d:release (in release mode and not development)
if not defined(release):
    # debug level is helpful for development - they should not be shipped in release mode
    logger.log(lvlDebug, "we are debugging, production applications should not see this")


# this will allow us to log to files, however, this will only log to a file logs with error or higher levels
# this file will be created in this directory if it does not already exist
let fileLogger = newFileLogger("errors.log", levelThreshold = lvlError)

# so the first 2 will not appear in the log because they are less important than error and fatal level logs
fileLogger.log(lvlInfo, "now connecting to youtube")
fileLogger.log(lvlDebug, "we are debugging, production applications should not see this")
fileLogger.log(lvlError, "big bad")
fileLogger.log(lvlFatal, "very bad fatal thing")

# you can use handlers to make writing logs feel less cumbersome
addHandler(logger) # optionally you can remove this to make sure it does not log to the console
addHandler(fileLogger)

# we can now use this and it will automatically know what to do
# note all of them will be logged to the console (unless you remove the addHandler for it)
# error and fatal will still be added to files
# this is a regular log, but we can specify the log level
log(lvlError, "some error")
# same as above, but no need to specify the level
error("another error")
# regular info log
info("nothing of interest") # Will not be written to errors.log
debug("developer does something")
fatal("eish, we end now")

# you can change how the log should be displayed
logger = newConsoleLogger(fmtStr = "[$time] - $levelname: ")
#[
    $date	Current date
    $time	Current time
    $datetime	$dateT$time
    $app	os.getAppFilename()
    $appname	Base name of $app
    $appdir	Directory name of $app
    $levelid	First letter of log level
    $levelname	Log level name
]#

logger.log(lvlInfo, "more info logger")
logger.log(lvlError, "more info logger")

# built in string format for more verbose outputs
logger = newConsoleLogger(fmtStr = verboseFmtStr)
logger.log(lvlInfo, "even more info logger")

# TO BE CONTINUED https://nim-lang.org/docs/logging.html#12
