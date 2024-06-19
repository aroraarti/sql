/*Name the top 3 aisles with the most products ordered */
SELECT a.aisle_id, a.aisle, COUNT(*) AS total_orders 
FROM order_products op 
JOIN products p ON op.product_id = p.product_id 
JOIN aisles a ON p.aisle_id = a.aisle_id 
GROUP BY a.aisle_id, a.aisle 
ORDER BY total_orders DESC 
LIMIT 3;
/*What is the mean and the variance of number of products in an aisle? */

WITH product_counts AS ( 
    SELECT aisle_id, COUNT(*) AS product_count 
    FROM products 
    GROUP BY aisle_id 
) 
SELECT  
    AVG(product_count) AS mean_product_count, 
    AVG((product_count - (SELECT AVG(product_count) FROM product_counts)) *          (product_count - (SELECT AVG(product_count) FROM product_counts))) AS variance_product_count 
FROM product_counts; 
