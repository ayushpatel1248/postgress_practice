create table customers(
	cust_id serial primary key,
	cust_name varchar(150) not null
);


CREATE TABLE orders ( 

            ord_id SERIAL PRIMARY KEY, 

            ord_date DATE NOT NULL, 

            price NUMERIC NOT NULL,

            cust_id INTEGER NOT NULL, 

            FOREIGN KEY (cust_id) REFERENCES 

            customers (cust_id) 

);

select * from customers cross join orders;
