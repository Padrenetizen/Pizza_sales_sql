USE pizza_sales;

SELECT *
FROM pizza_lagging;

-- highest quantity ordered
SELECT *
FROM pizza_lagging
WHERE quantity > 1
ORDER BY quantity DESC;

-- lowest quantity of pizza ordered
SELECT *
FROM pizza_lagging
ORDER BY quantity ASC;

-- lowest in terms of price
SELECT *
FROM pizza_lagging
WHERE total_price < 100.0
ORDER BY total_price DESC;

-- total number of customers
SELECT count(DISTINCT order_id) AS total_customers
FROM pizza_lagging;

-- total number of orders
SELECT count(order_id) AS total_orders
FROM pizza_lagging;

-- most orderd by category
SELECT pizza_category,
count(*) AS most_ordered_category
FROM pizza_lagging
GROUP BY pizza_category
ORDER BY most_ordered_category DESC
LIMIT 1;

-- least ordered by category
SELECT pizza_category,
count(*) AS least_ordered_category
FROM pizza_lagging
GROUP BY pizza_category
ORDER BY pizza_category ASC
LIMIT 1;

-- most ordered by size
SELECT pizza_size,
count(*) AS most_ordered_size
FROM pizza_lagging
GROUP BY pizza_size
ORDER BY pizza_size DESC
LIMIT 1;

-- least ordered by size
SELECT pizza_size,
count(*) AS least_ordered_size
FROM pizza_lagging
GROUP BY pizza_size
ORDER BY pizza_size ASC
LIMIT 1;

-- most ordered by pizza name
SELECT pizza_name,
count(*) AS most_ordered
FROM pizza_lagging
GROUP BY pizza_name
ORDER BY pizza_name DESC
LIMIT 1;

-- least ordered by pizza name
SELECT pizza_name,
count(*) AS least_ordered
FROM pizza_lagging
GROUP BY pizza_name
ORDER BY pizza_name ASC
LIMIT 1;