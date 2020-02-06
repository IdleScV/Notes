Object Relational Mapping (ORM/Object-Relation Mapper) is the technique of accessing a relational database using an object-oriented programming language.
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
                    <!--* This DB does not include [:conn] becuase our environemnet file, line 60, in this situation is not a hash and is DB = SQLite3::Database.new("db/music.db".)  -->
                    
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
in this section, the DB does not include [:conn] becuase in the imaginary environemnet file, does not set our DB as a hash.
instead, DB = SQLite3::Database.new(filename) 
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
        def self.find(find_id)
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
<!--* save -->
<!--? saves an individual instance  -->
        def save
        if self.id / This is incase we updated the instance and would like to avoid duplicates in our Database.
            self.update
        else
            sql = "INSERT INTO users (user) VALUES (?)"
            DB.execute(sql, self.user)
            @id = DB.execute("SELECT last_insert_rowid() FROM users")[0][0]
        end
        end
<!--* delete-->
<!--? Deleteing a user from our database -->
        def delete
            sql_delete = "DELETE FROM users WHERE id = (?)"
            DB.execute(sql_delete, self.id)
            self
        end
<!--* update -->
<!--? Updates a user's information in our database AFTER the information has been updated in ruby-->
        def update
            sql_update = "UPDATE users SET user=(?) WHERE id = ?"
            DB.execute(sql, self.user, self.id)
        end

end
<!--//                                              -->
Complex Methods for ORM
Our Class...
    class Song
        
        attr_accessor :name, :album
        attr_reader :id
        
        def initialize(id=nil, name, album)
            @id = id
            @name = name
            @album = album
        end
        
        def save
            if self.id
            self.update
            else
            sql = <<-SQL
                INSERT INTO songs (name, album)
                VALUES (?, ?)
            SQL
        
            DB[:conn].execute(sql, self.name, self.album)
            @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
            end
        end
        
        def self.create(name:, album:)
            song = Song.new(name, album)
            song.save
            song
        end
        
        def self.find_by_id(id)
            sql = "SELECT * FROM songs WHERE id = ?"
            result = DB[:conn].execute(sql, id)[0]
            Song.new(result[0], result[1], result[2])
        end
        
        def update
            sql = "UPDATE songs SET name = ?, album = ? WHERE id = ?"
            DB[:conn].execute(sql, self.name, self.album, self.id)
        end
    end
<!--* .find_or_create_by -->
<!--? This method is used to add information to our database while avoiding duplicates. -->
      def self.find_or_create_by(name:, album:)
        song = DB[:conn].execute("SELECT * FROM songs WHERE name = ? AND album = ?", name, album)
        if !song.empty?
          song_data = song[0]
          song = Song.new(song_data[0], song_data[1], song_data[2])
        else
          song = self.create(name: name, album: album)
        end
        song
      end
    <!--! in Action  -->
            Song.find_or_create_by(name: "Hello", album: "25")
            Song.find_or_create_by(name: "Hello", album: "25")
            
            DB[:conn].execute("SELECT * FROM songs WHERE name = Hello, album = 25")
            # => [[1, "Hello", "25"]]


