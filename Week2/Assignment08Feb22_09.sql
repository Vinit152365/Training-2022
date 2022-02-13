SELECT
    *
FROM
    (
        SELECT PRODUCT_ID, PRODUCT_NAME, LIST_PRICE
        FROM PRODUCTS
        ORDER BY LIST_PRICE DESC
    )
WHERE
    ROWNUM <= 10;
    
    
SELECT
    CATEGORY_NAME,
    MAX_LIST_PRICE
FROM
    PRODUCT_CATEGORIES A,
    (
        SELECT
            CATEGORY_ID,
            MAX( LIST_PRICE ) MAX_LIST_PRICE
        FROM
            PRODUCTS
        GROUP BY
            CATEGORY_ID
    ) B
WHERE
    A.CATEGORY_ID = B.CATEGORY_ID
ORDER BY
    CATEGORY_NAME;
    
--###############################################################
--LATERAL
--###############################################################
SELECT
    PRODUCT_NAME,
    CATEGORY_NAME
FROM
    PRODUCTS P,
    LATERAL(
        SELECT
            *
        FROM
            PRODUCT_CATEGORIES C
        WHERE
            C.CATEGORY_ID = P.CATEGORY_ID 
    )
ORDER BY
    PRODUCT_NAME;
    
--###############################################################
--UPDATE
--###############################################################   

UPDATE
    (
        SELECT
            LIST_PRICE
        FROM
            PRODUCTS
        INNER JOIN PRODUCT_CATEGORIES using (CATEGORY_ID)
        WHERE
            CATEGORY_NAME = 'CPU'
    )
SET
    LIST_PRICE = LIST_PRICE * 1.15; 
    
--###############################################################
--DELETE
--###############################################################    
    
DELETE
    (
        SELECT
            LIST_PRICE
        FROM
            PRODUCTS
        INNER JOIN PRODUCT_CATEGORIES using (CATEGORY_ID)
        WHERE
            CATEGORY_NAME = 'Video Card'
    )
WHERE
     LIST_PRICE < 1000; 