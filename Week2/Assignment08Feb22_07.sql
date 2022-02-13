SELECT CARID, CARNAME, BRANDID
FROM CARS;

UPDATE CARS SET CARNAME = 'AUDI S1', BRANDID = 1
WHERE CARID = 3;

CREATE VIEW VW_CARS_MASTER 
     AS
      SELECT CARID, CARNAME
      FROM CARS;
      
SELECT * FROM VW_CARS_MASTER;

--###################################################
--DELETE
--###################################################

DELETE 
FROM VW_CARS_MASTER 
WHERE CARID = 1;    

--###################################################
--UPDATE
--###################################################

UPDATE VW_CARS_MASTER SET CARNAME = 'AUDI RS7 SPORTBACK'
WHERE CARID = 2;

ROLLBACK;

CREATE VIEW VW_ALL_CARS 
    AS
    SELECT CARID, CARNAME, BRANDID, BRANDNAME
    FROM CARS INNER JOIN BRANDS USING (BRANDID);
    
SELECT * FROM VW_ALL_CARS; 

--###################################################
--DELETE ALL HONDA CARS
--###################################################
DELETE
FROM VW_ALL_CARS
WHERE BRANDNAME = 'HONDA';

ROLLBACK;