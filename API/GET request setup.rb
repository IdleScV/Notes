require 'open-uri'
require 'net/http'
require 'json'
require 'awesome_print' (Gem install awesome_print)
url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"(preferred .json URL)
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
ap JSON.parse(response.body)