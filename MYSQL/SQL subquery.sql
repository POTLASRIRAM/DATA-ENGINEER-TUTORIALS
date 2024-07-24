use sql_analysis;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);
drop table customers;
drop table orders;

INSERT INTO customers (customer_name, customer_email) VALUES
    ('John Doe', 'johndoe@example.com'),
    ('Jane Smith', 'janesmith@example.com'),
    ('Bob Johnson', 'bobjohnson@example.com');

INSERT INTO orders (customer_id, order_date, order_amount) VALUES
    (1, '2021-01-01', 50.00),
    (1, '2021-02-01', 75.00),
    (2, '2021-02-15', 125.00),
    (3, '2021-03-01', 200.00);
    
    select * from customers;
    select * from orders;
    
-- What is the customer name and email of customers who have placed orders with an amount greater than $100?
select customer_name,customer_email from customers where customer_id in  (select customer_id from orders where order_amount>100);

-- What is the customer name, email, total number of orders they have placed, and total order amount for each customer?
select (select customer_name from customers where customers.customer_id = orders.customer_id) as customer_name,
(select customer_email from customers where customers.customer_id = orders.customer_id) as customer_email,
customer_id,
count(*) as total_no_orders,
sum(order_amount) as total_amount from orders  group by customer_id; 



