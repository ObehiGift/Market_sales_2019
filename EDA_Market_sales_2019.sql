SELECT *
FROM market_sales;

SELECT COUNT(*) AS Count
FROM market_sales
WHERE Gender = 'Female';

SELECT COUNT(*) AS Count
FROM market_sales
WHERE Gender = 'male';

SELECT `customer names`, substring_index(`customer names`,'.',1) AS `First Name`,substring_index(`customer names`,'.',-1) AS `Last Name`
FROM market_sales;

DROP TABLE market_sales2;

CREATE TABLE market_sales2
LIKE market_sales;

INSERT INTO market_sales2
SELECT *
FROM market_sales;

ALTER TABLE market_sales2
ADD `First Name` TEXT AFTER `customer names`;

UPDATE market_sales2
SET `First Name` = substring_index(`customer names`,'.',1);

SELECT *
FROM market_sales2;

ALTER TABLE market_sales2
ADD `Last Name` TEXT AFTER `First name`;

UPDATE market_sales2
SET `Last Name` = substring_index(`customer names`,'.',-1);

SELECT *
FROM market_sales2;

ALTER TABLE market_sales2
DROP COLUMN `Customer Names`;

SELECT *
FROM market_sales2;

UPDATE market_sales2
SET `Product line` = 'Electronics'
WHERE `Product line` = 'Electronic accessories';

SELECT *
FROM market_sales2;

SELECT `First name`, `Last name`, Gender,City
FROM market_sales2
WHERE city = 'nay'
AND Gender = 'Female';

SELECT *
FROM market_sales2;

SELECT `First name`, `Last name`, Gender,`Gross income`
FROM market_sales2
WHERE `Gross income` > 10;

SELECT `First name`, `Last name`, Gender,`Product line`
FROM market_sales2
WHERE `Product line` = 'Electronics'
AND Gender = 'Female'
GROUP BY `First name`, `Last name`;

SELECT *
FROM market_sales2;

SELECT `First name`, `Last name`, Quantity
FROM market_sales2
WHERE Quantity > 5
ORDER BY 3;

SELECT MAX(Quantity)
FROM (SELECT `First name`, `Last name`,Quantity
FROM market_sales2) AS `Customer_names`;

SELECT `First name`, `Last name`,
MAX(Quantity) OVER ()
FROM market_sales2;

SELECT *
FROM market_sales2;

SELECT DISTINCT `First name`, `Last name`,`Customer type`
FROM market_sales2
WHERE `Customer type` = 'member';

SELECT COUNT(*)
FROM (SELECT DISTINCT `First name`, `Last name`,`Customer type`
FROM market_sales2
WHERE `Customer type` = 'member') AS Members;

SELECT DISTINCT `First name`, `Last name`,`Customer type`
FROM market_sales2
WHERE `Customer type` = 'normal';


SELECT COUNT(*)
FROM (SELECT DISTINCT `First name`, `Last name`,`Customer type`
FROM market_sales2
WHERE `Customer type` = 'normal') AS `Non-Members`;

SELECT *
FROM market_sales2;

SELECT Branch,`First name`,`Last name`,Gender,`Product Line`
FROM market_sales2
WHERE Branch = 'A'
AND Gender = 'Female'
AND `Product line` = 'health and beauty';

SELECT *
FROM market_sales2;

SELECT `Date`,STR_TO_DATE(`Date`,'%m/%d/%Y') AS `Date_format`
FROM market_sales2;

UPDATE market_sales2
SET `Date` = STR_TO_DATE(`Date`,'%m/%d/%Y');

SELECT DISTINCT `First name`,`Last name`,MONTH(`Date`) AS `Month`
FROM market_sales2
WHERE MONTH(`Date`) = '6';

SELECT *
FROM market_sales2;

SELECT DISTINCT `First name`, `Last name`, Payment, `Gross income`, `customer type`,
CASE
WHEN Payment = 'Cash' THEN 'Used Cash'
WHEN `Gross income` > 10 THEN 'High income customer'
WHEN `Customer type` = 'Normal' THEN 'Normal customer'
END AS Alias
FROM market_sales2;

SELECT `First name`, `Last name`, Payment, `Gross income`, `customer type`,
COALESCE(Alias,'-') AS Real_Alias
FROM(SELECT DISTINCT `First name`, `Last name`, Payment, `Gross income`, `customer type`,
CASE
WHEN Payment = 'Cash' THEN 'Used Cash'
WHEN `Gross income` > 10 THEN 'High income customer'
WHEN `Customer type` = 'Normal' THEN 'Normal customer'
END AS Alias 
FROM market_sales2) AS New_Alias;

SELECT *
FROM market_sales2;

SELECT DISTINCT `First name`, `Last name`
FROM market_sales2
WHERE `Product line` = 'health and beauty'
AND Gender = 'male';

SELECT *
FROM market_sales2
ORDER BY `Date`;

SELECT DISTINCT `Product line`
FROM market_sales2;

SELECT DISTINCT `Product line`, MAX(Quantity) OVER ()
FROM market_sales2;

SELECT `Product line`, COUNT(*)
FROM market_sales2
GROUP BY 1
ORDER BY 2 DESC;

SELECT `First name`,`Last name`, COUNT(*)
FROM market_sales2
GROUP BY 1,2;

SELECT `First name`,`Last name`, COUNT(*)
FROM market_sales2
GROUP BY 1,2
HAVING COUNT(*) > 1;

SELECT `Product line`,COUNT(*)
FROM market_sales2
GROUP BY 1
ORDER BY 2 DESC;