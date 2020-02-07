Things we need for active record to work..
#? Additional documentation... 
#* https://guides.rubyonrails.org/active_record_basics.html#update
#* http://jamesponeal.github.io/projects/active-record-sheet.html


in GEM
sqlite // This is just a database. It can be any database
#! rake  //These are also neccesary
#! activerecord
#! sinatra-activerecord

in Environemnet
require 'require_all'
require_all'./lib'
require_all './db'
# //                        
MIGRATE, They allow us to manage the databse structure
# //                        
MODELS, they allow us to manage the database data
# //                        
class User < ActiveRecord::Base #! User inherits all the methods of ActiveRecord::Base

end

As long as we have a database table called User, these functions bellow would work. 
Also, when we use the class User, ActiveRecord automatically looks at the *Users*. it is pluralized. 

User.all
    Returns...
        All instances

User.new()
    function...
        creates an item inside of ruby world

User.create()
    function... 
        Creates an item inside of the database and also in the ruby world.


#? #.save 
    function...
        Saves the instance inside of the 


User.find_by(username: 'coffee')
    returns...
        coffee instance from the database 

User.last
    Returns...
        Last instance in the database.

#//                                 
# ! Some More methods...
:highest_rating
    returns the rating of the TV show with the highest rating
  ::most_popular_show
    returns the name of the TV show with the highest rating
  ::lowest_rating
    returns the rating of the TV show with the lowest rating
  ::least_popular_show
    returns the name of the TV show with the lowest rating
  ::ratings_sum
    returns the sum of all the ratings of all the tv shows
  ::popular_shows
    returns an array of all of the shows with a rating above 5
  ::shows_by_alphabetical_order
    returns an array of all of the shows, listed in alphabetical order

    def self.highest_rating
        Show.maximum("rating")
    end

    def self.most_popular_show
        num = Show.highest_rating
        Show.where("rating = (?)", num)[0]
    end

    def self.lowest_rating
        Show.minimum("rating")
    end

    def self.least_popular_show
        num = Show.lowest_rating
        Show.where("rating = (?)", num)[0]
        
    end

    def self.ratings_sum
        Show.sum("rating")
    end

    def self.popular_shows
        Show.where("rating > 5")
    end

    def self.shows_by_alphabetical_order
        Show.order("name ASC")
    end

!* More methods!

def self.find_longest_username
    self.all
end