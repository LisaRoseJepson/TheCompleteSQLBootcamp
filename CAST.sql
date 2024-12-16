-- CAST - convert e.g. string to integer
-- won't work with everything (must be already in that right format, e.g. string of '5')
SELECT CAST('5' AS INTEGER);

-- PostgreSQL CAST operator - may not be available in other versions of SQL
SELECT '5'::INTEGER;

SELECT CAST('5' AS INTEGER) AS new_int;

SELECT * FROM rental;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;