import std/[asyncdispatch, httpclient, json, options]

# compile: nim c -r -d:ssl main.nim

type
    QuoteAuthorObj = object
        name: string
        language: string
        ageOfDeath: Option[int]
        dateOfBirth: string

    QuoteUserObj = object
        username: Option[string]
        verified: bool
        `type`: string

    QuoteObj = object
        # NOTE save WITHOUT formatting, since the below format
        # is VERY NB, since _ is not allowed as an object key
        # so we need to use both ` and " to allow it
        # `"_id"`: string
        `"_id"`: string
        quote: string
        author: QuoteAuthorObj
        user: QuoteUserObj

# to create an async function, we can use {.async.}, which will allow us
# to use await. To specify the data returned, we use Future[Data]
# (future, since the data will be returned in the future after a request)
proc fetchQuotes(): Future[seq[QuoteObj]] {.async.} =
    # we can create a new http client, in this case an async one, since
    # we want to be able to await it
    var client = newAsyncHttpClient()
    # we make a request to this API endpoint
    # (more info https://github.com/WeebNetsu/ytapi.stevesteacher.com)
    var response = await client.get("http://ytapi.stevesteacher.com/quotes")
    # we get the entire response, but we are primarily interested in the body
    var body = await response.body
    # we can then parse the body into pure JSON. We can then use .to to
    # convert the JSON into a type Nim can understand (optional)
    # without converting it, you will get a JsonNode type
    return parseJson(body).to(seq[QuoteObj])

proc main() {.async.} =
    try:
        # here we just await fetching data from our API
        var quotes: seq[QuoteObj] = await fetchQuotes()
        echo quotes[0]
        # if the request failed, use this except
    except:
        echo "Failed to fetch quotes facts."

# we need to use waitFor so we wait for the main() function
# to finish executing before the program ends. waitFor is usually
# used outside of an asynchronous procedure to wait for an
# asynchronous procedure to finish
waitFor main()
