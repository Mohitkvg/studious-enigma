create database quiz;
use quiz;
#query to display all the cust whose id 2001 below sm id of Mylycon

select * from worker;

select max(purch_amt) from orders;

select first_name from Worker
where First_name like '%i%i%';

select count(*) from worker
where department = 'ADMIN';

select first_name as worker_name, salary from worker
where salary between 50000 and 100000;

select * from worker
where salary > 10000 and salay < 50000;

select Ltrim(department) from worker;

select * from orders where salesman_id = (select salesman_id from salesman where city = 'London');

select max(purch_amt) from orders;

select * from worker;
select concat(First_name,' ',last_name) as 'complete_name' from worker;

select count(*) from worker;
use bi5;

select weekday('2021-11-21 10:34:47');

CREATE DATABASE SUPERSTORES;

use superstores;
#1
select customer_name as CustomerName , customer_segment as Customersegment from cust_dimen;
#2
select * from cust_dimen
order by cust_id desc;
#3
Select order_id, order_date,order_priority from orders_dimen
where Order_priority = 'High';
#4
select * from market_fact;

select sum(sales) as total_sales , avg(sales) as avg_sales from market_fact;
#5
select max(sales) as max_sales , min(sales) as min_sales from market_fact;
#6
select * from cust_dimen;
select distinct region , count(cust_id) as no_of_customers  from cust_dimen
group by region 
order by count(cust_id) desc;

#7 
select distinct region, count(cust_id) as maxno_of_customers 
from cust_dimen
group by region
order by count(cust_id) desc;

#8 Find all the customers from Atlantic region who have ever purchased ‘TABLES’ 
#and the number of tables purchased (display the customer name, no_of_tables 
#purchased) ??????????

select * from cust_dimen;
select * from prod_dimen;
select customer_name, region from cust_dimen 
where region = 'ATLANTIC';
select count(product_sub_category) from prod_dimen
where  product_sub_category = 'TABLES';

#9
select customer_name, customer_segment,count(cust_id) as 'no of small businessowners' from cust_dimen
where region =  'ONTARIO' and customer_segment = 'SMALL BUSINESS'
group by customer_name;

#10

select * from market_fact; 
select * from prod_dimen; 
select distinct prod_id as product_id,count(sales) as no_of_products_sold from market_fact
group by prod_id
order by count(sales) desc;

#11
select prod_id as product_id, product_sub_category from prod_dimen
where product_category = 'FURNITURE' or product_category = 'TECHNOLOGY';

#12 

select product_category, profit 
from prod_dimen
inner join market_fact
on prod_dimen.prod_id = market_fact.prod_id
order by profit desc;

#13 
select product_category, product_sub_category,profit 
from prod_dimen
join market_fact
on prod_dimen.prod_id = market_fact.prod_id;

#14. 

select order_date,order_quantity,sales 
from orders_dimen
join market_fact
on orders_dimen.ord_id = market_fact.ord_id;

#15 
select customer_name from cust_dimen
where customer_name like '_R%' and customer_name like '___D%';

select customer_name from cust_dimen
where customer_name like '_R_D%';
#16....?

select cust_dimen.cust_id,sales,customer_name,region
from cust_dimen
inner join market_fact
on cust_dimen.cust_id = market_fact.cust_id
where sales >1000 and sales <5000
order by sales asc;

#17.?

select sales from market_fact order by sales desc limit 3;

#18 Where is the least profitable product subcategory shipped the most?

select distinct region,product_sub_category,count(shipping_dimen.ship_id) as 'no of shipments',profit as 'profit from each region' from prod_dimen
inner join market_fact
on prod_dimen.prod_id = market_fact.prod_id
inner join cust_dimen
on market_fact.cust_id = cust_dimen.cust_id
inner join shipping_dimen
on market_fact.ship_id = shipping_dimen.ship_id
group by region
order by profit desc;
