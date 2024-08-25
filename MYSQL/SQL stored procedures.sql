show tables;

drop table sales;
create table sales(
id SERIAL PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  price NUMERIC,
  quantity INTEGER,
  sale_date DATE
);

INSERT INTO sales (product_name, category, price, quantity, sale_date)
VALUES
  ('iPad', 'Electronics', 799, 3, '2022-01-01'),
  ('MacBook', 'Electronics', 1299, 2, '2022-01-02'),
  ('iPhone', 'Electronics', 699, 5, '2022-01-03'),
  ('Samsung TV', 'Electronics', 999, 1, '2022-01-04'),
  ('Nike Shoes', 'Apparel', 99, 10, '2022-01-05');
  
select * from sales;


DELIMITER $$

CREATE FUNCTION quantity_total(category_name VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_quantity INT;
    SELECT SUM(quantity) INTO total_quantity 
    FROM sales 
    WHERE category = category_name;
    RETURN total_quantity;
END $$

DELIMITER ;

select quantity_total('electronics') as quat from sales;
