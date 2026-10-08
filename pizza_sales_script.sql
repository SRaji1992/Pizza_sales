-- Total revenue
select cast(sum(total_price) as decimal(10,2)) as Total_revenue from pizza_sales;
-- Average order value
select cast(sum(total_price)/count(distinct order_id) as decimal(10,2)) as Avg_order_value
from pizza_sales;
-- Total pizzas sold
select sum(quantity)as Total_pizzas_sold
from pizza_sales;
-- Total orders
select count(distinct order_id) as total_orders from pizza_sales;
-- Average pizzas per order
select cast(sum(quantity)/count(distinct(order_id)) as decimal(10,1)) as avg_pizzas_per_order
from pizza_sales;
-- daily trends
select dayname(str_to_date(order_date,'%d-%m-%y')) as order_day,count(distinct order_id) as Total_orders
from pizza_sales 
group by order_day;
-- Monthly trends
select monthname(str_to_date(order_date,'%d-%m-%y')) as order_month,count(distinct order_id) as Total_orders
from pizza_sales
group by order_month;
-- Percentage of sales by pizza category
select pizza_category,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as percentage_of_sales_by_pizzacategory
from pizza_sales
group by pizza_category;
-- top 5 pizzas by revenue
select pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;
-- bottom 5 pizzas by revenue
select pizza_name,cast(sum(total_price)  as decimal(10,2))as total_revenue from pizza_sales
group by pizza_name
order by total_revenue
limit 5;
-- top 5 pizzas by orders
select pizza_name,count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;
-- bottom 5 pizzas by orders
select pizza_name,count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders
limit 5;
-- top 5 pizzas by quantity sold
select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;
-- bottom 5 pizzas by quantity
select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity 
limit 5;