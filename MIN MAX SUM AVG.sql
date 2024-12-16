-- Aggregrate functions: COUNT, SUM, AVG, MIN, MAX
SELECT MIN(amount) FROM payment;

SELECT MAX(amount) FROM payment;

SELECT SUM(amount) FROM payment;

SELECT AVG(amount) FROM payment;

SELECT * FROM film;

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost) FROM film;

-- Can use with ROUND() to specify precision
SELECT ROUND(AVG(replacement_cost), 2) FROM film;

SELECT SUM(replacement_cost) FROM film;