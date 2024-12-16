-- CREATE VIEW - create to view see a query with a simple call, as if it was an existing table
-- e.g. 2 tables you always join
-- As view of a data is a database object that is a stored query
SELECT * FROM customer;

SELECT * FROM address;

/*
CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;
*/

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

ALTER VIEW customer_info RENAME TO cust_info;

DROP VIEW cust_info;

DROP VIEW IF EXISTS cust_info;