-- BETWEEN - end points are inclusive
-- can use with dates in YYYY-MM-DD format (ISO 8601 format)
SELECT * FROM customer
WHERE customer_id BETWEEN 10 AND 50;

SELECT * FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 and 9;

-- with datetime it only goes up to 0:00 hour mark, so need to go to the 15th to include 14th
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- IN checks for multiple value options
SELECT * FROM customer
WHERE first_name IN ('Dawn', 'David', 'Dorothy');

SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT(amount) FROM payment
ORDER BY amount ASC;

SELECT * FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

-- LIKE (case sensitive) and ILIKE (not case sensitive) (pattern matching)
-- % matches any number of chars
-- _ matches one char
-- can use regex
SELECT * FROM customer
WHERE first_name LIKE '_her%';

SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name ILIKE 's%';

SELECT * FROM customer
WHERE first_name LIKE '%er%';

SELECT * FROM customer
WHERE first_name NOT LIKE '%er%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' and last_name NOT LIKE 'B%'
ORDER BY last_name;

