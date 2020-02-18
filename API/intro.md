Sending an HTTP GET Request Using Ruby
Most APIs are built on the REST framework

1. Require extension
        require 'open-uri'

2. Set our url to a variable
        url = "https://learn-co-curriculum.github.io/json-site-example/"

3. Use .parse from open-uri, 
        uri = URI.parse(url)
        #=> <!--*#=> #<URI::HTTPS https://learn-co-curriculum.github.io/json-site-example/> -->

4. uri now has a bunch of methods. One of them is .open, which is a GET request
        request_results = uri.open 
        #=> <!--* #<StringIO:0x00007fa84b13de90 @base_uri=#<URI::HTTPS https://learn-co-curriculum.github.io/json-site-example/>, @meta={"server"=>"GitHub.com", "content-type"=>"text/html; charset=utf-8", "last-modified"=>"Thu, 15 Aug 2019 23:05:32 GMT", "etag"=>"W/\"5d55e53c-284\"", "access-control-allow-origin"=>"*", "expires"=>"Thu, 22 Aug 2019 19:42:27 GMT", "cache-control"=>"max-age=600", "x-proxy-cache"=>"MISS", "x-github-request-id"=>"D49E:101C:257158:30F953:5D5EEDC6", "content-length"=>"341", "accept-ranges"=>"bytes", "date"=>"Thu, 22 Aug 2019 19:38:38 GMT", "via"=>"1.1 varnish", "age"=>"214", "connection"=>"keep-alive", "x-served-by"=>"cache-ewr18140-EWR", "x-cache"=>"HIT", "x-cache-hits"=>"1", "x-timer"=>"S1566502719.880905,VS0,VE1", "vary"=>"Accept-Encoding", "x-fastly-request-id"=>"bf2550e15c1927f0d65dc31f98747ad56e51d4db"}, @metas={"server"=>["GitHub.com"], "content-type"=>["text/html; charset=utf-8"], "last-modified"=>["Thu, 15 Aug 2019 23:05:32 GMT"], "etag"=>["W/\"5d55e53c-284\""], "access-control-allow-origin"=>["*"], "expires"=>["Thu, 22 Aug 2019 19:42:27 GMT"], "cache-control"=>["max-age=600"], "x-proxy-cache"=>["MISS"], "x-github-request-id"=>["D49E:101C:257158:30F953:5D5EEDC6"], "content-length"=>["341"], "accept-ranges"=>["bytes"], "date"=>["Thu, 22 Aug 2019 19:38:38 GMT"], "via"=>["1.1 varnish"], "age"=>["214"], "connection"=>["keep-alive"], "x-served-by"=>["cache-ewr18140-EWR"], "x-cache"=>["HIT"], "x-cache-hits"=>["1"], "x-timer"=>["S1566502719.880905,VS0,VE1"], "vary"=>["Accept-Encoding"], "x-fastly-request-id"=>["bf2550e15c1927f0d65dc31f98747ad56e51d4db"]}, @status=["200", "OK"]>  -->

5. We set uri.open to a string
        uri.open.string 
        #=> <!--* "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n  <title>JSON Example Site</title>\n</head>\n<body>\n  <h1>JSON Example Site</h1>\n\n  <h3>Endpoints available to visit:</h3>\n  <ul>\n    <li><a href=\"https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json\" alt=\"locations JSON\">endpoints/locations.json</a></li>\n    <li><a href=\"https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json\" alt=\"people JSON\">endpoints/people.json</a></li>\n  </ul>\n</body>\n</html>" -->

    Code condensed... 
            require 'open-uri'
            url = "https://learn-co-curriculum.github.io/json-site-example/"
            uri = URI.parse(url)
            uri.open.string

This above method can be limitting, since the information can be hard to read.
Below is another method of retrieving better information
1. Require extension
        require 'open-uri'
        require 'net/http'

2. Set our desired URL 
        url = "https://learn-co-curriculum.github.io/json-site-example/"
        uri = URI.parse(url)

3. Instead of .open, use Net::HTTP.get_response(uri)
        response = Net::HTTP.get_response(uri)
        #=> <!--* #=> #<Net::HTTPOK 200 OK readbody=true> -->

4. To check the response information, use .body
        response.body
        #=> <!--* "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n  <title>JSON Example Site</title>\n</head>\n<body>\n  <h1>JSON Example Site</h1>\n\n  <h3>Endpoints available to visit:</h3>\n  <ul>\n    <li><a href=\"https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json\" alt=\"locations JSON\">endpoints/locations.json</a></li>\n    <li><a href=\"https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json\" alt=\"people JSON\">endpoints/people.json</a></li>\n  </ul>\n</body>\n</html>\n"-->

This method allows for a better reading of the information. However, it's information is in JSON. We need to transfer this into a readable format.

<!--! JSON stands for JavaScript Object Notation and is a standard way store and transfer nested data over the internet. The keyword here is Notation. Data stored in JSON format is actually just data stored as a string, but structured in a way that is easily converted into usable nested data. Ruby has a built-in JSON module that includes a parse method to take JSON formatted data and turn it into an array or hash. !-->

1. If we require json
        require 'json'

2. We can use JSON.parse
        JSON.parse(response.body)

    Which returns a much cleaner and more easily selectable data set

        [{"name"=>"Flatiron School Manhattan", "address"=>"11 Broadway, New York, NY 10004", "coordinates"=>{"latitude"=>"40.704521", "longitude"=>"-74.012833"}},
        {"name"=>"Flatiron School Austin", "address"=>"316 W 12th St, Austin, TX 78701", "coordinates"=>{"latitude"=>"30.275080", "longitude"=>"-97.743700"}},
        {"name"=>"Flatiron School Denver", "address"=>"3601 Walnut St 5th Floor, Denver, CO 80205", "coordinates"=>{"latitude"=>"39.743510", "longitude"=>"-105.011360"}},
        {"name"=>"Flatiron School Seattle", "address"=>"1411 4th Ave 13th Floor, Seattle, WA 98101", "coordinates"=>{"latitude"=>"47.684879", "longitude"=>"-122.201363"}}, 
        {"name"=>"Flatiron School London", "address"=>"131 Finsbury Pavement, Finsbury, London EC2A 1NT, UK", "coordinates"=>{"latitude"=>"51.520480", "longitude"=>"-0.087190"}}]

    Tip! If we require 'awesome_print', using 'ap JSON.parse(response.body)' returns an even better looking data set.

    Code condensed...
            require 'open-uri'
            require 'net/http'
            require 'json'
            require 'awesome_print'
            url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            ap JSON.parse(response.body)

            Returns...
                [
                    [0] {
                            "name" => "Flatiron School Manhattan",
                            "address" => "11 Broadway, New York, NY 10004",
                        "coordinates" => {
                            "latitude" => "40.704521",
                            "longitude" => "-74.012833"
                        }
                    },
                    [1] {
                            "name" => "Flatiron School Austin",
                            "address" => "316 W 12th St, Austin, TX 78701",
                        "coordinates" => {
                            "latitude" => "30.275080",
                            "longitude" => "-97.743700"
                        }
                    },
                    [2] {
                            "name" => "Flatiron School Denver",
                            "address" => "3601 Walnut St 5th Floor, Denver, CO 80205",
                        "coordinates" => {
                            "latitude" => "39.743510",
                            "longitude" => "-105.011360"
                        }
                    },
                    [3] {
                            "name" => "Flatiron School Seattle",
                            "address" => "1411 4th Ave 13th Floor, Seattle, WA 98101",
                        "coordinates" => {
                            "latitude" => "47.684879",
                            "longitude" => "-122.201363"
                        }
                    },
                    [4] {
                            "name" => "Flatiron School London",
                            "address" => "131 Finsbury Pavement, Finsbury, London EC2A 1NT, UK",
                        "coordinates" => {
                            "latitude" => "51.520480",
                            "longitude" => "-0.087190"
                        }
                    }
                ]
