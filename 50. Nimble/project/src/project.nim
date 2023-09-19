# to start the tutorial just run `nimble init` and complete the setup
# `nimble run` to run
# File: main.nim
import nimx/window
import nimx/text_field

proc startApp() =
    # First create a window. Window is the root of view hierarchy.
    var wnd = newWindow(newRect(40, 40, 800, 600))

    # Create a static text field and add it to view hierarchy
    let label = newLabel(newRect(20, 20, 150, 20))
    label.text = "Hello, world!"
    wnd.addSubview(label)


when isMainModule:
    # Run the app
    runApplication:
        startApp()
