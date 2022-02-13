CREATE TABLE CUST (
  CUSTID  INT CONSTRAINT PK_CUST_CUSTID PRIMARY KEY,
  CUSTNAME  VARCHAR(255),
  CONTACTNAME  VARCHAR(255) NOT NULL,
  ADDRESS  VARCHAR(255) NOT NULL,
  CITY  VARCHAR(255) NOT NULL,
  POSTCODE  VARCHAR(255) NOT NULL,
  COUNTRY  VARCHAR(255) NOT NULL
);

SELECT * FROM CUST;

INSERT INTO CUST VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany');
INSERT INTO CUST VALUES (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico');
INSERT INTO CUST VALUES (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico');
INSERT INTO CUST VALUES (4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK');
INSERT INTO CUST VALUES (5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');
INSERT INTO CUST VALUES (6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany');
INSERT INTO CUST VALUES (7, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France');
INSERT INTO CUST VALUES (8, 'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain');
INSERT INTO CUST VALUES (9, 'Bon app\'', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France');
INSERT INTO CUST VALUES (10, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada');
INSERT INTO CUST VALUES (11, 'B\'s Beverages', 'Victoria Ashworth', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK');
INSERT INTO CUST VALUES (12, 'Cactus Comidas para llevar', 'Patricio Simpson', 'Cerrito 333', 'Buenos Aires', '1010', 'Argentina');
INSERT INTO CUST VALUES (13, 'Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada 9993', 'México D.F.', '05022', 'Mexico');
INSERT INTO CUST VALUES (14, 'Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29', 'Bern', '3012', 'Switzerland');
INSERT INTO CUST VALUES (15, 'Comércio Mineiro', 'Pedro Afonso', 'Av. dos Lusíadas, 23', 'São Paulo', '05432-043', 'Brazil');

CREATE TABLE ORD(
  ORDERID   INT CONSTRAINT PK_ORD_ORDERID PRIMARY KEY,
  CUSTID   INT NOT NULL ,
  EMPID   INT NOT NULL ,
  ORDERDATE  DATE NOT NULL ,
  SHIPPERID   INT NOT NULL
);

INSERT INTO ORD VALUES (10248, 90, 5, '04-07-1996', 3);
INSERT INTO ORD VALUES (10249, 81, 6, '05-07-1996', 1);
INSERT INTO ORD VALUES (10250, 34, 4, '08-07-1996', 2);
INSERT INTO ORD VALUES (10251, 84, 3, '09-07-1996', 1);
INSERT INTO ORD VALUES (10252, 76, 4, '10-07-1996', 2);
INSERT INTO ORD VALUES (10253, 34, 3, '11-07-1996', 2);
INSERT INTO ORD VALUES (10254, 14, 5, '12-07-1996', 2);
INSERT INTO ORD VALUES (10255, 68, 9, '13-07-1996', 3);
INSERT INTO ORD VALUES (10256, 88, 3, '15-07-1996', 2);
INSERT INTO ORD VALUES (10257, 35, 4, '16-07-1996', 3);
INSERT INTO ORD VALUES (10258, 20, 1, '17-07-1996', 1);
INSERT INTO ORD VALUES (10259, 13, 4, '18-07-1996', 3);
INSERT INTO ORD VALUES (10260, 55, 4, '19-07-1996', 1);
INSERT INTO ORD VALUES (10261, 61, 4, '19-07-1996', 2);
INSERT INTO ORD VALUES (10262, 65, 8, '22-07-1996', 3);

--###############################################################
--INNER JOIN
--###############################################################
SELECT O.ORDERID,C.CUSTNAME
FROM ORD O INNER JOIN CUST C
    ON O.CUSTID=C.CUSTID;

--###############################################################    
--Select all customers, and any orders they might have: -- LEFT OUTER JOIN
--############################################################### 
SELECT O.ORDERID,C.CUSTNAME
FROM CUST C LEFT JOIN ORD O
     ON C.CUSTID=O.CUSTID
ORDER BY C.CUSTNAME,O.ORDERID;

--###############################################################    
--Select all orders : -- RIGHT OUTER JOIN
--###############################################################
SELECT O.ORDERID,C.CUSTNAME
FROM CUST C RIGHT JOIN ORD O
     ON C.CUSTID=O.CUSTID
ORDER BY O.ORDERID;

--###############################################################    
--Select ALL customers, and ALL orders they might have: -- FULL OUTER JOIN
--###############################################################
SELECT O.ORDERID,C.CUSTNAME
FROM CUST C FULL OUTER JOIN ORD O
     ON C.CUSTID=O.CUSTID
ORDER BY O.ORDERID;

--###############################################################    
--SELF JOIN
--###############################################################
SELECT C.CITY ,O.CITY AS LOC
FROM CUST C JOIN CUST O 
     ON C.POSTCODE= O.POSTCODE;
     
     