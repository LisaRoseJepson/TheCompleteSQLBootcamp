SELECT * FROM film;

-- what % of the replacement cost is the rental rate
SELECT ROUND(rental_rate/replacement_cost * 100, 2) AS perc_cost
FROM film;

-- deposit of 10%
SELECT 0.1 * replacement_cost AS deposit
FROM film;

