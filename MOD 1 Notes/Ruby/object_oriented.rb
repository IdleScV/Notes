#! notes on OOP
#! -Object Oriented Programing


#! Creating Class...
    

class Dog
      # some code to describe a dog

    end

#! Creating a new variable

fido = Dog.new
fido #=> #<Dog:0x007fc52c2d7d20>
 
snoopy = Dog.new
snoopy #=> #<Dog:0x007fc52c2d4170>

#! Snoopy and fido are two variables that point to seperate instances of the dog class


lassie = Dog.new
lassie #?=> #<Dog:0x007fc52c2cc588>
        #? This ^^ is Ruby Object Notation, the <Dog:0x007fc52c2cc588> is an object identifier 


#! Message vs Receiver
    #? The receiver is this very string      #? reverse is the message
    "Strings are instances and objects too".reverse

#! Dot notation... We send objects messages asking them to perform an operation or task through a syntax known as "Dot Notation".
fido.object_id #? => 70173135795280 <-- this is what is returned when we ask them to perform the '.object_id'
#? object_id method simply tells you the object's identifier in your computer's memory (the place where all things live in your computer)

#! Methods... 
#? One method is .method itself. It works similarly to how '-help' works in many programs.

fido.methods
#=> [:psych_to_yaml, :to_yaml, :to_yaml_properties, :local_methods, :try, :nil?,
# :===, :=~, :!~, :eql?, :hash, :<=>, :class, :singleton_class, :clone, :dup,
# :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze,
# :frozen?, :to_s, :inspect, :methods, :singleton_methods, :protected_methods,
# :private_methods, :public_methods, :instance_variables,
# :instance_variable_get, :instance_variable_set, :instance_variable_defined?,
# :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send,
# :public_send, :respond_to?, :extend, :display, :method, :public_method,
# :singleton_method, :define_singleton_method, :object_id, :to_enum, :enum_for,
# :==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__] #? << These are all the different methods that our fido variable has access to.

#!Building instance methods
class Dog
    # Class body
   
    # Instance Method Definition
    def bark
      puts "Woof!"
    end
end

fido = Dog.new
fido.bark #> "Woof!"

#? Self explanatory.
    #! Instance methods are not global
    #? Calling bark like 
    bark 
    #? will return (# NameError: undefined local variable or method `bark' for main:Object)

    #! This allows us to set dog breeds...
    class Dog
        def breed=(breed)
          @breed = breed
        end
       
        def breed
          @breed
        end
      end
       
      snoopy = Dog.new #=> #<Dog:0x007f970a2edfd0>
      snoopy.breed #=> nil
      snoopy.breed = "Beagle"
      snoopy.breed #=> "Beagle"
#! However, dogs are born with a breed and not assigned after. Here we use .initialize
    class Dog
        def initialize(breed)
        @breed = breed
        end
    
        def breed=(breed)
        @breed = breed
        end
    
        def breed
        @breed
        end
    end

    #? Therefore... 
    lassie = Dog.new("Collie")
    lassie.breed #=> "Collie"


#! Getter vs Setter
#? Getter... 
kanye.name
  => "Kanye"

kanye.instance_variable_get(:@name)
=> "Yeezy"

#? Setter
kanye.name = "Yeezy"
kanye.name
  => "Yeezy"

kanye.instance_variable_set(:@name, "Yeezy")
    #! We don't want to use instance_variable_set/get because it makes our code messy. Having multiple instances of (:@name) wouldn't allow us to properly use a self written function like (:@lastname) and (:@firstname)
    class Person
     
        def initialize(first_name, last_name)
          @first_name = first_name
          @last_name = last_name
        end
       
        def name=(full_name)
          first_name, last_name = full_name.split
          @first_name = first_name
          @last_name = last_name
        end
       
        def name
          "#{@first_name} #{@last_name}".strip
        end
       
      end 

#! Macros
#? or aka Shortcut code.

#? Example... 
class Person
    #? Setter AND getter
    attr_accessor :name
  end
#? ^^^ This is equivalent to vvv
class Person
    #? Setter
    attr_writer :name
    #? Getter
    attr_reader :name
end
#? ^^^ This is equivalent to vvv
class Person
    #? Setter
    def name=(name)
      @name = name
    end
    #? Getter
    def name
      @name
    end
end
#? Using Macros is Usually Better

#! Erros and Possible bugs
class Pet
    def initialize(name)
      @name = name
    end
   
    def name=(name)
      @name = name
    end
   
    def name
      @name
    end
end
   
dog = Pet.new #? This gives us a wrong number of arguments error. Because of #initialize, we're required to add at least one arguement to this declaration.
#? Therefore, This should be
dog = Pet.new('Toast')

#! retrieve all variables 
p dog #? >> returns all of dog's variables.

#! Complex Object Oriented Programming
class Player

    def age= (new_age)  
        if(new_age < 18) #? We can set limits to how we want our variables to be set.
            @age = 18
        else 
            @age = new_age

        end
    end

    def age_str
        if (@age > 30)
            "young"
        else 
            "old"
        end
    end
        #! {self}...
        #? calls upon the method in a class using the instance variable that is currently using the class method.
    def greet
        puts "my age is #{self.age} years old and I'm #{self.age_str}"
end
#//                         
#! Class Variables and Methods
#? Example.. Counting number of albums we've added.
class Album
    @@album_count = 0 
   
    def initialize
      @@album_count += 1
    end
   
    def self.count
      @@album_count
    end
end

  Album.new
  Album.new
  Album.new
   
  Album.count
    #? => 3

#? Example.. remembering objects
class Song
     
    @@all = []
   
    attr_accessor :name
   
    def initialize(name)
      @name = name
      @@all << self
    end
   
    def self.all
      @@all
    end
end

hotline_bling = Song.new("Hotline Bling")
thriller = Song.new("Thriller")

Song.all #? => [#<Song:0x00007fd9910c45a0 @name="99 Problems">, #<Song:0x00007fd9900dba58 @name="Thriller">]

#//                          
#! the self keyword
#? the self key word when used on a method becomes a method for the class, while when used inside of a method becomes a calling on the variable.

#//                          
#Domain modeling...


#Minimum Viable Product...

#//                          
#!Twitter Lab Example
#? vv Rleative dependencies
require_relative "./user.rb"
require_relative "./tweet.rb"
require "pry"

#? This is space for testing


binding.pry
#//                          
#! #username => variable method
#! .username => class method
#//                          




#//                          

#! Has-Many-Through AKA Many-to-Many relationship
#? Example...
#* Doctor => DoctorPatient <= Patient 

#? Doctor has many patients
#? Patient has many doctors
#? The DoctorPatient class is used to store information about DoctorPatient relationship.




















#//                          



#! Questions...
#? Is there a .method way of returning instance methods that we created ourselves?
#? self == this. in JS?

