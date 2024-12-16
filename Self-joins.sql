-- Join of two copies of the same table
-- Not actually copied, but performed as though it was
-- Need to alias the table
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2
ON f1.length = f2.length
AND f1.film_id != f2.film_id -- stops self-matching
WHERE f1.length = 117;