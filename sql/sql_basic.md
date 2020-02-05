Basic SQL Queries

The term "query" refers to any SQL statement that retrieves data from your database.
<!-- //  -->
The returns in this file have this set up....
        add 01 - 04 of sql files into pets_database.db.
            .headers on      
            .mode column
    <!-- // -->
    Use the ORDER BY modifier to order tables by specific SELECT statements
        Basic: 
            SELECT column_name FROM table_name ORDER BY column_name ASC|DESC;
        Example... 
            SELECT * FROM cats ORDER BY age;
        Return...       id          name        age         breed       owner_id  
                        ----------  ----------  ----------  ----------  ----------
                        2           Hana        1           Tabby       1         
                        5           Patches     2           Calico                
                        1           Maru        3           Scottish F  1         
                        3           Lil\' Bub   5           American S            
                        4           Moe         10          Tabby             
    Use the ASC and DESC modifier to sort queries in ascending and descending orders
        Example... 
            SELECT * FROM cats ORDER BY age DESC; 

    Notes:
            SELECT name FROM cats;
                is the same as 
            SELECT cats.name FROM cats;
        However, with multiple tables, we will have to use tableName.columnName
        Example...
            SELECT cats.name, dogs.name FROM cats, dogs;
    <!--//  -->
    Use the LIMIT modifier to determine the number of records to retrieve from a dataset
        Example...
            SELECT * FROM cats ORDER BY age DESC LIMIT 1;
        Return...       id          name        age         breed       owner_id  
                        ----------  ----------  ----------  ----------  ----------
                        4           Moe         10          Tabby                 
        Example...
            SELECT * FROM cats ORDER BY age DESC LIMIT 2;
        Return...       id          name        age         breed       owner_id  
                        ----------  ----------  ----------  ----------  ----------
                        4           Moe         10          Tabby                 
                        3           Lil\' Bub   5           American S            
    <!--//  -->
    Use the BETWEEN modifier to retrieve a specific data set between two ranges
        Example...
            SELECT name FROM cats WHERE age BETWEEN 1 AND 3;
        Return...   Maru
                    Hana
                    Patches
            
    <!-- // -->
    Use the NULL data type keyword to insert new records into a table
        Example...
            INSERT INTO cats (name, age, breed) VALUES (NULL, NULL, "Tabby");
        Table...        id          name        age         breed          owner_id  
                        ----------  ----------  ----------  -------------  ----------
                        1           Maru        3           Scottish Fold  1         
                        2           Hana        1           Tabby          1         
                        3           Lil\' Bub   5           American Shor            
                        4           Moe         10          Tabby                    
                        5           Patches     2           Calico                   
                        6                                   Tabby                    
        We can select the Null name tabby like sol
            SELECT * FROM cats WHERE name IS NULL;
    <!-- // -->
    Use the COUNT function to count the number of records that meet a certain condition
        Example...
            SELECT COUNT(owner_id) FROM cats WHERE owner_id = 1;
        Return...       COUNT(owner_id)
                        ---------------
                        2              
    <!--//  -->
    Use the GROUP BY function to group your results according to the values in a given column
        Table...
            id          name        age         breed          owner_id  
            ----------  ----------  ----------  -------------  ----------
            1           Maru        3           Scottish Fold  1         
            2           Hana        1           Tabby          1         
            3           Lil\' Bub   5           American Shor            
            4           Moe         10          Tabby                    
            5           Patches     2           Calico                   
            6                                   Tabby        

        Example...
            SELECT breed, COUNT(breed) FROM cats GROUP BY breed;
        Returns...      breed               COUNT(breed)
                        ------------------  ------------
                        American Shorthair  1           
                        Calico              1           
                        Scottish Fold       1           
                        Tabby               3           

        Example...
            SELECT breed, owner_id, COUNT(breed) FROM cats GROUP BY breed, owner_id;
        Returns...      breed               owner_id    COUNT(breed)
                        ------------------  ----------  ------------
                        American Shorthair              1           
                        Calico                          1           
                        Scottish Fold       1           1           
                        Tabby                           2           
                        Tabby               1           1          

 <!--//                                       -->
The GROUP BY() keyword is very similar to ORDER BY(). The only difference is that ORDER BY() sorts the resulting data set of basic queries while GROUP BY() sorts the result sets of aggregate functions.
 <!--//                                       -->
GROUP BY() manipulation...
    Basic...
        SELECT column_name, aggregate_function(column_name)
        FROM table_name
        WHERE column_name operator value
        GROUP BY column_name;

    To add the sum of all pet net worths...
        SELECT owners.name, SUM(cats.net_worth)
        FROM owners
        INNER JOIN cats_owners
        ON owners.id = cats_owners.owner_id
        JOIN cats ON cats_owners.cat_id = cats.id
        GROUP BY owners.name;
    Returns...      owners.name      SUM(cats.networth)
                    ---------------  ----------
                    Sophie           1203400

<!--//                                        -->
Aggregates... 
SUM(), AVG(), MAX()
    Table...    Employee 	Bonus
                --------    -------
                Matthew 	1000
                Abigail 	2000
                Matthew 	500
                Tom 	    700
                Abigail 	1250
    Function... 
        SELECT employee, SUM(bonus) from employee_bonus group by employee;
    Returns...  Employee 	Bonus
                --------    --------
                Abigail 	3250
                Matthew 	1500
                Tom 	    700
    <!-- // -->
    Selecting with Aggregates
        BAD SQL:
            SELECT employee, SUM(bonus) FROM employee_bonus
            GROUP BY employee WHERE SUM(bonus) > 1000;

        GOOD SQL:
            SELECT employee, SUM(bonus) FROM employee_bonus
            GROUP BY employee HAVING SUM(bonus) > 1000;

    <!-- // -->
    HAVING vs WHERE
        HAVING supports aggregate functions as it has to work with groups of rows. so for example, if there are multiple integers in a group it can filter out the groups with a low average, a high total (sum) or count how many rows are in the group.

        WHERE on the other hand deals with each row individually, so aggregate functions wouldn't work for what would you be aggregating.
    <!-- // -->
    SYNTAX ORDER
            SELECT
            FROM
            JOIN
                ON
            WHERE
            GROUP BY
            HAVING
            ORDER BY
            LIMIT
    <!-- // -->
    Aggregate Key vs Foreign Key
    In order to relate two items in two seperate tables, we take one table's aggregate key (Primary Key) and attach it to the item that relates to in in the other table. Once applied, that number becomes a Foreign Key.

    If we have 2 tables, one for cats, and one for owners. We would want to attach the owner's Primary ID to the Pet.

  
        ALTER TABLE cats ADD COLUMN owner_id INTEGER; / This provides us with space to add a foreign key
        UPDATE cats SET owner_id = 1 WHERE name = "Maru"; / This gives the cats an owner_id, thereby setting its foreign key.
   
    Notice that a Owner has many cats but a cat has one owner.
