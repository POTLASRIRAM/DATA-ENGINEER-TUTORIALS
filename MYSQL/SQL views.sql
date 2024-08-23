CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

drop table customers;

select * from customers;

select * from orders;
drop table orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    item TEXT,
    quantity INT,
    price NUMERIC(10,2)
);


INSERT INTO customers (customer_id, first_name, last_name)
VALUES (101, 'John', 'Doe');

INSERT INTO orders (order_id, customer_id, order_date, item, quantity, price)
VALUES (1, 101, '2022-01-01', 'Shoes', 2, 50);

create view customer_orders as select c.customer_id,c.first_name,c.last_name,o.item,o.quantity,o.price from customers c join orders o on c.customer_id=o.customer_id; 