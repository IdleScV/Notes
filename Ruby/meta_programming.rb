#! metaprogramming allows us to essentially write code that writes code. 

#//                                                     
#! Key word arguements... 
#! Example..
#* There work like hashes, but in the below instance we gave them a default value, though not neccessary.

def happy_birthday(name: "Beyonce", current_age: 31)
    puts "Happy Birthday, #{name}"
    current_age += 1
    puts "You are now #{current_age} years old"
  end

#! Here it is without the default...

def happy_birthday(name:, current_age:)
    puts "Happy Birthday, #{name}"
    current_age += 1
    puts "You are now #{current_age} years old"
  end

#! Here we call the method

#? happy_birthday(current_age: 31, name: "Carmelo Anthony")
#? >>  "Happy Birthday, Carmelo Anthony"
#? >>  "You are now 32 years old"

#//                                                     
#! Mass Assignment of keyword arguemnets
class Person
    attr_accessor :name, :age
   
    def initialize(name:, age:)
      @name = name
      @age = age
    end
end

person_attributes = {name: "Sophie", age: 26}
sophie = Person.new(person_attributes)
#? >> #<Person:0x007f9bd5814ae8 @name="Sophie", @age=26>


#//                                                     
#! mass assignment to metaprogram a Ruby class.
#? The goal is allow users to sign in with twitter account
class User
    attr_accessor :name, :age, :location, :user_name
   
    def initialize(user_name:, name:, age:, location:)
      @user_name = user_name
      @name = name
      @location = location
      @age = age
    end
  end

#? Twitter sends us this informaiton
twitter_user = {name: "Sophie", user_name: "sm_debenedetto", age: 26, location: "NY, NY"}

#? So we process the twitter user like so...
sophie = User.new(twitter_user)
#? => #<User:0x007fa1293e68f0 @name="Sophie", @age=26, @user_name="sm_debenedetto", @location="NY, NY">

#! BUT! 
#?  what if Twitter changes their API without telling us? 

#? We're missing the age!

new_twitter_user = twitter_user = {name: "Sophie", user_name: "sm_debenedetto", location: "NY, NY"}
User.new(new_twitter_user)
#? =>ArgumentError: missing keyword: age

#? We have new information!

newest_twitter_user = {name: "Sophie", user_name: "sm_debenedetto", age: 26, location: "NY, NY", bio: "I'm a programmer living in NY!"}
User.new(newest_twitter_user)
#? => ArgumentError: unknown keyword: bio

#! The fix. 
class User
    attr_accessor :name, :user_name, :age, :location, :bio
   
    def initialize(attributes)
      attributes.each {|key, value| self.send(("#{key}="), value)}
    end
  end

#? Explanation...
#* self.send(key=, value)       =       instance_of_user.key = value
#? For example...
#* instance_of_user.name = "Sophie"

#///                                        
#! .send

sophie.name = "Sophie"
#? is the same as 
sophie.send("name=", "Sophie")

#? However, in this scenario, '.send' is ugly. A better purpose is to use it like this...
sophie.send("#{method_name}=", value)