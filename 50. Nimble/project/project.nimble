# start project with `nimble init`

# more here https://github.com/nim-lang/nimble#nimble-usage
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

# useful commands
# nimble check - makes sure your .nimble file is valid and has no errors
# nimble install package-name - install a package, although you still need 
#   to manually add the dependency to the .nimble file
# nimble install package-name@#head - download the latest commit from the repo of a package
# nimble install package-name@0.5 - install a specific version
# nimble uninstall package-name - uninstall package
# nimble build - build the current project (will also install missing dependencies)
# nimble run - build and run current project (will also install missing dependencies)
# nimble c fileName - compile a specific file
# nimble cpp
# nimble js - these can be used to compile to a specific language
#   tutorial note: remove any code from project.nim and replace it with `echo "hello"`
#   then run `nimble js src/project.nim`
# nimble search package-name - will search for packages in the nimble directory
#   alternatively you can use https://nimble.directory

# these are tasks written in nimscript (scripting language that uses Nim)
# you can make these automate some tasks for you in your project
# you can run it by going `nimble task-name` - in this case `nimble hello`
task hello, "This is a hello task":
  echo("Hello World!")

before hello:
  echo "This runs before the hello task"

after hello:
  echo "This runs after the hello task"

# you can also use this to use a specific module
# when defined(nimdistros):
#   import distros
#   if detectOs(Ubuntu):
#     # specify dependencies your project needs
#     foreignDep "libssl-dev"
#   else:
#     foreignDep "openssl"