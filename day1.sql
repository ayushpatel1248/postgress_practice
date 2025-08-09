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
 
-- for insrting multi user data in table

 insert into person(id, name, city)
 values(2, 'neeraj', 'dewas'),
 (3, 'harshit', 'dewas'),
 (4, 'bansal', 'kota');
 

  -- for reading the data 
 -- universal querry
 select * from person;
 select name from person;
 select name, city from person;
 
  -- now updating the data into the table 
-- where is known as clause
 update person 
 set city = 'banglore'
 where name = 'ayush';


-- now deleting the data
-- always use the primary key for modifying
delete from person 
where name = 'neeraj';


-- creating the bank table
CREATE table bankData(
emp_id SERIAL PRIMARY KEY,
fname varchar(50) NOT NULL,
lname varchar(50) NOT NULL,
email varchar(100) NOT NULL UNIQUE ,
dept varchar(50 ),
salary DECIMAL(10, 2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO bankdata (emp_id, fname, lname, email, dept, salary, hire_date) 
      VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');



-- clause is sql querry with some condition 

-- WHERE, DISTINCT, ORDER BY, LIMIT, LIKE

 
 select * from bankdata
where salary >= 50000 and dept='IT';

select * from bankdata  
WHERE dept IN('it', 'finance');

select * from bankdata  
WHERE dept NOTIN('it', 'finance');

select * from bankdata 
WHERE salary BETWEEN 50000 AND 60000;


-- DISTINCT is used for unique values and avoid repeatation

select distinct dept from bankdata;

-- ORDER BY for ascensding order sorting
--  for DESCending ORDER BY DESC
select fname from bankdata order by fname;
select fname from bankdata order by fname DESC;


-- limit clause

select * from bankdata limit 3;

-- for pattern we use like

select * from bankdata 
where fname like 'A%';

-- for matching from last 
select * from bankdata 
where fname like '%A';

-- for any where in the text patter match
select * from bankdata 
where fname like '%A% ';

-- if want 2nd or 3rd or any letter or any number of letter we use _ underscore
-- its for finding dept which have only 2 charc
select * from bankdata 
where dept like '__';

-- for second charc to be a
select * from bankdata 
where fname like '_a%';


-- to get count  
select count(emp_id) from bankdata 
where salary >= 50000;

 select sum(salary) from bankdata 
where salary >= 50000;

select avg(salary) from bankdata 
where salary >= 50000;

select min(salary) from bankdata;

select max(salary) from bankdata;

-- very imp GROUP BY

select dept, count(dept), max(salary) from bankdata group by dept;


select * from bankdata;
select replace(dept ,'IT', 'TECH') from bankdata;
select salary, count(salary) from bankdata group by salary;
select dept ,count(dept) from bankdata group by dept;


select distinct dept as alldept from bankdata where salary > 60000;
select * from bankdata
order by salary desc;

select * from bankdata limit 3;

select * from bankdata
where substr(fname, 1, 1) = 'A';

select * from bankdata
where length(fname) = 4;

select  dept, sum(salary) as totalsalbydept , count(dept) from bankdata
group by dept;

alter table bankdata
rename column foname to fname;

alter table bankdata
alter column fname
set data type VARCHAR(150);

alter table bankdata
add column mob varchar(15)
check (length(mob) >= 10);


-- for updating the data in table 
UPDATE bankdata 
set mob = 6272868
where salary >= 50000;


-- inserting new value into the table 
insert into bankdata(fname, lname, email, dept, salary, mob)
values('rimon', 'chakraboarty', 'abc@gmail.com', 'IT', 50000, 8269987586);
