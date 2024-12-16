-- Datatypes: Boolean, Character, Numeric, Temporal, UUID, Array, JSON, Hstore key-value pair
-- Network address, geometric data
-- VARCHAR - best for numeric data that doesn't have arithmetic performed on it
-- e.g. phone numbers
-- also preserves leading zeroes

-- Primary key - column or group of columns that identify a row uniquely in a table
-- Foreign - field or groups of fields in a table that uniquely identify a row in a another table
-- Referencing/Child Table: table containing the FK
-- Referenced/Parent Table: table to which the FK references
-- A table can have multiple FKs

-- Column constraints
-- e.g. NOT NULL - ensures column can't have a null value
-- UNIQUE - ensures all values in column are distinct
-- PK and FK
-- CHECK - ensures all values satisfy cerntain conditions
-- EXCLUSION - ensures that if two columns are compared, not all values will be TRUE
-- Table constraints
-- REFERENCE - must reference a column in another table
-- UNIQUE - column list
-- PK

-- CREATE TABLE
-- SERIAL - creates unique integers - can be used a PK
-- If a row is later removed, it doesn't re-used that number
-- (code commented out as can only create table once - code will error if run again)
--CREATE TABLE account(
--	user_id SERIAL PRIMARY KEY,
--	username VARCHAR(50) UNIQUE NOT NULL,
--	password VARCHAR(50) NOT NULL,
--	email VARCHAR(250) UNIQUE NOT NULL,
--	created_on TIMESTAMP NOT NULL,
--	last_login TIMESTAMP
--);

--CREATE TABLE job(
--	job_id SERIAL PRIMARY KEY,
--	job_name VARCHAR(200) UNIQUE NOT NULL
--);

--CREATE TABLE account_job(
--	user_id INTEGER REFERENCES account(user_id), -- use INTEGER when FK, not SERIAL
--	job_id INTEGER REFERENCES job(job_id), 
--	hire_date TIMESTAMP
--);

-- INSERT INTO - INSERT rows into a table
-- SERIAL columns do not need to be provided a value
SELECT * FROM account;

--INSERT INTO account(username, password, email, created_on)
--VALUES
--('Lisa Rose', 'password', 'lisa.d.abbott@gmail.com', CURRENT_TIMESTAMP);

SELECT * FROM job;
--INSERT INTO job(job_name)
--VALUES
--('Geologist');

--INSERT INTO account_job(user_id, job_id, hire_date)
--VALUES
--('1', '1', CURRENT_TIMESTAMP);

SELECT * FROM account_job;

-- Get error as violates FK constraint as user_id and job_id don't exist
--INSERT INTO account_job(user_id, job_id, hire_date)
--VALUES
--('10', '10', CURRENT_TIMESTAMP);

-- UPDATE - change values of columns in a table
-- RETURNING - can return rows and columns that were changed
SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

SELECT * FROM account;

UPDATE account
SET last_login = created_on;

SELECT * FROM account;

UPDATE account
SET last_login = created_on;

SELECT * FROM account;

SELECT * FROM account_job;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

SELECT * FROM account_job;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;

SELECT * FROM account;

UPDATE account
SET username = 'LisaRose'
WHERE username = 'Lisa Rose'
RETURNING username;

-- DELETE FROM - DELETE rows
SELECT * FROM job;

--INSERT INTO job(job_name)
--VALUES
--('Entomologist');

SELECT * FROM job;

DELETE FROM job
WHERE job_name = 'Entomologist'
RETURNING job_id, job_name; -- returns back rows that were deleted

SELECT * FROM job;

-- ALTER TABLE - changes to existing table structure
-- Adding, dropping, renaming columns ADD COLUMN, DROP COLUMN
-- Changing a column's date type
-- Set DEFAULT values for a column ALTER COLUMN SET DEFAULT, DROP DEFAULT
-- Add CHECK constraints, SET NOT NULL, DROP NOT NULL, ADD CONSTRAINT
-- Renaming table
--CREATE TABLE information(
--	info_id SERIAL PRIMARY KEY,
--	title VARCHAR(500) NOT NULL,
--	person VARCHAR(50) NOT NULL UNIQUE
--);

--SELECT * FROM information;

--ALTER TABLE information
--RENAME TO new_info;

SELECT * FROM new_info;

--ALTER TABLE new_info
--RENAME COLUMN person TO people;

SELECT * FROM new_info;

--ALTER TABLE new_info
--ALTER COLUMN people DROP NOT NULL;

--INSERT INTO new_info(title)
--VALUES
--('some new title');

SELECT * FROM new_info;

-- DROP COLUMN - automatically removes all of its indexes and constraints
-- But will not removed columns used in views, triggers, stored procedures
-- without the additional CASCADE clause
-- IF EXISTS - check the column exists then doesn't error
SELECT * FROM new_info;

--ALTER TABLE new_info
--DROP COLUMN IF EXISTS people;

SELECT * FROM new_info;

-- CHECK constraint
--CREATE TABLE employees(
--	emp_id SERIAL PRIMARY KEY,
--	first_name VARCHAR(50) NOT NULL,
--	last_name VARCHAR(50) NOT NULL,
--	birth_date DATE CHECK (birth_date > '1900-01-01'),
--	hire_date DATE CHECK (hire_date > birth_date),
--	salary INTEGER CHECK (salary > 0)
--);

SELECT * FROM employees;

INSERT INTO employees(
	first_name,
	last_name,
	birth_date,
	hire_date,
	salary
)
VALUES(
	'Lisa Rose',
	'Jepson',
	'1978-01-18',
	'2022-01-17',
	'32000'
);

SELECT * FROM employees;

INSERT INTO employees(
	first_name,
	last_name,
	birth_date,
	hire_date,
	salary
)
VALUES(
	'James',
	'Jepson',
	'1983-01-18',
	'2024-04-01',
	'42000'
);

-- SERIAL keeps numbers from failed inserts
SELECT * FROM employees;