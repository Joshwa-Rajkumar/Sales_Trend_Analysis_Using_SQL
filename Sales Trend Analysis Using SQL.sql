use sample;

-- 1. Shows all details:
select * from sales;


-- 2. Total sales
select sum(total_price) as `Revenue Made` from sales;


-- 3. Top 10 Customers
select customer as `Top 10 Customers`, sum(total_price) as `Total Spent` from sales
group by customer
order by `Total Spent` desc
limit 10;

-- 4. Percentage the Top 10 customers made
select customer as `Top 10 Customers`, sum(total_price) as `Total Sales`,
	round( sum(total_price)*100 / (select sum(total_price) from sales), 2) as `Percentage of total`
from sales
group by customer
order by `Percentage of total` desc
limit 10;

-- 5. Product-wise sales
select product, sum(total_price) as `Sales` from sales
group by product;


-- 6. Percentage of the products sold
select product, sum(total_price) as `Sales`,
	round(sum(total_price)*100 / (select sum(total_price) from sales), 2) as `Percentage of total` 
from sales
group by product
order by `Percentage of total` desc;

-- 7. Date-wise sales
select sale_date, sum(total_price) as `Total Sales`
from sales
group by sale_date
order by sale_date;

-- 8. Month-wise sales
select 
	date_format(sale_date, '%Y-%m') as month,
	sum(total_price) as `Total Sales`
from sales
group by month
order by month;

-- 9. Analyse by Day
select 
  dayname(sale_date) as weekday,
  sum(total_price) as total_sales,
  dayofweek(sale_date) as weekday_num
from sales
group by weekday, weekday_num
order by weekday_num;
    
-- 10. Analyse by Month
select extract(month from sale_date) as `Month`, sum(total_price) as `Total Sales` from sales
group by `Month`
order by `Month`;




