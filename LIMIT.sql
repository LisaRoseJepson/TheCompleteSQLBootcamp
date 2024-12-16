-- limit number of rows returned in a query (like head() in Python)
-- 10 most recent payments
SELECT * FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 10;


-- view top row
SELECT * FROM payment
LIMIT 1;