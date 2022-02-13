--#########################################################
--FETCH TOP 5 ROWS
--#########################################################

SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
FETCH NEXT 5 ROWS ONLY;

--#########################################################
--FETCH 1 ROW
--#########################################################

SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
FETCH FIRST 1 ROW;


SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
FETCH NEXT 10 ROWS ONLY;

--#########################################################
--FETCH TOP 10 ROWS WITH TIES
--#########################################################

SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
FETCH NEXT 10 ROWS WITH TIES;

--#########################################################
--FETCH TOP 5 PERCENT ROWS
--query returns top 5% products with the highest inventory leveL
--The inventories table has 1112 rows, therefore, 5% of 1112 is 55.6 which is rounded up to 56
--#########################################################

SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
FETCH NEXT 5 PERCENT ROWS ONLY;

--#########################################################
--FETCH 10 ROWS OFFSET 10
--#########################################################

SELECT PRODUCT_NAME, QUATITY
FROM INVENTORIES INNER JOIN PRODUCTS USING(PRODUCT_ID)
ORDER BY QUANTITY DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

