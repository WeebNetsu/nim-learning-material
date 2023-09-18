import uri
# uri allowes us to work with URLs
# in a sense, URL = URI

let URL = parseUri("https://www.youtube.com")
echo URL / "watch/shorts.html" # "/" will add to the url, like concatenating a string
echo URL / "watch"

echo URL.hostname # returns host name
echo URL.scheme # scheme (like http or https)
echo isAbsolute(URL) # true, this url is Absolute
echo isAbsolute(parseUri("stevesteacher.com")) # false

let PORTED = parseUri("sftp://127.0.0.1:3002") # localhost at port 3002
echo PORTED.port # returns the port

let FTP = parseUri("ftp://Netsu:myPassword123@LinuxDesktop") # can easily parse ftp links
echo FTP.username # Netsu
echo FTP.password # myPassword123
echo FTP.hostname # LinuxDesktop

# Encodes this string by RFC3986 standards, so only {'a'..'z', 'A'..'Z', '0'..'9', '-', '.', '_', '~'} is allowed
let a = encodeUrl("https://www.mysite.com/this is my webpage")
echo a

echo encodeUrl("https://www.mysite.com/this is my webpage", false) # false = don't use plus signs

echo decodeUrl(a) # decode the url
echo decodeUrl(a, false) # don't decode the "+" symbols

let b = parseUri("https://www.mysite.com/buy")
echo b ? {"color": "pink"} # ? is like /, but for query parameters
let c = {"item": "shirt", "price": "89"}
# this will create a URL safe query
echo $b & c.encodeQuery() # NOTE: the $ is used to convert URI object to string

