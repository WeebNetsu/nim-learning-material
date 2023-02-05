# coroutine vs thread difference 
# https://stackoverflow.com/questions/1934715/difference-between-a-coroutine-and-a-thread
# tl;dr ->
# thread -> the computer decides when to start running another thread
# coroutine
# - we say when to start running another coroutine
# - runs concurrently (not parrallel)
# - more light weight compared to threads
# NOTE: a co-routine is not necisarily better than a thread! Nor vice-versa, it depends
# on the situation, for tutorial, maybe quote what is said on the stack overflow question linked
# from both the first and second answers

# nim c -d:nimCoroutines main.nim
import std/coro

# good idea for below examples, use the Lua lesson we have and convert it to Nim

proc countTo(n: int): iterator(): int =
  return iterator(): int =
    var i = 0
    while i <= n:
      yield i
      inc i

let countTo20 = countTo(20)

echo countTo20()
echo countTo20()
echo countTo20()

#[ 
_G.routine1 = coroutine.create( -- create a coroutine
    function()
        for i = 1, 10, 1 do
            print(i)
            print(coroutine.status(routine1)) -- prints out the current status of routine
    
            if i == 4 then
                coroutine.yield() -- when i is 4 wait before continueing execution
            end
        end
    end
)

_G.routine2 = coroutine.create(
    function()
        for i = 11, 20, 1 do
            print("Routine 2:",i)
        end
    end
)

print(coroutine.status(routine1))
coroutine.resume(routine1) -- start/resume a routine
coroutine.resume(routine2) -- when the above routine yields, start with this one

-- the below if statement is optional
if coroutine.status(routine1) == "suspended" then 
    coroutine.resume(routine1) -- continue with routine
end

print(coroutine.status(routine1))
 ]#