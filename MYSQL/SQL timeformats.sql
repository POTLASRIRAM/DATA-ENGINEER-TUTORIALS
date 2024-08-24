CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  marks FLOAT(2)
);

drop table students;

INSERT INTO students (name, age, marks) VALUES
  ('John', 20, 78.5),
  ('Jane', 22, 89.2),
  ('Peter', 21, 92.3),
  ('Mary', 23, 86.7),
  ('David', 19, 73.9);
  
  select * from students;
  
  SELECT name, CAST(age AS CHAR) FROM students;
  
  select * from orders;
  drop table orders;
  
  CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    customer_name VARCHAR(255),
    total_amount NUMERIC(10,2)
);

INSERT INTO orders (order_date, customer_name, total_amount) VALUES
('2022-01-01 10:00:00', 'John Doe', 100.00),
('2022-01-02 12:30:00', 'Jane Smith', 200.50),
('2022-01-03 14:45:00', 'Bob Johnson', 50.25),
('2022-01-04 20:15:00', 'Sara Lee', 75.80);

select customer_name, cast(order_date as date) from orders;
select customer_name, cast(order_date as datetime) from orders;
select customer_name, cast(order_date as timestamp) from orders;
select customer_name, cast(order_date as timestamp) as order_date_timestamp from orders;
select customer_name, cast(order_date AS TIMESTAMP) AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' AS order_datetime_ny from orders;




