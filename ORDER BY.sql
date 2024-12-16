-- default is ASCending
SELECT * FROM payment
ORDER BY amount;

-- sort by DESCending
-- ORDER BY should come last (e.g. after a WHERE statement)
SELECT * FROM payment
ORDER BY amount DESC;

-- can select ASC/DESC for each field in table
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

-- reward first 10 paying customers
SELECT customer_id, payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- titles of 5 shortest films
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

-- all films with a run time of 50 minutes or less
SELECT COUNT(*) FROM film
WHERE length <= 50;