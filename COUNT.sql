SELECT COUNT(first_name) FROM actor;

SELECT COUNT(*) FROM actor;

SELECT COUNT(DISTINCT(first_name)) FROM actor;

SELECT COUNT(*) FROM payment;

SELECT COUNT(amount) FROM payment;

-- how many unique amounts are there?
SELECT COUNT(DISTINCT(amount)) FROM payment;

-- what are the unique amounts?
SELECT DISTINCT(amount) FROM payment;