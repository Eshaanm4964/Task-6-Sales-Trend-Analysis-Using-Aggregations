
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(50)
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 499.99, 'B07JW9H4J1'),
(2, '2023-01-20', 799.00, 'B098NS6PVG'),
(3, '2023-02-05', 1349.50, 'B096MSW6CT'),
(4, '2023-02-12', 249.99, 'B08HDJ86NZ'),
(5, '2023-03-08', 1129.00, 'B08CF3B7N1'),
(6, '2023-03-19', 675.45, 'B09T2Y9YMG'),
(7, '2023-04-10', 999.99, 'B08XMWB75J'),
(8, '2023-05-03', 1599.25, 'B0BS1GN4YX'),
(9, '2023-06-14', 899.00, 'B085DPRM2J'),
(10, '2023-06-25', 1230.75, 'B07XKXXLTS');

SELECT 
    order_id, 
    order_date, 
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    orders;

SELECT 
    order_id, 
    order_date, 
    EXTRACT(YEAR FROM order_date) AS order_year
FROM 
    orders;

SELECT 
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    orders;

SELECT 
    SUM(amount) AS total_revenue
FROM 
    orders;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume,
    SUM(amount) AS monthly_revenue
FROM 
    orders
GROUP BY 
    year, month;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume,
    SUM(amount) AS monthly_revenue
FROM 
    orders
GROUP BY 
    year, month
ORDER BY 
    year, month;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume,
    SUM(amount) AS monthly_revenue
FROM 
    orders
WHERE 
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    year, month
ORDER BY 
    year, month;
