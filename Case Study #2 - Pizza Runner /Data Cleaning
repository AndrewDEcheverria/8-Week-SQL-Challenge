-- Data Cleaning
CREATE table customer_orders_temp LIKE customer_orders;

INSERT customer_orders_temp
SELECT * 
FROM customer_orders; -- Makes copy of table to keep orginal data

	SELECT order_id, customer_id, pizza_id,
    CASE
		WHEN exclusions IS NULL OR exclusions = 'null' THEN ' '
        ELSE exclusions													
        END AS exclusions,
	CASE
		WHEN extras IS NULL OR extras = 'null' THEN ' '
        ELSE extras
        END as extras,
        order_time
	FROM pizza_runner.customer_orders_temp;
    
UPDATE pizza_runner.customer_orders_temp
SET
	exclusions = CASE
		WHEN exclusions IS NULL OR exclusions = 'null' THEN ' '
        ELSE exclusions															
        END,
	extras = CASE
		WHEN extras IS NULL OR extras = 'null' THEN ' '
        ELSE extras
        END;
        
SELECT * FROM customer_orders_temp;
SELECT * FROM customer_orders;


CREATE TABLE runner_orders_temp like runner_orders;

INSERT runner_orders_temp
SELECT * 
FROM runner_orders;


SELECT order_id, runner_id,
CASE
	WHEN pickup_time = 'null' OR pickup_time IS NULL THEN ' '
	ELSE pickup_time
	END AS pickup_time,
CASE
	WHEN distance = 'null' OR distance IS NULL THEN ' '
    WHEN distance LIKE '%km' THEN TRIM('km' from distance)
    ELSE distance
    END AS distance,
CASE
	WHEN duration = 'null' OR duration IS NULL THEN ' '
    WHEN duration LIKE '%mins' THEN TRIM('mins' from duration)
    WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)
    WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)
    ELSE duration
    END AS duration,
CASE
	WHEN cancellation = 'null' OR cancellation IS NULL THEN ' '
    ELSE cancellation
    END AS cancellation
FROM pizza_runner.runner_orders_temp;

UPDATE pizza_runner.runner_orders_temp
	SET
  pickup_time = 
  CASE
	WHEN pickup_time = 'null' OR pickup_time IS NULL THEN ' '
	ELSE pickup_time
	END,
distance = 
CASE
	WHEN distance = 'null' OR distance IS NULL THEN ' '
    WHEN distance LIKE '%km' THEN TRIM('km' from distance)
    ELSE distance
    END,
duration = 
	CASE
	WHEN duration = 'null' OR duration IS NULL THEN ' '
    WHEN duration LIKE '%mins' THEN TRIM('mins' from duration)
    WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)
    WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)
    ELSE duration
    END,
cancellation = 
CASE
	WHEN cancellation = 'null' OR cancellation IS NULL THEN ' '
    ELSE cancellation
    END;
    
SELECT * FROM runner_orders_temp; -- cleaned data
SELECT * FROM runner_orders; -- original data
