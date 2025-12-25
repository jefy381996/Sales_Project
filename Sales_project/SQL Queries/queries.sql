/*
--Higest selling category all time
SELECT p.category,
       SUM(s.quantity) AS total_sold
FROM sales_cleaned_4 s
JOIN products_cleaned_2 p
  ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sold DESC;
*/
/*
--Highest selling product in grocery category in last 3 months
SELECT p.product_name,
       SUM(s.quantity) AS total_sold
FROM sales_cleaned_4 s
JOIN products_cleaned_2 p
  ON s.product_id = p.product_id
WHERE p.category = 'Grocery'
GROUP BY p.product_name
ORDER BY total_sold DESC;
*/
/*
--Highest selling prduct in personal care category in last 3 months
SELECT p.product_name, sum(s.quantity) as total_sales
from sales_cleaned_4 s
JOIN products_cleaned_2 p ON s.product_id = p.product_id
WHERE p.category = 'Personal Care'
Group BY p.product_name
ORDER BY total_sales DESC;
*/
/*
--Highest selling Produts in Beverages category
SELECT p.product_name, sum(s.quantity) as total_sales
from sales_cleaned_4 s
JOIN products_cleaned_2 p ON s.product_id = p.product_id
WHERE p.category = 'Beverages'
Group BY p.product_name
ORDER BY total_sales DESC;
*/

/*
--Highest selling products in Household category
SELECT p.product_name, sum(s.quantity) as total_sales
from sales_cleaned_4 s
JOIN products_cleaned_2 p ON s.product_id = p.product_id
WHERE p.category = 'Household'
GROUP BY p.product_name
ORDER BY total_sales DESC;

*/

/*
--Compare total revenue in all months
select product_name, Round(sum(price * quantity)::numeric,0) as total_revenue, extract(month from date) as month
from sales_cleaned_4
group by product_name, month
order by month, total_revenue desc;

*/

/*
--Compare total profit in all months per product
select p.product_name, 
Round(sum((s.price - p.cost_price) * s.quantity)::numeric,0) as total_profit, 
extract(month from s.date) as month
from sales_cleaned_4 s
JOIN products_cleaned_2 p ON s.product_id = p.product_id
group by p.product_name, month
order by month, total_profit desc;

*/

/*
---Top 10 highest selling products in month 8
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 8
GROUP BY product_name, month
ORDER BY total_sold DESC
LIMIT 10;
*/

/*
---Top 10 highest selling products in month 9
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 9
GROUP BY product_name, month
ORDER BY total_sold DESC
LIMIT 10;


*/

/*
---Top 10 highest selling products in month 10
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 10
GROUP BY product_name, month
ORDER BY total_sold DESC
LIMIT 10;


*/

/*
---Top 10 lowest selling products in month 8
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 8
GROUP BY product_name, month
ORDER BY total_sold ASC
LIMIT 10;


*/


/*
---Top 10 lowest selling products in month 9
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 9
GROUP BY product_name, month
ORDER BY total_sold ASC
LIMIT 10;


*/

/*
---Top 10 lowest selling products in month 10
select product_name, sum(quantity) as total_sold, extract(month from date) as month
from sales_cleaned_4 s
WHERE extract(month from date) = 10
GROUP BY product_name, month
ORDER BY total_sold ASC
LIMIT 10;



*/


/*
--- weekend vs weekday sales comparison
SELECT
    CASE
        WHEN EXTRACT(DOW FROM date) IN (0, 6)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    Round(SUM(price * quantity)::numeric,0) AS total_sales
FROM sales_cleaned_4
GROUP BY day_type;

*/

/*
--- Is retail_price a factor for lowest selling products?
SELECT s.product_name, sum(s.quantity) as total_sold, p.cost_price, p.retail_price, Round((p.retail_price - p.cost_price)::numeric,0) as profit_margin
from sales_cleaned_4 s
JOIN products_cleaned_2 p ON s.product_id = p.product_id
GROUP BY s.product_name, p.cost_price, p.retail_price
order by total_sold ASC;

*/


