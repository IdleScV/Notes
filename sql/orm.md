Object Relational Mapping (ORM) is the technique of accessing a relational database using an object-oriented programming language.
Object Relational Mapping is a way for our Ruby programs to manage database data by "mapping" database tables to classes and instances of classes to rows in those tables.


    Creating a new Database with ruby...
        database_connection = SQLite3::Database.new('db/pets.db')
        
    Creating a new Table
        database_connection.execute("CREATE TABLE IF NOT EXISTS cats(id INTEGER PRIMARY KEY, name TEXT, breed TEXT, age INTEGER)")
     
        database_connection.execute("CREATE TABLE IF NOT EXISTS owners(id INTEGER PRIMARY KEY, name TEXT)")


    Adding cats to our database
        database_connection.execute("INSERT INTO cats (name, breed, age) VALUES ('Maru', 'scottish fold', 3)")
        
        database_connection.execute("INSERT INTO cats (name, breed, age) VALUES ('Hana', 'tortoiseshell', 1)")

    Using ORB, we can do this..
        class Cat
            
            @@all = []
            
            def initialize(name, breed, age)
                @name = name
                @breed = breed
                @age = age
                @@all << self
            end
            
            def self.all
                @@all
            end
            <!-- ! This allows us to add new cats to our database. -->
            def self.save(name, breed, age, database_connection)
                database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
            end
        end

    Now we add cats through Ruby with much less text.
            
            database_connection = SQLite3::Database.new('db/pets.db')
     
            Cat.new("Maru", "scottish fold", 3)
            Cat.new("Hana", "tortoiseshell", 1)
            
            Cat.all.each do |cat|
            Cat.save(cat.name, cat.breed, cat.age, database_connection)
            end

Thats the fundamentals of ORM.
<!-- //                                                                                                  -->
CRUD = CREATE, READ, UPDATE, DELETE
<!-- //                                                                                                  -->
Now the actuall process of creating a database with ruby
    1. Require the things we need. (in the environment.rb)
            require 'sqlite3'
            require_relative '../lib/song.rb'
            
            DB = {:conn => SQLite3::Database.new("db/music.db")} / DB is equal to a hash that contains our connection to the database
                Therefore, in our lib/song.rb file we can call DB[:conn] to access the connection to our database.

    2. Write a class that helps us create a table (in the song.rb) (.create_table)
            class Song
     
                attr_accessor :name, :album, :id
                
                def initialize(name, album, id=nil)
                    @id = id
                    @name = name
                    @album = album
                end
                
                def self.create_table
                    sql =  <<-SQL 
                    CREATE TABLE IF NOT EXISTS songs (
                        id INTEGER PRIMARY KEY, 
                        name TEXT, 
                        album TEXT
                        )
                        SQL
                    DB[:conn].execute(sql) 
                end
                
            end

    3. Implement a method into our class that adds data to our database (#save)
                def save
                    sql = <<-SQL
                    INSERT INTO songs (name, album) 
                    VALUES (?, ?)
                    SQL
                
                    DB[:conn].execute(sql, self.name, self.album)
                
                end

    3. Implement a way to give our instances an ID
                def save
                    sql = <<-SQL
                    INSERT INTO songs (name, album) 
                    VALUES (?, ?)
                    SQL
                
                    DB[:conn].execute(sql, self.name, self.album)
                
                    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0] <!--!HERE!-->
                
                end

    3. Implement a way to wrap the initizliers and our save so every new instance is automatically saved to our databse.
                def self.create(name:, album:)
                    song = Song.new(name, album) / We can initialize
                    song.save   / We then call the new instance with the save function to be stored into our database
                    song
                end

    3. Full Class...
                class Song
        
                    attr_accessor :name, :album, :id
                    
                    def initialize(name, album, id=nil)
                        @id = id
                        @name = name
                        @album = album
                    end
                    
                    def self.create_table
                        sql =  <<-SQL / <!--! the <<-SQL(CODE)SQL allows us to write in multiple lines-->
                        CREATE TABLE IF NOT EXISTS songs (
                            id INTEGER PRIMARY KEY, 
                            name TEXT, 
                            album TEXT
                            )
                            SQL
                        DB[:conn].execute(sql) 
                    end

                    def save
                        sql = <<-SQL
                        INSERT INTO songs (name, album) 
                        VALUES (?, ?) / <!--! This ? allows us to pass in the name and the album afterwards-->
                        SQL
                        DB[:conn].execute(sql, self.name, self.album) <!--!This is the 'afterwards-->
                        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0] <!--!HERE we are seeting the id to our row id!-->
                    end
                    <!--* This is another way to write our save -->
                    def self.save(username)
                        user = user.new(username)
                        sql_insert_user = 'INSERT INTO users (username) VALUES (?)'
                        DB.execute(sql_insert_user)
                        db_id = DB.execute("SELECT LAST_INSERT_ROWID()")[0][0]
                        user.id = db_id
                        user
                    end
                    <!--* This DB does not include [:conn becuase our environemnet file, line 60, in this situation is not a hash and is DB = SQLite3::Database.new("db/music.db".)]  -->
                    
                    def self.create(name:, album:)
                        song = Song.new(name, album) / We can initialize
                        song.save   / We then call the new instance with the save function to be stored into our database
                        song
                    end
                end

    4. Using this class...
            Song.create_table
            Song.create(name: "Hello", album: "25")

<!-- //                                                                                                  -->
<!-- //     -->
Methods of ORM
<!-- //     -->
class Users
    def initialize (user_name, id='nil')
        @user = user_name

    end
<!--* User.save(username) -->
<!--? Add a username to the Database -->
        def self.save(username)
            user = user.new(username)
            sql_insert_user = 'INSERT INTO users (username) VALUES (?)'
            DB.execute(sql_insert_user)
            db_id = DB.execute("SELECT LAST_INSERT_ROWID()")[0][0]
            user.id = db_id
            user
        end
<!--* User.find(id) -->
<!--? Returns an instance of User from the Database  -->
        def self.find(find.id)
            sql_select_all = "SELECT * FROM users WHERE id = (?)"
            array = DB.execute(sql_select_all, find_id)
            user_data = array[0] <!--* We do this because our database returns an array inside an array-->
            User.new(user_data[1], user_data[0])
        end
<!--* User.all-->
<!--? Return an array of all the instancesfrom the DB-->
        def self.all
            sql_find = "SELECT * FROM users"
            users_array = DB.execute(sql_find)
            users_array.map{|user_data| User.new(user_data[1], user_data[0])}
        end
<!--* delete-->
<!--? Deleteing a user from our database -->
        def delete
            sql_delete = "DELETE FROM users WHERE id = (?)"
            DB.execute(sql_delete, self.id)
            self
        end
end