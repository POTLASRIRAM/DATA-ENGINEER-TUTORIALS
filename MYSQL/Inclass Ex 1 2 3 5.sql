use mysql;
create table customers( customer_id int, first_name varchar(100), last_name varchar(100),age int, country varchar(100));
create table Orders( order_id int, item varchar(100),amount int,customer_id int);
create table shippings(shipping_id int,status varchar(100), customer int);
ALTER TABLE Shippings
MODIFY COLUMN status varchar(100);

Insert into customers values
('1'	,'John'	,'Doe',	'31',	'USA'),
('2',	'Robert'	,'Luna',	'22',	'USA'),
('3',	'David',	'Robinson',	'22',	'UK'),
('4',	'John',	'Reinhardt',	'25',	'UK'),
('5',	'Betty',	'Doe',	'28',	'UAE');

Insert into Orders values
('1','	Keyboard','	400','	4'),
('2',	'Mouse',	'300',	'4'),
('3'	,'Monitor',	'12000',	'3'),
('4'	,'Keyboard',	'400','	1'),
('5',	'Mousepad',	'250',	'2');

Insert into Shippings values
(1,	'Pending',	2),
(2,	'Pending',	4),
(3,	'Delivered',	3),
(4,	'Pending',	5),
(5,'Delivered',	1);

Select * from Customers;
Select * from Orders;
Select * from Shippings;
show databases;
--  a) Display all the information of all the customers
Select * from customers;
--  b) Display the first name and last name of all the customers
select first_name,last_name from customers;
--  c) Display the first name and last name of the customers from the US
select first_name,last_name from customers where country like '%US%';
--  d) Display the order information for customer ID #4
select * from orders where order_id = 4;
--  e) Display the shipping status for customer #4
select * from Shippings where shipping_id = 4;
--  f) Display the information for customers who are less than 30 years old.
select * from customers where age<30;
--  g) Display all the items that have an order amount of more than 500
select * from orders where amount>500;
--  h) Display information of the customers that have their last names starting with the letter R.
select * from customers where last_name like 'r%';


   -- 1. Display information of the customers that have their last names starting with the letter R
   select * from customers where last_name like 'r%';
   -- 2. Display information of the customers whose age is greater than 20 and from the US
   select age from customers where age>20 and country = 'USA';
   -- 3. Display information on the keyboard orders that have an amount greater than 300
   select * from orders where item = 'keyboard' and amount>300;
   -- 4. Identity the products which the order's amount is in the range of 300 to 400
   select item from orders where amount between 300 and 400;
-- 5.Identity the products which the order's amount is in the range of 100 to 500 and has a customer ID of 1
   select item from orders where amount between 100 and 500 and customer_id = 1;
   -- 6. Identify all the customers that have Null value in the country field.
   select * from customers where country = 'null';
   -- 7. Identify all the products that have the order amount not null and in descending order.
   select item from orders where amount is not null order by amount desc;
   
   --    1. Customers Table:
       -- ◦ Add a primary key constraint on customer_id.
       -- ◦ Add NOT NULL constraints on first_name, last_name, and country.
       -- ◦ Add a CHECK constraint on age to ensure it is a positive integer.
alter table customer modify column customer_id int primary key;
alter table customer modify column first_name set not null;





  --  1) Display information about the customer from the U.S. who is the youngest.
  select customer_id,first_name,last_name,age,country from customers where country = 'USA' and age = (select min(age) from customers where country = 'USA');

  --  2) Display information about the customer who is the oldest.
  select * from customers where age = (select max(age) from customers);
  
  --  3) Display the number of customers from each country and find the country that has the highest number of customers.
  select distinct country, count(customer_id) as cust_count from customers group by country order by cust_count desc ;
  
  --  4) Display the first two countries that have the highest number of customers.
 select distinct country, count(customer_id) as cust_count from customers group by country order by cust_count desc limit 2; 
  
  --  5) Display the information of all the shipping that have the pending status. Make the column name more readable (e.g. status will be displayed as shipping status, and customer will be displayed as customer_id).
 select status as shipping_status, customer as customer_id from shippings where status ='pending';
 
 --  6) Display a new table in which one column will contain information about customer full name (first name and last name) that is older than 30 years old.
  create view customer_details as select customer_id, first_name||' '||last_name ,age,country from customers;
  select * from customer_details;
  
  --  7) Find how many shipping that is in pending status.
  select count(status) from shippings where status ='pending';
  
  --  8) Display the number of customers from different countries, which country has the highest number of customers.
  select distinct country, count(customer_id) as cust_count from customers group by country order by cust_count desc ;
  
  --  9) Use left Join to return all records from the Customers table, and the matching records from the Order table.
  select *  from customers c left join orders o on c.customer_id = o.customer_id;
  
  --  10) Use right join to return all records from the shipping table, and the matching records from the customer table.
select *  from customers c right join shippings s on s.customer = c.customer_id;
 
 --  11) Using inner join to display the customer information including first name, last name, age, country, order  items, order amount.
select * from customers c inner join orders o on c.customer_id = o.customer_id;