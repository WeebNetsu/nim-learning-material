#[ 
    # Big thanks to 
    https://livebook.manning.com/book/nim-in-action/chapter-6/
    https://nim-docs.readthedocs.io/en/latest/learn/nim_by_example/parallelism/
    https://nim-lang.org/1.6.6/threads.html
    https://nim-lang.org/docs/manual.html#threads

    Concurrency vs. parallelism
    Most operating systems support multitasking, the ability to perform multiple tasks over a certain period of time. 
    A task is usually known as a process, which is a computer program being executed. Each CPU can only execute a single process at a time,
    but multitasking allows the OS to change the process that’s currently being executed on the CPU without having to wait for the process 
    to finish its execution

    Because CPUs are very fast, process A can be executed for 1 nanosecond, then while waiting it can switch to executing process B for 2 nanoseconds,
    and then go back to executing process A for another nanosecond. This makes it look like multiple processes are being executed at the same time, even though a CPU can only run one at a time. This is called concurrency.

    What we have talked about above is a single core CPU or a 'single core' in a multi core CPU. Most modern CPUs have multiple cores, each of which can perform
    a single task, which means it can actually execute 2 processes at the same time. That would be called parallelism and can only be used on multiple physical CPUs (multi core CPUs) and by using a multithreading technology, such as Intel’s Hyper-Threading (HT) Technology.

    So though the two may look similar, they are different.

    Take a look at this fun game that gives a simple overview of what the OS is doing with the CPU: https://github.com/plbrault/youre-the-os

    ------
    The OS also manages threads. A thread is a component of a process, and more than one can exist within the same process. It can be executed concurrently 
    or in parallel, just like a process, although unlike processes, threads share resources such as memory among each other.

    So a process is an app, and a thread is like a process in a process. You don't want apps to share resources, such as your password manager and facebook,
    since that could be bad. In threads however, they belong to the same process, in which case sharing data between them makes sense.


    ------
    Garbage collector: A garbage collector automatically manages memory allocation and deallocation. It helps programmers avoid the need for manual memory management, (By memory I mean RAM) which can be error-prone and time-consuming. The garbage collector automatically identifies and frees up memory that is no longer needed by the program, making memory management easier for developers. C has no garbage collector and you need to free up memory yourself using malloc and free, however most languages do have a garbage collector for ease of use.
 ]#

# * Need to add --threads:on to compile

import std/os

# let data = "data"

# # here we specify that this proc uses threads, note that
# # the {. thread .} pragma is optional, but good practice
# proc showData() {.thread.} =
#     echo data

# # this is an example of a basic thread, however! It will throw an error, because it is not follow the GC safety rules
# var thread: Thread[void]
# createThread[void](thread, showData)
# joinThreads(thread)

#[
    Garbage collector safety (GC safety) in Nim has an important distinction between the way threads work in Nim and in most other programming languages. Each of Nim’s threads has its own isolated memory heap. Sharing of memory between threads is restricted, which helps to prevent race conditions and improves efficiency. A race condition is when multiple threads tries to access the same data at the same time, if some of them wants to modify that data, and the others were not ready for it, it could result in incorrect results.

    Efficiency is also improved by each thread having its own garbage collector. Other implementations of threads that share memory need to pause all threads while the garbage collector does its business. This can add problematic pauses to the application.

    In short, the above code fails because we are not allowed to access the data variable when running a thread.
]#

# to fix the above issue, we need to provide it as a parameter

let data = "data"

proc showData(data: string) {.thread.} =
    echo data

# this is an example of a basic thread, however! It will throw an error, because it is not follow the GC safety rules
var thread: Thread[string]

# note these are not errors, even if the intellisense thinks so...

# first argument is the thread we want to create, the 2nd is the procedure
# we want to execute in the thread, and the 3rd is the integer value that
# we will pass into the procedure (Thread[string] was referring to this)
createThread[string](thread, showData, data)
joinThreads(thread)

# You may be wondering what to do if you want to pass in multiple parameters, well you can do
type
    ThreadData = tuple[param: string, param2: int]

let stringData = "Hello World"

proc showData2(data: ThreadData) {.thread.} =
    echo data.param, ": ", data.param2

var thread2: Thread[ThreadData]
createThread[ThreadData](thread2, showData2, (param: stringData, param2: 5))
joinThreads(thread2)

# Example of performance benefits

proc sayHi(num: int) {.thread.} =
    os.sleep(1000) # to give an example of a function that takes long to execute
    echo "Hi from " & $num

# example without a thread
for i in 0 .. 5:
    sayHi(i)


# -- METHOD 1 --

# Here we specify the type each thread will hold (int)
var threads: array[10, Thread[int]]

# we loop through the entire array, from lowest to highest index
for i in threads.low .. threads.high:
    # (Thread[int] was referring to `i`)
    createThread(threads[i], sayHi, i)
joinThreads(threads)

echo "After threads 1"


# -- METHOD 2 --

# threadpool creates a very easy way to create threads in Nim
import std/threadpool

for i in 0..9:
    # here we spawn a new thread
    # spawn is parallel and has been designed specifically for CPU-intensive computations that
    # can benefit from being executed on multicore CPUs
    spawn sayHi(i)

# here we ask all the threads to finish
sync()

echo "After threads 2"


# -- Getting a value from threads --

# FlowVar is similar to the Future type, in it starts as an empty value
var userInput: FlowVar[string] = spawn stdin.readLine()

# see line 147
# echo "Input: ", ^userInput  # will block the thread from continuing

# this will constantly see if userInput has a value
while not userInput.isReady:
    echo "No input - will check again in 5 seconds"
    sleep(5000)

# ^ retrieves the value from a "Future"-like variable, in this case a FlowVar
# however, note that ^ will block the thread from running until the variable
# it is used on contains a value - so make sure to use .isReady before using this
echo "Input: ", ^userInput

# downloads example with threads
# https://testfile.org/ - for example download files

import httpclient, strutils

# Utility procedure to extract the filename from a URL
proc getFilenameFromURL(url: string): string =
    return url.split("/")[^1]

proc downloadFile(url: string) {.thread.} =
    echo "Starting ", url
    var client = newHttpClient()
    var response = client.get(url)

    if response.status == $Http200:
        let body = response.body
        echo "File downloaded successfully! ", url
        # Save the downloaded content to a file
        writeFile(getFilenameFromURL(url), body)
    else:
        echo "Failed to download file. Status code: ", response.status


# Example usage
let downloadLinks = [
    "https://files.testfile.org/AUDIO/C/M4A/sample1.m4a", # 2mb
    "https://files.testfile.org/anime.mp3",               # 4mb
    "https://link.testfile.org/ihDc9s"                    # 40mb
]

var downloadThreads: array[len(downloadLinks), Thread[string]]

for index, link in downloadLinks:
    createThread(downloadThreads[index], downloadFile, link)
joinThreads(downloadThreads)


# -- Same as above, but using threadpool instead --
for link in downloadLinks:
    spawn downloadFile(link)

sync()
