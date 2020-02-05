require 'pry'
#! Everything is an Object... 
#! .class => returns type

#! .class.ancestors...

"string".class.ancestors
#? >> [String, Comparable, Object, Kernel, BasicObject] 
3.class.ancestors
#? >> [Integer, Numeric, Comparable, Object, Kernel, BasicObject] 
true.class.ancestors
#? >> [TrueClass, Object, Kernel, BasicObject] 

#//                                     
#! Class behavior + ancestors

#? Class Animal
class Animal
    attr_accessor :name, :species
    def initialize(name, species)
        @name = name
        @species = species
    end
    def speak
        "My name is #{@name}. I am a #{@species}"
    end
end

#? Dog inherits Animal
class Dog < Animal
    attr_reader :name, :species
    def initialize(name)
        @name = name
        @species = 'dog'
    end
end

#? Cat inherits Animal
class Cat < Animal
    attr_reader :name, :species
    def initialize(name)
        @name = name
        @species = 'cat'
    end
end

fido = Dog.new('Fido')
ella = Cat.new('Ella')
jack = Animal.new("Jack", "Kangaroo")

fido.speak
#? >> "My name is Fido. I am a dog"
ella.speak
#? >> "My name is Ella. I am a cat"
jack.speak
#? >> "My name is Jack. I am a Kangaroo"

#! Testing methods...
Animal.class.ancestors
#? >> [Class, Module, Object, Kernel, BasicObject]
Dog.class.ancestors
#? >> [Class, Module, Object, Kernel, BasicObject]
fido.class.ancestors 
#? >> [Dog, Animal, Object, Kernel, BasicObject]
fido.class.superclass
#? >> Animal

fido.class
#? >> Dog
jack.class
#? >> Animal

fido.instance_of? Animal
#? >> false
fido.instance_of? Dog
#? >> true

#//                                                 
#! Resolution order Or Ancestor chain

#* class Animal
#*     def initialize(name, species)
#*     end
#* end

#* class Mammal < Animal
#* end

#* class Dog < Mammal
#* end

#* class Cat < Mammal
#*     def initialize(name)
#*     end
#* end

#? as soon as we hit an initialize, the process stops. 
#? ex.. Cat will use the Cat initialize, while Dog and Mammal will use the Animal initialize
#//                                                 
#! super()
class Parent
    attr_reader :name, :status
    def initialize(name, status)
        @name = name
        @status = status
    end


    def speak
        puts "Hi"
    end
end

class Child < Parent
    def initialize(name, status="Child")
        super(name, status)
    end
    def speak
        super()
        puts "Wahh"
        super()
    end
end

class Baby < Child
    def initialize(name, status="Baby")
        super(name, status)
    end

    def speak
        super()
        puts "aaa"
        
    end
end
child = Child.new("child")
baby = Baby.new("baby")

#? child.speak
#? >> Hi
#? >> Wahh
#? >> Hi

#? baby.speak
#? >> Hi
#? >> Wahh
#? >> Hi
#? >> aaa

#? child.status
#? >> "Child"

#? baby.status
#? >> "Baby"
#//                                                 
#! Private methods
#? Private methods can only be be 

class King
    attr_reader :name, :money

    def initialize(name, money)
        @name = name
        @money = money
    end

    def speak                #! Does not work if you call self.bank because self.bank is a private method.
        "My name is #{@name} and I am worth $#{bank}"
    end

    private
    def bank
        @money * 1000
    end

end

charles = King.new("King Charles", 500000)

#? charles.speak
#? >> "My name is King Charles and I am worth $500000000"

#? charles.bank
#? >> NoMethodError: private method `bank' called for #<King:0x00007f9ef8139a68 @name="King Charles", @money=500000> from (pry):2:in `<main>'


#//                                                 
#! Modules
#? Example module...
#* Keyword -module-
module Lunch
    def sandwich
        "one order of chicken sandwich!"
    end
    def cocktail(name_string)
        "one margarita with #{name_string}!"
    end
end

module AllRestaurants
    def purpose
        "Our purpose is to serve food."
    end
end

#? Usage...
class Restaurant
    #* Keyword -include-... used for instance methods
    include Lunch
    #* Keyword -extend-... used for class methods
    extend AllRestaurants

    attr_reader :name
    def initialize(name)
        @name = name
    end
end

shaya = Restaurant.new("Shaya")

#? shaya.sandwich
#? >> "one order of chicken sandwich!"
#? shaya.cocktail("Rum")
#? >> "one margarita with Rum!"

#? Restaurant.purpose
#? >> "Our purpose is to serve food."
#//                                                 
#! Nested Modules
#? Example...
module Daily
    module Lunch
        def sandwich
            "one order of chicken sandwich!"
        end
    end
    
    module AllRestaurants
        def purpose
            "Our purpose is to serve food."
        end
    end
end

class Bar
    include Daily::Lunch
    extend Daily::AllRestaurants

    attr_reader :name
    def initialize(name)
        @name = name
    end
end

diver = Bar.new("Dive Bar")

#? diver.sandwich
#? >> "one order of chicken sandwich!"

#? Bar.purpose
#? >> "Our purpose is to serve food."
#//                                                 


binding.pry
