show databases;
use sql_analysis;
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
    salary NUMERIC
);
show tables;
select * from employees;
INSERT INTO employees (name, age, salary)
VALUES ('John Doe', 30, 50000);
-- Write an INSERT query to add a new employee 'Jane Smith' with age 25 and salary 45000 to the 'employees' table.

insert into employees(name,age,salary)
values ('jane smith',25, 45000);

update employees  set age='15', name = 'pp'  where id =2;
select count(id) from employees;

-- Write an UPDATE query to change the name of the employee with id 1 to 'John Smith'.

update employees set name = 'John Smith' where id = 1;

delete from employees where id = 4;

drop table employees;


