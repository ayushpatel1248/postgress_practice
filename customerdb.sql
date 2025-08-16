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




-- immediate food deivlery sql 50

SELECT 
round((count(
    case when customer_pref_delivery_date - order_date = 0 
    then 1
    end
) :: decimal /
count(order_date)) * 100, 2) as immediate_percentage
FROM Delivery d
WHERE order_date = (
    SELECT MIN(order_date)
    FROM Delivery
    WHERE customer_id = d.customer_id
);


-- Game Play Analysis IV

select round((count(*)::decimal / (select count(distinct player_id) from Activity)),2)
as fraction
from Activity a
where event_date = (select min(event_date) 
from Activity  
where player_id = a.player_id) + 1;



-- Number of Unique Subjects Taught by Each Teacher
select teacher_id ,count(teacher_id) as cnt
from (select teacher_id
from teacher
group by teacher_id, subject_id)
group by teacher_id
order by teacher_id;
