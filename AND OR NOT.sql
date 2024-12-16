SELECT * FROM address
WHERE district = 'California' AND phone LIKE '1%';

SELECT * FROM address
WHERE district = 'California' or district = 'Alberta';

SELECT * FROM address
WHERE NOT district = 'California';