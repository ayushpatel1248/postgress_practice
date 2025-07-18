SELECT datname FROM pg_database;
-- for deleting the querry use queerry 
DROP database practice;

-- for creating the table in database
CREATE TABLE person(
id INT,
name VARCHAR(100),
city VARCHAR(100)
);

-- for inserting thedata into the table
INSERT into person(id, name, city)
VALUES (1, 'ayush', 'dewas');
 