-- data penjualan pizza tahun 2015


-- -- sales quantity by pizza size
-- select pizza_size, sum(quantity) as total_purchase
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 2 desc

-- -- total sales quantity per day
-- select order_date, sum(quantity) as total_sales_perday
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 1 asc

-- -- sales performance
-- -- total revenue (1)
-- select round(sum(total_price),2) as revenue
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`

-- -- average order by value (2)
-- select count(distinct order_id) as total_order, round(sum(total_price),2) as total_sales_perorder, round(sum(total_price)/count(distinct order_id),2) as average_order_byvalue
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`

-- -- total pizza sold (3)
-- select sum(quantity) as total_pizza_sold, cast(sum(quantity)/365 as INT) as pizza_sold_perday
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`

-- -- total orders (4)
-- select count(distinct order_id) as total_orders
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`

-- -- average pizza per order (5)
-- select count(distinct order_id) as total_order, sum(quantity) as total_pizza_sold, round(sum(quantity)/count(distinct order_id),2) as average_pizza_peroder
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`


-- VISUALIZATION

-- -- daily trend for total order (what day with the most order)
-- SELECT
--   FORMAT_DATE('%A', order_date) AS month_name, count(distinct order_id) as total_order
-- FROM
--   `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by month_name


-- -- monthly trend for total order (what month generate most order)
-- SELECT
--   FORMAT_DATE('%B', order_date) AS month_name, count(distinct order_id) as total_order
-- FROM
--   `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by month_name

-- -- percentage of sales by pizza category
-- select pizza_category, round((sum(total_price)/(select sum(total_price) from`coursera-cleaningdata-week3.pizza.pizza_sales`)) * 100,2) as sales_contribution
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 2 desc


-- -- percentage of sales by pizza size
-- select pizza_size, (sum(total_price)/(select sum(total_price) from`coursera-cleaningdata-week3.pizza.pizza_sales`)) * 100 as sales_contribution
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 2

-- -- nama pizza yang menyumbang pemasukan terbanyak (top 5)
-- select pizza_name, round(sum(total_price),2) as revenue
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 2 desc
-- limit 5

-- -- nama pizza yang paling tidak laku top 5
-- select pizza_name, sum(quantity) as total_pizza_sold
-- from `coursera-cleaningdata-week3.pizza.pizza_sales`
-- group by 1
-- order by 2 asc
-- limit 5

-- bahan yang paling sering digunakan
select
  bahan as Ingredients, count(*) as Total_Ingredients
from `coursera-cleaningdata-week3.pizza.pizza_sales`, unnest(SPLIT(pizza_ingredients, ',')) as bahan
where pizza_ingredients is not null
group by bahan
order by Total_Ingredients desc

