SELECT => select/retrive fields from 1 or more table
FROM => tables from which to get fields
WHERE => criteria for rows to be retrieved
GROUPBY => criteria for grouping
ASC => order ascending
DESC => order descending
AND => logical AND
OR => logical OR
ORDER BY => criteria for ordering/sorting records
INSER INTO => insert values into 1 or more tables
UPDATE => update existing data in specified tables
DELETE FROM => delete data from speicified table


# LIKE
`SELECT` *
`FROM` Employees
`WHERE` LastName `LIKE` "Germany"
`ORDER BY` SocialSecurityNumber `DESC`

# AND
`SELECT` *
`FROM` Employees
`WHERE` LastName `LIKE` "Germany" `AND` FirestName `LIKE` "Charles"
`ORDER BY` SocialSecurityNumber `DESC`

# OR
`SELECT` *
`FROM` Hyrule
`WHERE` FirestName `LIKE` "Link" `AND` FirestName `LIKE` "Zelda"
`ORDER BY` Rupees `DESC`

# Multiple Tables
`SELECT` *
`FROM` Hyrule, NPC
`WHERE` Hyrule.LastName = NPC.LastName
`ORDER BY` Rupees `DESC`

# INSERT INTO
`INSERT INTO` Players (FirtName, LastName)
`VALUES` ("Charles", "Germany")

# UPDATE INFO in fields
`UPDATE` Employees
`SET` SSN=24827372
`WHERE` LastName = "Germany `AND` FirstName = "Charles"

# Creating a Table
`CREATE TABLE`
Ponies( ID Integer, PonyName Text(32))

# Delete Table
`DROP TABLE` Ponies

# Insert information into fields
`INSERT INTO`
Ponies
`VALUES` (1, "Starlite")