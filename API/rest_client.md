require 'json'
require 'rest-client'


rest-client does the same thing as Net::HTTP

1. To use it, put 'rest-client' in the gem file
2. use it like so...

response = RestClient.get(url)
p response 
    Returns...
        <RestClient::Response 200 ...> if successful

p JSON.parse(response)
    Returns... 
        {<!--* A Readable hash -->}


