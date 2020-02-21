require 'json'
require 'rest-client'
require 'awesome_print'
require 'pry'
# ! API KEY : 


key = "zsw7b42mgn7ep6c2h25kwd3d"
@api_key = key
# @@data = 

# ! URL List

# * Make a GET requesting using our URL
def get_request(url)
    jresponse = RestClient.get(url)
    response = JSON.parse(jresponse)
    return response
end

# * Competition list

def competition_list_raw
    #? Get reuqest
    url = "https://api.sportradar.us/ufc/trial/v2/en/competitions.json?api_key=#{@api_key}"
    data = get_request(url)["competitions"]
    
    #? Output
    puts data.map{|i| i["name"]}
end

# * Competitor Profile

def competitor_summary_raw
    #? Instructions
    puts "Type in a competitor ID"
    competitor_id = gets.strip
    #? Get request
    url = "https://api.sportradar.us/ufc/trial/v2/en/competitors/sr:competitor:#{competitor_id}/profile.json?api_key=#{@api_key}"
    data = get_request(url)

    #? Data alignment
    name = data["competitor"]["name"]
    city = data["info"]["fighting_out_of_city"]
    wins = data["record"]["wins"]
    losses = data["record"]["losses"]
    draws = data["record"]["draws"]

    #? Output
    puts "******************************"
    puts "Name : #{name}"
    puts "City: #{city}"
    puts "Record : #{wins} W / #{losses} L / #{draws} D"
    puts "******************************"
end

def rankings_list_data
    url = "https://api.sportradar.us/ufc/trial/v2/en/rankings.json?api_key=#{@api_key}"
    data = get_request(url)
    data
end

def rankings_list_options
   
    
    data = rankings_list_data
    date = data["generated_at"].split('T')[0]
    puts "Rankings as of #{date}"
    types = data["rankings"].map{|list| (list["type_id"] - 7).to_s + ". " +(list["name"].upcase.gsub("_", " "))}
    puts types

end

def rankings_select

    
    
    puts "Type in a number for ranking list"
    num = gets.chomp
    list_number = num.to_i - 1

    data = rankings_list_data
    puts "*************************"
    puts data["rankings"][list_number]["competitor_rankings"].map{|rank|
        "#{rank["rank"].to_s}.  #{rank["competitor"]["name"]}"
    } 
    


end

rankings_list_options
rankings_select
