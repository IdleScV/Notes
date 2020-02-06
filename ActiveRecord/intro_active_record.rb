Things we need for active record to work..


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

