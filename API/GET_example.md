require 'net/http'
 require 'open-uri'
 require 'json'

 
class GetRequester / this class is initalized with aurl

    def initialize(url)
        @URL = url
    end

    # URL = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json."


    def get_response_body
        uri = URI.parse(@URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        data = JSON.parse(get_response_body)
        data
    end

end

get_requester = GetRequester.new('https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json')

get_requester.parse_json
    #=> [{"name"=>"Daniel", "occupation"=>"LG Fridge Salesman"}, {"name"=>"Joe", "occupation"=>"WiFi Fixer"}, {"name"=>"Avi", "occupation"=>"DJ"}, {"name"=>"Howard", "occupation"=>"Mountain Legend"}]