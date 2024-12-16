-- HAVING - allows filtering after a GROUP BY
-- can use aggregrate result as a filter
SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT * FROM customer;

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id;

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- Which customers have 40+ transactions?
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

-- Which customers have spent > $100 with staff_id 2?
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;