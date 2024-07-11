use sql_analysis;

create table students(
id int not null,
name text,
email varchar(100) unique,
age int check(age<18)
);

insert into students(id,name,email,age)
values(null,'sam','abc@gmail.com',15);

select * from students;

create table student(
id int,
name text,
email varchar(100),
age int
);

Alter table student modify column id int NOT null;
Alter table student modify column email varchar(100) unique; 
Alter table student modify column age int check(age<18);

create table Orders (order_id int primary key, order_item text, order_date date);
create table customer(customer_name text, order_id int, cust_address varchar(100),
foreign key(order_id) references Orders(order_id));
insert into orders(order_id,order_item,order_date) values(1,'biryani','2022-09-01');
insert into orders(order_id,order_item,order_date) values(2,'biryani','2022-09-02');
insert into customer(customer_name,order_id,cust_address) values ('sam',1, '123 abc street');
insert into customer(customer_name,order_id,cust_address) values ('saas',null, '123 abc street');
select * from customer;
select * from orders;

create table Order_details (order_id int, order_item text, order_date date);
create table customer_details(customer_name text, order_id int, cust_address varchar(100));

Alter table Order_details modify column order_id int primary key;
ALTER TABLE customer_details 
ADD CONSTRAINT fk_order_id 
FOREIGN KEY (order_id) REFERENCES order_details(order_id);

insert into order_details(order_id,order_item,order_date) values(1,'biryani','2022-09-01');
insert into customer_details(customer_name,order_id,cust_address) values ('sam',1, '123 abc street');

select * from order_details;
select * from customer_details;






