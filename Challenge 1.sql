-- How many payment transactions where greater than $5.00?
SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- How many actors have a first name that starts with P?
SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';

-- How many unique districts are our customers from?
SELECT COUNT(DISTINCT(district)) FROM address;

-- What are these districts?
SELECT DISTINCT(district) FROM address;

-- How many films have an R rating and a replacement cost between $5 and $15?
SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- How many films have the word "Truman" in the title?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%Truman%';

