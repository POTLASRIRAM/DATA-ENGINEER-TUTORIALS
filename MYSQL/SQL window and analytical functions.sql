select * from sales_data;

select item,units_sold, rank() over(order by units_sold asc) as units_sold_rank from sales_data;

select item,units_sold, dense_rank() over(order by units_sold asc) as units_sold_dense_rank from sales_data;

select item,units_sold, row_number() over(order by units_sold asc) as units_sold_row_number from sales_data;

select item,units_sold, lag(units_sold) over(order by units_sold asc) as units_sold_lag from sales_data;

select item,units_sold, lead(units_sold) over(order by units_sold asc) as units_sold_lead from sales_data;