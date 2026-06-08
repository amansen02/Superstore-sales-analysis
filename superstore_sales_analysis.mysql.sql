
-- use superstore_project;

-- Sales & Profit Analysis

-- Q1. What is the total sales and profit by region?

select 
     locations.region, 
     (sum(orders.sales)) as total_sales,
      (sum(orders.profit)) as total_profit 
from orders
inner join locations 
on orders.postal_code = locations.postal_code
  group by region
order by sum(orders.sales) desc;

-- Q2. Which customer segment generates the highest profit?

select 
      customers.segment, 
      sum(orders.profit) as total_profit from customers
inner join orders
on customers.customer_id = orders.customer_id
 group by customers.segment
order by total_profit desc;


-- Q3. What is the total sales and profit by product category?

select 
     p.category, 
     sum(o.sales) as total_sales,
     sum(o.profit) as total_profit
from products p
  inner join orders o
on p.product_id = o.product_id
  group by p.category
order by total_sales desc;

-- Q4. Which are the top 10 products by total sales?

select 
     p.product_name,
     sum(o.sales) as total_sales
from products p
inner join orders o 
on p.product_id = o.product_id
   group by p.product_name
order by total_sales desc 
limit 10;
-- Q5. Which products are running at a loss? (negative profit)

select 
       p.product_name, 
        sum(o.profit) as total_profit 
from products p
inner join orders o
on p.product_id = o.product_id
   group by p.product_name
having  total_profit < 0
order by total_profit asc;

-- Time Based Analysis

-- Q6. What is the monthly sales trend over 4 years?

select 
     month(order_date) as month_sales,
	year(order_date) as year_sales,
    sum(sales) as total_sales
from orders
group by month_sales, year_sales
order by  year_sales, month_sales;

-- Q7. Which year had the highest total sales and profit?

select 
    year(order_date) as year,
    sum(sales) as total_sales,
    sum(profit) as total_profit
from orders
group by year
order by total_sales desc, total_profit desc;

-- Q8. What is the average shipping days by ship mode?

select 
     ship_mode,
     avg(datediff(ship_date,order_date)) as avg_shipping_days 
from orders
group by ship_mode
order by avg_shipping_days desc;


-- Customer Analysis

-- Q9. Who are the top 10 customers by total purchase amount?

select 
      c.customer_name, 
      sum(o.sales) as total_sales from customers c
inner join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
order by total_sales desc
limit 10;

-- Q10. How many orders did each customer segment place per year?

select 
      c.segment , 
      year(order_date) as year,
      count(order_id) as total_orders
from customers c 
inner join orders o
on c.customer_id = o.customer_id
group by c.segment, year
order by c.segment, year asc;

-- 🟢 Advanced Level
-- Discount & Profit Relationship

-- Q11. Does higher discount lead to lower profit? Compare avg profit at different discount levels

select 
case when o.discount = 0 then ' NO DISCOUNT'
     when o.discount <= 0.20 then 'LOW DISCOUNT'
	 when o.discount <+ 0.50 then 'MEDIUM DISCOUNT'
     else ' HIGH DISCOUNT'
     end as discount_category,
     count(o.order_id) as total_orders,
     avg(o.profit) as avg_profit
from orders o 
group by discount_category
order by avg_profit desc;

-- Q12. Which sub-categories have high sales but negative profit?

select sub_category, 
       sum(o.sales) as total_sales,
       sum(o.profit) as total_profit
from products
inner join orders o 
on products.product_id = o.product_id
group by sub_category
having total_profit < 0 
order by total_sales desc;
 

-- Window Functions & CTE

-- Q13. Rank top 5 customers by sales within each segment

with customer_sales as (
     select 
     c.customer_name, 
     c.segment,
     sum(o.sales) as total_sales 
from customers c
inner join orders o 
 on c.customer_id = o.customer_id
group by c.customer_name, c.segment
),
ranked as (
          select *, 
          rank() over (
                       partition by segment
                       order by total_sales desc 
					 ) as rnk from customer_sales
)
select * from ranked 
where rnk <= 5 
order by segment, rnk;

-- Q14. What is the running total of sales month by month?

with monthly_sales as (
     select
       year(order_date) as year, 
       month(order_date) as month, 
       sum(sales) as total_sales 
from orders 
group by year, month 
) 
select 
     year,
     month,
     total_sales,
     sum(total_sales) over 
     ( order by
               year,month) as runing_total 
from monthly_sales
order by year, month;

-- Q15. Year over Year sales growth percentage by category

WITH category_yearly AS (
    SELECT 
        p.category,
        YEAR(o.order_date) AS year,
        SUM(o.sales) AS total_sales
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY p.category, YEAR(o.order_date)
)
SELECT 
    c1.category,
    c1.year,
    c1.total_sales,
    c2.total_sales AS prev_year_sales,
    ROUND(
        (c1.total_sales - c2.total_sales) 
        / c2.total_sales * 100, 2
    ) AS growth_percentage
FROM category_yearly c1
LEFT JOIN category_yearly c2
    ON c1.category = c2.category
    AND c1.year = c2.year + 1
ORDER BY c1.category, c1.year;
