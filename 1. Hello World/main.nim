# All of the below work perfectly fine!
echo "Hello World"

"Hello ".echo "World"

write(stdout, "Hello World")

# nim c main.nim (compile)
# nim -r c main.nim (compile and run)
# nim r main.nim (run, do not store compiled in same folder)
# nim r --verbosity:0 --hints:off main.nim (only show essential messages)
