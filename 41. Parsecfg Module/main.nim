# this module is used to parse .ini files
import std/parsecfg

const CONF_FILE = "conf.ini"

var conf = loadConfig(CONF_FILE) # load a config file
                                 # read from config
let
    # getSectionValue(tag, item)
    charset = conf.getSectionValue("", "charset")
    username = conf.getSectionValue("Profile", "username")
    usegpu = conf.getSectionValue("System", "--usegpu")

echo charset
echo username
echo usegpu

# create own config
# should be var, since the original variable will be modified
var newConf = newConfig()
# setSectionKey(tag, item, value)
newConf.setSectionKey("", "charset", "utf-8")
newConf.setSectionKey("Package", "name", "My Conf")
newConf.setSectionKey("Package", "--rtx", "on")
newConf.setSectionKey("Package", "version", "3.0.1")
newConf.setSectionKey("Author", "name", "netsu")

# $ to convert to string
echo $newConf

# modify existing config
conf.setSectionKey("Profile", "username", "jackmanman")
# safe config
# conf.writeConfig(CONF_FILE)

# delete from config
conf.delSectionKey("Profile", "description")
# conf.writeConfig(CONF_FILE)

# the config event object
# read open the file for reading
from std/streams import newFileStream

var f = newFileStream(CONF_FILE, fmRead)
assert f != nil, "cannot open " & CONF_FILE
var p: CfgParser
open(p, f, CONF_FILE)

# read the file
while true:
    #[ 
    cfgEof,             ## end of file reached
    cfgSectionStart,    ## a `[section]` has been parsed
    cfgKeyValuePair,    ## a `key=value` pair has been detected
    cfgOption,          ## a `--key=value` command line option
    cfgError            ## an error occurred during parsing
     ]#
    
    # go to the next line
    var e = next(p)
    case e.kind # get event kind
    of cfgEof: break # if end of file
    of cfgSectionStart: ## a `[section]` has been parsed
        echo "new section: " & e.section
    of cfgKeyValuePair:
        echo "key-value-pair: " & e.key & ": " & e.value
    of cfgOption:
        echo "command: " & e.key & ": " & e.value
    of cfgError:
        echo e.msg

# close the file
close(p)
