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


select * from customers c
inner join 
orders o
on c.cust_id = o.cust_id;



SELECT 
  c.cust_name,
  COUNT(o.ord_id) AS total_orders,
  sum(o.price) as price
FROM customers c2
INNER JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;


SELECT 
  c.cust_name,
  COUNT(o.ord_id) AS total_orders,
  sum(o.price) as price
FROM customers c
left JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;


-- right join  
SELECT 
  c.cust_name,
  COUNT(o.ord_id) AS total_orders,
  sum(o.price) as price
FROM customers c
right JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;



-- leetcode
select v.customer_id , count(*) as count_no_trans from
visits v left join Transactions t
on v.visit_id = t.visit_id and t.amount is not null
where t.amount is null
group by v.customer_id;


-- Queries Quality and Percentage

SELECT 
    query_name AS query_name, 
    ROUND(SUM(rating::DECIMAL / position) / COUNT(query_name), 2) AS quality,
    ROUND(
        100.0 * COUNT(CASE WHEN rating < 3 THEN 1 END) / COUNT(query_name),
        2
    ) AS poor_query_percentage
FROM 
    Queries
GROUP BY 
    query_name;
