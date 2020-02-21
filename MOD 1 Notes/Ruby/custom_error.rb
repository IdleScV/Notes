#! chart of error class inheritance
Exception
NoMemoryError
ScriptError
  LoadError
  NotImplementedError
  SyntaxError
SignalException
  Interrupt
StandardError
  ArgumentError
  IOError
    EOFError
  IndexError
  LocalJumpError
  NameError
    NoMethodError
  RangeError
    FloatDomainError
  RegexpError
  RuntimeError
  SecurityError
  SystemCallError
  SystemStackError
  ThreadError
  TypeError
  ZeroDivisionError
SystemExit
fatal


#!///               
# #! Basic pattern of eror rescuing
#* begin
#*     raise YourCustomError
#*   rescue YourCustomError
#* end

#? Example...
class Person
    attr_accessor :partner, :name
   
    def initialize(name)
      @name = name
    end
   
    def get_married(person)
      self.partner = person
      if person.class != Person
        begin
          raise PartnerError
        rescue PartnerError => error
            puts error.message
        end
      else
        person.partner = self
      end
    end
   
    class PartnerError < StandardError
      def message
        "you must give the get_married method an argument of an instance of the person class!"
      end
    end
  end
   
  beyonce = Person.new("Beyonce")
  beyonce.get_married("Jay-Z")
  puts beyonce.name
  
#? >>    you must give the get_married method an argument of an instance of the person class!
#? >>    Beyonce