SELECT * FROM customer;

SELECT LENGTH(first_name)
FROM customer;

-- concatenation (pipe = ALT +124)
SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT UPPER(first_name) || ' ' || last_name AS full_name
FROM customer;

-- create email address
SELECT LOWER(LEFT(first_name, 1) || last_name || '@gmail.com') AS email
FROM customer;