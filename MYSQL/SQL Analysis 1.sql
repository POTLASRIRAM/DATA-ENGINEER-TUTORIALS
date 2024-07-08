SELECT @@secure_file_priv;
show databases;
use mysql;
create table apple_products(product_name varchar(100),product_url varchar(100),brand char(100),sale_price int(100),	mrp int(100),discount_percentage int(100),number_of_ratings	int(100),number_of_reviews int(100),upc	varchar(100),star_rating numeric(10),ram int(100));
select * from apple_products;