SELECT amount AS rental_price
FROM payment;

SELECT SUM(amount) AS net_revenue
FROM payment;

SELECT COUNT(amount)
FROM payment;

SELECT COUNT(amount) as num_transactions
FROM payment;

-- AS operator gets executed at the end of the query - can't use in WHERE or HAVING clause
SELECT customer_id, SUM(amount) AS total_spend
FROM payment
GROUP BY customer_id
-- HAVING total_spend > 100
HAVING SUM(amount) > 100;
