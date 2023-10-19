select * from pizza_sales
--1 total revenue: the sum of price for all pizza
select sum(total_price) as total_revenue from pizza_sales
--total revenue for price of pizza is $817860.05083847

---2 average pizza order value
select sum(total_price) / count(distinct order_id) as average_order_value from pizza_sales
--$38.3072623343546 is the average order value

--3 total pizza sold 
select sum(quantity) as total_pizza_sold from pizza_sales
---total pizza sold by quantity is 49574

--4 Total orders: what is total number of orders
select count(distinct order_id) as total_order from pizza_sales
--21350 is the total_pizza order

--5 Average pizzas per order
select cast(sum(quantity) as decimal (10,2)) / count(distinct order_id) as average_pizza_order from pizza_sales
--average pizza per order is 2.32

---6 check daily trend for orders
select DATENAME (DW, order_date) as order_day, count(distinct order_id) as total_oders
from pizza_sales
group by DATENAME(DW, order_date)
--daily trend is saturday 3158, wednesday 3024, monday 2794, sunday 2624, friday 3538, thursday 3239, tuesday 2973

---7 monthly trend for total_orders
select DATENAME (month, order_date) as month_name, count(distinct order_id) 
from pizza_sales
group by DATENAME(month, order_date)
order by Total_Orders desc
--monthly trend for total oders is February	1685
--June	1773
--August	1841
--April	1799
--May	1853
--December	1680
--January	1845
--September	1661
--October	1646
--July	1935
--November	1792
--March	1840

--8 percentage by pizza category
select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as percetage
from pizza_sales
group by pizza_category
--percentage of pizza by caegory is
--Classic 26.9059602306976
--Chicken	23.9551375322885
--Veggie	23.6825910258677
--Supreme	25.4563112111462

--9 percentage of sales by pizza size
select pizza_size,cast(sum(total_price) as decimal (10,2)) as total_sales, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2))as percetage
from pizza_sales
group by pizza_size
order by percetage DESC
----percentage of sale by size is pizza_size	total_sales	percetage
--L	375318.70	    45.89
--M	249382.25	    30.49
--S	178076.50	    21.77
--XL	14076.00	1.72
--XXL	1006.60 	0.12

--10 top 5 sales by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
--top 5 pizza seller is 
--The Thai Chicken Pizza	43434.25
--The Barbecue Chicken Pizza	42768
--The California Chicken Pizza	41409.5
--The Classic Deluxe Pizza	38180.5
--The Spicy Italian Pizza	34831.25

--11 bottom 5 pizza sales by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc
--bottom 5 pizza by revenue
--The Brie Carre Pizza	11588.4998130798
--The Green Garden Pizza	13955.75
--The Spinach Supreme Pizza	15277.75
--The Mediterranean Pizza	15360.5
--The Spinach Pesto Pizza	15596

--12 top 5 by quantity
select top 5 pizza_name, sum(quantity) as total_quatity from pizza_sales
group by pizza_name
order by total_quatity desc
-- top 5 seller by quantity 
--The Classic Deluxe Pizza	2453
--The Barbecue Chicken Pizza	2432
--The Hawaiian Pizza	2422
--The Pepperoni Pizza	2418
--The Thai Chicken Pizza	2371
--13 least seller by quantity 
select top 5 pizza_name, sum(quantity) as total_quatity from pizza_sales
group by pizza_name
order by total_quatity asc
--least seller is 
--The Brie Carre Pizza	490
--The Mediterranean Pizza	934
--The Calabrese Pizza	937
--The Spinach Supreme Pizza	950
--The Soppressata Pizza	961

