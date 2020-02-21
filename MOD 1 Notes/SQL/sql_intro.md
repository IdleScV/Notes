What is SQL

SQL (Structured Query Language) is a language for managing data in a database.
Even though SQL has just one purpose, it is used by many different database systems such as MySQL, PostgreSQL, and SQLite

To check if SQLite is installed, in terminal...
    which sqlite3 
if returns 
    /usr/bin/sqlite3
then all is good

Now to use SQLite, in terminal...
    sqlite3 test_sqlite.db 
    sqlite> create table test_table(id);
    sqlite> .quit
There is now a test_sqlite.db file

TIP: All SQL statements that you write in your terminal, inside the sqlite prompt, sqlite3>, must be terminated with a semi-colon ;. except .quit

Use lower case and snake_case conventions for column names
Use the CREATE TABLE keyword to create a new table with columns, including the id column
Use the .help command to get a complete list of SQL commands
Use the .tables command to list all the tables in a database
Use the .schema command to look at the structure of a database
Use the ALTER TABLE keywords to add columns to a table
Use the DROP TABLE keywords to delete a table
<!-- //                                      -->
creating a table in SQlite in terminal...
    sqlite3 pet_database.db
    sqlite> CREATE TABLE cats; (will leader to an error)
        sqlite> CREATE TABLE cats (
            id INTEGER PRIMARY KEY, / Every table should have this to index, PRIMARY KEY comes with SQL and is unique and auto-incrementing.  starts at 1.
                    name TEXT, 
                    age INTEGER
                ); / Note that the use of capitalization is arbitrary, but it is a convention to help separate the SQL commands from the names we make up for our tables and columns. 
    sqlite> .help 

    .help shows us a list of commands
    
    .table shows us a list of tables

    .schema shows us the structure of our database

Altering a table in terminal...

    sqlite> ALTER TABLE cats ADD COLUMN breed TEXT; / this adds a new column of breed with the type of TEXT.

Deleting a table in terminal...

    sqlite> DROP TABLE cats;

<!-- //                                               -->
Writing SQL in text editors
To write SQL in our text editor and execute that SQL against a specific database, we'll create files in our text editor that have the .sql

using sqlite3 pets_database.db < 02_add_column_to_cats.sql we can execute sql code into the pets_database.db (check other files in this folder.)
<!-- //                                                -->
SQL DATA types
    TEXT- Any alphanumeric characters which we want to represent as plain text.
    INTEGER- Anything we want to represent as a whole number. 
    REAL- Anything that's a plain old decimal like 1.3 or 2.25.
    BLOB- generally used for holding binary data.
More info: https://www.sqlite.org/datatype3.html
<!-- //                                                 -->
manipulate and select data from SQL database tables.
    <!-- // -->
    First open up the pets_database.db in terminal...
            sqlite3 pets_database.db
    <!-- // -->
    Use the INSERT INTO command to insert data (i.e. rows) into a database table
        Example...
            INSERT INTO cats (name, age, breed) VALUES ("Hannah", 1, "Tabby");
                or 
            sqlite3 pets_database.db < 03_insert_cats_into_cats_table.sql
    <!-- // -->
    Use SELECT statements to select data from a database table
        Basic...
            SELECT [names of columns we are going to select] FROM [table we are selecting from];
        Example... 
            SELECT id, name, age, breed FROM cats;
            Returns...  1|Maru|3|Scottish Fold
                        2|Lil' Bub|5|American Shorthair
                        3|Hannah|1|Tabby
        Faster way... 
            SELECT * FROM cats;
            Returns...  1|Maru|3|Scottish Fold
                        2|Lil' Bub|5|American Shorthair
                        3|Hannah|1|Tabby
        Speicific... 
            SELECT name, age FROM cats;
            Returns...  Maru|3
                        Lil' Bub|5
                        Hannah|1
        No duplicates...
            SELECT DISTINCT name FROM cats;
    <!-- // -->
    Use the WHERE Clause to select data from specific table rows or conditions
        Basic...
            SELECT * FROM [table name] WHERE [column name] = [some value];
        Example...
            SELECT * FROM cats WHERE name = "Maru";
            Returns... 1|Maru|3|Scottish Fold

    Use comparison operators, like < or >, to select specific data
        Example...
            SELECT * FROM cats WHERE age < 2;
            Returns... 3|Hannah|1|Tabby
    <!-- // -->
    Use UPDATE statements to update data within a database table
        Basic...
            UPDATE [table name] SET [column name] = [new value] WHERE [column name] = [value];
        Example...
            UPDATE cats SET name = "Hana" WHERE name = "Hannah";
            SELECT name FROM cats;
            Returns...  Maru
                        Lil' Bub
                        Hana
    <!-- // -->
    Use DELETE statements to delete data from a database table
        Basic...
            DELETE FROM [table name] WHERE [column name] = [value];
        Example...
            DELETE FROM cats WHERE id = 3;
            SELECT * FROM cats;
            Returns...  1|Maru|3|Scottish Fold
                        2|Lil' Bub|5|American Shorthair
<!-- //                                      -->
You can format the output of your select statements with a few helpful options:

    .headers on       # output the name of each column
    .mode column     # now we are in column mode, enabling us to run the next two .width commands
    .width auto      # adjusts and normalizes column width 
                    # or
    .width NUM1, NUM2 # customize column width