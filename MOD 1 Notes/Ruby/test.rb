#? Makes first letter uppercase
# def name(string)
#     ar = string.split('')
#     ar[0].upcase!
#     ar.join(', ')
#     return ar
# end


#//                                                 
#? organizes all emails into array
# require 'pry'
# class EmailAddressParser
#     def initialize(string)
#         delimiters = [', ', ',', ' ']
#         #! Seperate string when there is a ','(comma) ' '(space) ', '(comma & space)
#         emails = string.split(Regexp.union(delimiters))
#         #! push the seperated string into the array
#         binding.pry
#         #! removes duplicates from the array.
#         @email = emails.uniq
#     end

#     attr_accessor :email

#     def parse 
#         @email
#     end


# end

# email_addresses = "john@doe.com, person@somewhere.org, avi@test.com,avi@test.com,avi@test.com arel@test.com"
# parser = EmailAddressParser.new(email_addresses)
 
# print parser.parse
# //                                                
# #? class example
# class Pet

#     @@str = "Pet"


#     def initialize(name)
#       @name = name
#     end
   
#     def name=(name)
#       @name = name
#     end
   
#     def name
#       @name
#     end

#     def self.get_class_name
#         "Pet"
#     end
#   end
   
#   dog = Pet.new('Toast')
#   cat = Pet.new('Meow')
  
# p Pet.get_class_name
# p Pet.methods
# p Pet.instance_variables
#//                                                     

# # code here!
# require 'pry'
# class School
#     #! has an empty roster when initialized
#     def initialize(school_name)
#         @name = school_name
#         @roster = {}
#         @grade = []
#     end

#     #! simple getter
#     attr_reader :roster
#     #! simple setter
#     # attr_writer 


#     #! able to add students
#     #! able to add multiple students to a calss
#     #! able to add students to different grades
#     def add_student(student, grade)
#        #! if grade doesn't exist, we need to create a grade
#         if @roster[grade]
#             @roster[grade] << student
#        #! if grade does exist, we should push the student's name into the grade
#         else
#             @roster[grade] = [student]
#         end
#     end


#     #! retrieve students from a grade
#     def grade(grade)
#         #! find the grade in roster & return the array
#         @roster[grade]
#     end

#     #! Go through each grade & sort the array.
#     def sort
#         #! Create a list of keys
#         arr = @roster.map{|k, v| k}
#         count = 0
#         #! We count through each key to access each array
#         while count < @roster.length
#             #! sort each array
#             @roster[arr[count]].sort!
#             binding.pry
#             count += 1
#         end
#         #! return roster
#         @roster
#     end
#     #! Side note: 
#     #?    @roster[9]
#     #? => ["Homer Simpson", "Bart Simpson"]
# end


# @school = School.new("Test School")

# p @school.roster.length

# @school.add_student("Homer Simpson", 9)
# @school.add_student("Bart Simpson", 9)
# @school.add_student("Avi Flombaum", 10)
# @school.add_student("Jeff Baird", 10)
# @school.add_student("Blake Johnson", 7)
# @school.add_student("Jack Bauer", 7)

# p @school.sort
# #//``````````````````````````````
