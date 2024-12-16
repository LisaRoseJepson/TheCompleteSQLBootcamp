-- Customers who have spent at least $110 with staff_id 2
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

-- How many films begin with the letter J?
SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';

-- Which customer has the highest ID number and name starts with 'E' with an address ID < 500
SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
