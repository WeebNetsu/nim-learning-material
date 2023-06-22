import std/[asyncdispatch, httpclient, json]

# compile: nim c -r -d:ssl main.nim

type
    StatusObj = object
        verified: bool
        sentCount: int

    FactObj = object
        # _id: string
        # _v: int
        user: string
        text: string
        updatedAt: string
        deleted: bool
        source: string
        `type`: string
        status: StatusObj

# to create an async function, we can use {.async.}, which will allow us
# to use await. To specify the data returned, we use Future[Data]
# (future, since the data will be returned in the future after a request)
proc fetchCatFacts(): Future[seq[FactObj]] {.async.} =
    # we can create a new http client, in this case an async one, since
    # we want to be able to await it
    var client = newAsyncHttpClient()
    # we make a request to this API endpoint
    # (more info https://alexwohlbruck.github.io/cat-facts/docs/)
    var response = await client.get("https://cat-fact.herokuapp.com/facts")
    # we get the entire response, but we are primarily interested in the body
    var body = await response.body
    # we can then parse the body into pure JSON. We can then use .to to
    # convert the JSON into a type Nim can understand (optional)
    # without converting it, you will get a JsonNode type
    return parseJson(body).to(seq[FactObj])

proc main() {.async.} =
    try:
        # here we just await fetching data from our API
        var catFacts: seq[FactObj] = await fetchCatFacts()
        echo catFacts[0].text
        # if the request failed, use this except
    except:
        echo "Failed to fetch cat facts."

# we need to use waitFor so we wait for the main() function
# to finish executing before the program ends. waitFor is usually
# used outside of an asynchronous procedure to wait for an
# asynchronous procedure to finish
waitFor main()
