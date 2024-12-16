-- TIME - time only
-- DATE -- date only
-- TIMESTAMP - date, time
-- TIMESTAMPTZ - date, time, timezone
-- TIMEZONE
-- NOW
-- TIMEOFDAY
-- CURRENT_TIME
-- CURRENT_DATE

-- shows current settings / parameters
SHOW ALL;

SHOW TIMEZONE;

-- current date, time, timezone (in timestamp style)
SELECT NOW();

-- same info as a string
SELECT TIMEOFDAY();

-- time and timezone
SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

-- EXTRACT()- YEAR MONTH DAY WEEK QUARTER
--EXTRACT(YEAR FROM date_col)
SELECT EXTRACT(MONTH FROM payment_date) AS mth
FROM payment;

-- AGE()
--AGE(date_col)
SELECT AGE(payment_date)
FROM payment;

-- TO_CHAR() - use formatting you need e.g. mm-dd-yyyy
--TO_CHAR(date_col, 'mm-dd-yyyy')
SELECT TO_CHAR(payment_date, 'dd-MON-yy'), payment_date
FROM payment;

-- In which months did payments occur?
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- How many payments occurred on a Monday?
SELECT TO_CHAR(payment_date, 'Day'), COUNT(*)
FROM payment
GROUP BY TO_CHAR(payment_date, 'Day')
HAVING TO_CHAR(payment_date, 'Day') LIKE 'Monday%';

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;
