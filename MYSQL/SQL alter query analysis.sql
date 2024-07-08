use sql_analysis;

create table users(
id serial primary key,
name varchar(20),
email varchar(100),
age int);

INSERT INTO users (name, email, age) VALUES
    ('John Doe', 'john@example.com', 25),
    ('Jane Doe', 'jane@example.com', 30),
    ('Bob Smith', 'bob@example.com', 40);
    
alter table users rename column email to user_email;
alter table users add column phone int(10);
alter table users drop column phone;
alter table users alter column age set smallint;
select * from users;