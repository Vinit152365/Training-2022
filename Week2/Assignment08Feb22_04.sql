SELECT NAME, CREDIT_LIMIT
FROM CUSTOMERS;

SELECT * FROM CUSTOMER_CREDITS;

--#############################################
SELECT *
FROM(
    SELECT NAME, CREDIT_LIMIT
    FROM CUSTOMERS
    );  

--####################################################

SELECT
    NAME AS CUSTOMER,
    SUM( QUANTITY * UNIT_PRICE ) SALES_AMOUNT,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) 
    YEAR
FROM ORDERS INNER JOIN ORDER_ITEMS
        USING(ORDER_ID)
INNER JOIN CUSTOMERS
        USING(CUSTOMER_ID)
WHERE
    STATUS = 'SHIPPED'
GROUP BY
    NAME,
    EXTRACT(
        YEAR
    FROM
        ORDER_DATE
    );

--#####################################################
CREATE OR REPLACE VIEW CUSTOMER_SALES 
    AS
   SELECT NAME AS CUSTOMER,
    SUM( QUANTITY * UNIT_PRICE ) SALES_AMOUNT,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) 
    YEAR
FROM ORDERS INNER JOIN ORDER_ITEMS
        USING(ORDER_ID)
INNER JOIN CUSTOMERS
        USING(CUSTOMER_ID)
WHERE
    STATUS = 'SHIPPED'
GROUP BY
    NAME,
    EXTRACT(
        YEAR
    FROM
        ORDER_DATE
    );

--############################################################

SELECT CUSTOMER, SALES_AMOUNT
FROM CUSTOMER_SALES
WHERE YEAR = 2017
ORDER BY SALES_AMOUNT DESC;