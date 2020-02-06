require 'active_record'

require_relative './db/students.db'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "./db/students.db"
  )

sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
    )
    SQL

ActiveRecord::Base.connection.execute(sql) #! Creates a table in our db/students.sqlite

class Student < ActiveRecord::Base
end

#! Retrieve a list of all the columns in the table:
Student.column_names
#=> [:id, :name]

#! Create a new Student entry in the database:
Student.create(name: 'Jon')
# INSERT INTO students (name) VALUES ('Jon')

#! Retrieve a Student from the database by id:
Student.find(1)

#! Find by any attribute, such as name:
Student.find_by(name: 'Jon')
# SELECT * FROM students WHERE (name = 'Jon') LIMIT 1

# ! attr_accessors
student = Student.find_by(name: 'Jon')
student.name
#=> 'Jon'

student.name = 'Steve'
 
student.name
#=> 'Steve'

#! #save
student = Student.find_by(name: 'Jon')
student.name = 'Steve'
student.save