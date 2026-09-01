CREATE DATABASE myDB;
USE myDB;
SHOW TABLES;
SELECT * FROM mydb.olist_customers_dataset;

SELECT * FROM mydb.olist_customers_dataset
LIMIT 10;

DESCRIBE mydb.olist_customers_dataset;

SELECT COUNT(*) AS total_records
FROM mydb.olist_customers_dataset;

SELECT customer_id,customer_unique_id
FROM mydb.olist_customers_dataset;

SELECT DISTINCT customer_city
FROM mydb.olist_customers_dataset;

SELECT *
FROM mydb.olist_customers_dataset
WHERE customer_city = 'franca';

SELECT *
FROM mydb.olist_customers_dataset
ORDER BY customer_city DESC;

SELECT customer_state, COUNT(*) AS total_customers
FROM mydb.olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;

SELECT customer_city, COUNT(*) AS total_customers
FROM mydb.olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC;

SELECT AVG(customer_zip_code_prefix) AS average_zip_code
FROM mydb.olist_customers_dataset;

SELECT SUM(customer_zip_code_prefix) AS total_zip_codes
FROM mydb.olist_customers_dataset;

SELECT AVG(customer_zip_code_prefix) AS average_zip_code
FROM mydb.olist_customers_dataset;

SELECT SUM(customer_zip_code_prefix) AS sum_zip_codes
FROM mydb.olist_customers_dataset;

SELECT 
    customer_state,
    COUNT(*) AS total_customers
FROM mydb.olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;

SELECT 
    customer_state,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ecommerce_data),
        2
    ) AS customer_percentage
FROM mydb.olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;

CREATE TABLE customer_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(50)
);

INSERT INTO customer_orders
(customer_id, order_amount, order_status)
VALUES
('1', 2500.00, 'Delivered'),
('2', 1800.00, 'Delivered'),
('3', 950.00, 'Cancelled'),
('4', 3200.00, 'Delivered'),
('5', 750.00, 'Pending');

SELECT * FROM customer_orders;

SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_amount,
    o.order_status
FROM mydb.olist_customers_dataset c
INNER JOIN customer_orders o
    ON c.customer_id = o.customer_id;

SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_amount
FROM mydb.olist_customers_dataset c
LEFT JOIN customer_orders o
    ON c.customer_id = o.customer_id;
    
SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_amount
FROM mydb.olist_customers_dataset  c
RIGHT JOIN customer_orders o
    ON c.customer_id = o.customer_id;
    
CREATE VIEW customer_state_analysis AS
SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM mydb.olist_customers_dataset
GROUP BY customer_state;

SELECT *
FROM customer_state_analysis
ORDER BY total_customers DESC;


CREATE INDEX idx_customer_state
ON mydb.olist_customers_dataset(customer_state);

SHOW INDEX FROM mydb.olist_customers_dataset;


