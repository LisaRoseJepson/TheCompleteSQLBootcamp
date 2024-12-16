-- INNER JOIN - only records where key (match) is in both tables
-- middle bit of a Venn diagram
-- Table order doesn't matter for INNER JOIN
-- default JOIN in PostGres is INNER JOIN

-- won't see customers that have never generated a payment
SELECT payment_id, payment.customer_id, first_name FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

-- OUTER JOIN - FULL, LEFT, and RIGHT OUTER JOIN
-- FULL (simplest) - entire Venn diagram (all records from both tables)
-- will fill missing data with nulls
-- FULL with WHERE - opposite of an INNER JOIN
-- only takes records unique to table A or table B
-- therefore, each record will have null values for fields from opposite table
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;
-- no payments without customers, or customers without payment (nothing unique to either table)

-- this validates it, but wouldn't answer the question alone
SELECT COUNT(DISTINCT(customer_id)) FROM payment;
SELECT COUNT(DISTINCT(customer_id)) FROM customer;

-- LEFT OUTER JOIN (aka LEFT JOIN)
-- Keeps all records from left table
-- Populates nulls if not match in right table
-- Everything from left table, with matches from right table pulled in
-- Order matters for outer join
-- can use WHERE to grab rows just unique to table A
SELECT film.film_id, title, inventory_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id;
-- WHERE inventory.film_id IS NULL; -- films not in inventory

-- RIGHT JOIN - same as LEFT OUTER JOIN but tables are switched
-- exact same thing as switching table order in a LEFT JOIN
-- Selects all rows in right table, and pulls in info from left table
-- Rows in table A, or both tables A and B
-- Can use a WHERE statement if just want rows found exclusively in right table

-- UNIONs - used to combine the result-set of two or more SELECT statements
-- directly concatenates two results together, essentially "pasting" them together

-- What are the emails of the customers who live in California?
-- Order of tables doesn't matter as INNER JOIN
SELECT email, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

-- List of all the "Nick Wahlberg" movies
SELECT title, first_name, last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'
