# this is like the package.json of Nim projects
# Package

version       = "0.1.0"
author        = "WeebNetsu"
description   = "Example of Nimble"
license       = "MIT"
srcDir        = "src"
bin           = @["project"]


# Dependencies

# note you have to manually add dependencies
requires "nim >= 2.0.0"
requires "nimx >= 0.2"
