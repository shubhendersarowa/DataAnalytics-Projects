select top 2 * from pizza_sales ;
--1. Total Revenue: 
select round(sum(total_price),2) as total_revenue from pizza_sales;

--2. Average Order Value 
select round(sum(total_price)/count(distinct(order_id)),2) as avg_order_value from pizza_sales;

--3. Total Pizzas Sold
select sum(quantity) as total_pizza_sold  from pizza_sales;

--4. Total Orders
select count(distinct(order_id)) as total_orders from pizza_sales;

--5. Average Pizzas Per Order
select round(sum(quantity)/count(distinct(order_id)),2) as avg_pizza_per_order 
from pizza_sales;

--B. Daily Trend for Total Orders
select DATENAME(DW,order_date) as day_name ,
count(distinct(order_id))as orders 
from pizza_sales
group by DATENAME(DW,order_date) ;

--C. Hourly Trend for Orders
select DATEPART(hour,order_time) as hours_ ,
count(distinct(order_id))as orders 
from pizza_sales 
group by DATEPART(hour,order_time)
order by count(distinct(order_id)) desc ;

--D. % of Sales by Pizza Category
select pizza_category , 
cast(sum(total_price)as decimal (10,2)) as total_sale,
cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as prcnt 
from pizza_sales 
group by pizza_category
order by cast(sum(total_price)as decimal (10,2)) desc  ;

--E. % of Sales by Pizza Size
select pizza_size ,
cast(sum(total_price)as decimal (10,2)) as total_sale,
cast(sum(total_price) / (select sum(total_price) from pizza_sales)*100 as decimal (10,2)) as prcnt 
from pizza_sales 
group by pizza_size
order by cast(sum(total_price)as decimal (10,2)) desc  ;

--F. Total Pizzas Sold by Pizza Category
select pizza_category, 
sum(quantity) as sum_of_pizzas 
from pizza_sales 
group by pizza_category 
order by sum(quantity) desc ;

--G. Top 5 Best Sellers by Total Pizzas Sold
select top 5  pizza_name ,
sum(quantity) as Total_sale 
from pizza_sales 
group by pizza_name 
order by sum(quantity) desc ;

--H. Bottom 5 Best Sellers by Total Pizzas Sold
select top 5  pizza_name ,
sum(quantity) as Total_sale 
from pizza_sales 
group by pizza_name 
order by sum(quantity) asc ;


