SQL Joins
Type 	            Description
INNER JOIN 	        Returns all rows when there is at least one match in BOTH tables
LEFT [OUTER] JOIN 	Returns all rows from the left table, and the matched rows from the right table
RIGHT JOIN* 	    Returns all rows from the right table, and the matched rows from the left table
FULL JOIN* 	        Returns all rows when there is a match in ONE of the tables
* Not supported by SQLite
  
Basic... 
        SELECT column_name(s)
        FROM first_table
        JOIN TYPE second_table
        ON first_table.column_name = second_table.column_name;
    Example... INNER JOIN
            SELECT Cats.name, Cats.breed, Owners.name / Data we want in our joint table
            AS 'owner_name' / renames the last select
            FROM Cats  / First table we want to join
            INNER JOIN Owners   / Method of join & type of join
            ON Cats.owner_id = Owners.id; / Tell SQL how to connect them
        Returns...       name             breed            owner_name
                        ---------------  ---------------  ----------
                        Maru             Scottish Fold    mugumogu  
                        Hana             Tabby            mugumogu  
                        Nona             Tortoiseshell    Sophie 

    Example... LEFT [OUTER] Join
            SELECT Cats.name, Cats.breed, Owners.name 
            FROM Cats 
            LEFT OUTER JOIN Owners 
            ON Cats.owner_id = Owners.id;
        Returns...      name             breed            name      
                        ---------------  ---------------  ----------
                        Maru             Scottish Fold    mugumogu  
                        Hana             Tabby            mugumogu  
                        Nona             Tortoiseshell    Sophie 
                        Lil' Bub         perma-kitten                
        
