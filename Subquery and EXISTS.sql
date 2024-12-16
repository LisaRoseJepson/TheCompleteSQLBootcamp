-- two SELECT statements
SELECT * FROM payment;

-- subquery executes first
SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

SELECT AVG(amount) FROM payment;

SELECT * FROM film;

SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT AVG(rental_rate) FROM film;

-- If subquery returns multiple values, need to use IN
SELECT * FROM rental;

SELECT * FROM inventory;

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

-- EXISTS
-- Customers that have at least one payment > $11
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment AS p
WHERE p.customer_id = c.customer_id
AND amount > 11);

-- Customers that don't have at least one payment > $11
SELECT first_name, last_name
FROM customer AS c
WHERE NOT EXISTS
(SELECT * FROM payment AS p
WHERE p.customer_id = c.customer_id
AND amount > 11)