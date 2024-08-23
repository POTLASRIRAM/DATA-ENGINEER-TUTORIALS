select * from customers;
select * from orders;

create table customers_orders as select c.customer_id,c.first_name,c.last_name,o.item,o.quantity,o.price from customers c join orders o on c.customer_id=o.customer_id;