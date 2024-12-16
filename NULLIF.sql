-- NULLIF - takes two arguments, returns null if they are equal, and first argument if not
/*
CREATE TABLE depts(
	firstname VARCHAR(50),
	dept VARCHAR(50)
);

INSERT INTO depts(firstname, dept)
VALUES
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');
*/

SELECT * FROM depts;

/*
SELECT(
SUM(CASE
   	WHEN dept = 'A' THEN 1
   	ELSE 0
END) / 
SUM(CASE
   	WHEN dept = 'B' THEN 1
   	ELSE 0
END)
)  AS dept_ratio 	
FROM depts;
*/

DELETE FROM depts
WHERE dept = 'B';

SELECT * FROM depts;

SELECT(
SUM(CASE
   	WHEN dept = 'A' THEN 1
   	ELSE 0
END) / 
NULLIF( -- removes the div by 0 error and returns null instead
SUM(CASE
   	WHEN dept = 'B' THEN 1
   	ELSE 0
END), 0)
)  AS dept_ratio 	
FROM depts;