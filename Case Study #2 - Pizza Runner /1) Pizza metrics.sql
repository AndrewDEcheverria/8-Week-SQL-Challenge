-- Pizza Metrics
/* 
How many pizzas were ordered?
How many unique customer orders were made?
How many successful orders were delivered by each runner?
How many of each type of pizza was delivered?
How many Vegetarian and Meatlovers were ordered by each customer?
What was the maximum number of pizzas delivered in a single order?
For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
How many pizzas were delivered that had both exclusions and extras?
What was the total volume of pizzas ordered for each hour of the day?
What was the volume of orders for each day of the week? 
*/
-- How many pizzas were ordered?
SELECT DISTINCT COUNT(*) AS total_orders
FROM customer_orders;

-- How many unique customer orders were made?
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM customer_orders;

-- How many successful orders were delivered by each runner?
SELECT runner_id, COUNT(order_id) AS successful_orders
FROM runner_orders_temp
WHERE duration != ' '
GROUP BY runner_id;

-- How many of each type of pizza was delivered?

SELECT pizza_name, COUNT(c.pizza_id) AS delivered_pizza
FROM customer_orders_temp AS c
JOIN pizza_names AS p
	ON c.pizza_id = p.pizza_id
JOIN runner_orders_temp AS r
	ON c.order_id = r.order_id
WHERE r.duration !=' ' 
GROUP BY p.pizza_name;

-- How many Vegetarian and Meatlovers were ordered by each customer?

SELECT c.customer_id, p.pizza_name, COUNT(p.pizza_name) AS order_by_customer
FROM customer_orders_temp AS c
JOIN pizza_names AS p
	ON c.pizza_id = p.pizza_id
GROUP BY c.customer_id, p.pizza_name;

-- What was the maximum number of pizzas delivered in a single order?
-- order_id, count(pizza_id)

SELECT c.order_id, COUNT(pizza_id) AS max_pizzas
FROM customer_orders_temp AS c
JOIN  runner_orders_temp AS r
	ON c.order_id = r.order_id
    WHERE duration != ' '
GROUP BY c.order_id;

-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
-- How many FROM each CUSTOMER DELIVERED pizza had EXLUSIONS OR EXTRAS AND how many didnt 3 columns returned customerid, changed and No change 

SELECT customer_id, exclusions, extras
FROM customer_orders_temp;

SELECT * FROM runner_orders_temp;
SELECT * FROM runner_orders; 
