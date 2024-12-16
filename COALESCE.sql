-- COALESCE accepts an unlimited number of arguments
-- and returns the first argument that is not null
-- If all are null, it returns null
SELECT COALESCE(NULL, 2, 3);

SELECT COALESCE(1, 2);

-- can use COALESCE to replace null values e.g. in mathemtatical operations
/*
CREATE TABLE discounts(
	Item VARCHAR(1),
	Price INTEGER,
	Discount INTEGER
);

INSERT INTO discounts(Item, Price, Discount)
VALUES
('A', 100, 20),
('B', 300, null),
('C', 200, 10);
*/

SELECT * FROM discounts;

-- shows null for final as conflicted datatype (can't substract null from int)
SELECT item, (price - discount) AS final
FROM discounts;

-- replaces null with 0
SELECT item, (price - COALESCE(discount, 0)) AS final
FROM discounts;
