-- GROUP BY - on categorical (or treat continuous as categorical e.g. prices)
-- GROUP BY must immediately follow FROM or WHERE
-- WHERE statement shouldn't make a reference to what's being aggregrated (can use HAVING)
SELECT * FROM customer;

SELECT COUNT(*) FROM customer
GROUP BY store_id;

SELECT * FROM payment;

-- Like a SELECT DISTINCT
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Which customer is spending the most?
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- highest number of transactions?
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

-- How much does each customer spend with each staff member?
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

-- GROUP BY on date - need to remove timestamp information using DATE
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

-- Which staff member handled the most payments? How many did each member make?
SELECT staff_id, COUNT(*) FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC;

-- What is the average replacement cost per rating?
SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film
GROUP BY rating;

-- Top 5 customers by total spend?
SELECT customer_id, SUM(amount) as total FROM payment
GROUP BY customer_id
ORDER BY total DESC
LIMIT 5; 