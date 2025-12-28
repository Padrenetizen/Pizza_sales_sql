USE sales;

CREATE TABLE pizza_lagging
LIKE pizza_sales;

INSERT INTO pizza_lagging
SELECT *
FROM pizza_sales;

SELECT *
FROM pizza_lagging;

-- checking for nulls and blanks
SELECT *
FROM pizza_lagging
WHERE pizza_id IS NULL OR pizza_id = '';

SELECT *
FROM pizza_lagging
WHERE order_id IS NULL OR order_id = '';

SELECT *
FROM pizza_lagging
WHERE pizza_name_id IS NULL OR pizza_name_id = '';

SELECT *
FROM pizza_lagging
WHERE quantity IS NULL OR quantity = '';

SELECT *
FROM pizza_lagging
WHERE order_date IS NULL OR order_date = '';

SELECT *
FROM pizza_lagging
WHERE order_time IS NULL OR order_time = '';

SELECT *
FROM pizza_lagging
WHERE order_date IS NULL OR order_date = '';

SELECT *
FROM pizza_lagging
WHERE unit_price IS NULL OR unit_price = '';

SELECT *
FROM pizza_lagging
WHERE total_price IS NULL OR total_price = '';

SELECT *
FROM pizza_lagging
WHERE pizza_size IS NULL OR pizza_size = '';

SELECT *
FROM pizza_lagging
WHERE pizza_category IS NULL OR pizza_category = '';

SELECT *
FROM pizza_lagging
WHERE pizza_ingredients IS NULL OR pizza_ingredients = '';

SELECT *
FROM pizza_lagging
WHERE pizza_name IS NULL OR pizza_name = '';

-- checking for duplicates
SELECT *,
ROW_NUMBER() OVER(PARTITION BY pizza_id, 
order_id, pizza_name_id, quantity, total_price, pizza_ingredients, pizza_name) AS row_num
FROM pizza_lagging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY pizza_id, 
order_id, pizza_name_id, quantity, total_price, pizza_ingredients, pizza_name) AS row_num
FROM pizza_lagging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM pizza_lagging;

-- formatting the order_date format
SELECT STR_TO_DATE(order_date, '%d/%m/%Y') AS converted_date
FROM pizza_lagging;
UPDATE pizza_lagging
SET order_date = STR_TO_DATE(order_date, '%d/%m/%Y');

-- formatting the order_time column
SELECT STR_TO_DATE(order_time, '%H:%i:%s') AS converted_date
FROM pizza_lagging;

SELECT DATE_FORMAT(STR_TO_DATE(order_time, '%H:%i:%s'), '%h:%i:%s %p') AS converted_date
FROM pizza_lagging;

UPDATE pizza_lagging
SET order_time = DATE_FORMAT(STR_TO_DATE(order_time, '%H:%i:%s'), '%h:%i:%s %p');

-- formatting pizza name id
SELECT pizza_name_id, CONCAT(UPPER(LEFT(pizza_name_id, 1)), 
LOWER(SUBSTRING(pizza_name_id, 2))) AS pizza_name_id2
FROM pizza_lagging;

UPDATE pizza_lagging
SET pizza_name_id = CONCAT(UPPER(LEFT(pizza_name_id, 1)), 
LOWER(SUBSTRING(pizza_name_id, 2)));

SELECT *
FROM pizza_lagging;

-- formatting pizza size column
UPDATE pizza_lagging
SET pizza_size = 'Small'
WHERE pizza_size = 'S';

UPDATE pizza_lagging
SET pizza_size = 'Medium'
WHERE pizza_size = 'Middle';

UPDATE pizza_lagging
SET pizza_size = 'Large'
WHERE pizza_size = 'L';

SELECT *
FROM pizza_lagging
WHERE pizza_size = 'XL';

UPDATE pizza_lagging
SET pizza_size = 'Extra Large'
WHERE pizza_size = 'XL';

SELECT *
FROM pizza_lagging;

ALTER TABLE pizza_lagging
MODIFY unit_price DECIMAL(10,2);

ALTER TABLE pizza_lagging
MODIFY total_price DECIMAL(10,2);