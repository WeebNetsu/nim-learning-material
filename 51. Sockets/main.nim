# nim c -r --hints:off -d:ssl main.nim
import std/[net]

# think of a socket as a connection between 2 computers, and it allows them to communicate, like plugging your computer
# into a wall socket so data (electricity) can transfer from one point to the next (your PC)

# run this code with the -d:ssl flag

# --- Connecting to a server
let socket = newSocket()
socket.connect("google.com", Port(80)) # connect to http port 80
socket.close() # stop a socket from running

# can use below for ssl connections
let 
    ctx = newContext()
    sslSocket = newSocket()

wrapSocket(ctx, sslSocket)
sslSocket.connect("google.com", Port(443)) # connect to https port 443
sslSocket.close()

# --- Creating a server

let serverSocket = newSocket()
# what port to run on
serverSocket.bindAddr(Port(1234))
# start listening for communication
serverSocket.listen()

var 
    client: Socket
    address = ""

while true:
    # accept incoming connections
    serverSocket.acceptAddr(client, address)
    echo "Client connected from: ", address