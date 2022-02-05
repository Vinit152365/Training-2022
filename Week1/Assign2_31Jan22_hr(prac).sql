CREATE TABLE REGIONS (
       REG_ID INT CONSTRAINT PK_REGIONS_REG_ID PRIMARY KEY,
       REG_NAME VARCHAR(50) NOT NULL
       );
       
CREATE TABLE COUNTRIES
  (
    COUNTRY_ID   CHAR( 2 ) CONSTRAINT PK_COUNTRIES PRIMARY KEY  ,
    COUNTRY_NAME VARCHAR2( 40 ) NOT NULL,
    REG_ID  INT CONSTRAINT FK_COUNTRIES_REG_ID REFERENCES REGIONS 
  );


CREATE TABLE LOCATIONS
  (
    LOC_ID NUMBER CONSTRAINT PK_LOCATIONS PRIMARY KEY ,
    ADDRESS     VARCHAR2( 255 ) NOT NULL,
    POSTAL_CODE VARCHAR2( 20 ) ,
    CITY        VARCHAR2( 50 ) ,
    STATE       VARCHAR2( 50 ) ,
    COUNTRY_ID  CHAR( 2 ) CONSTRAINT FK_LOCATIONS_COUNTRY_ID REFERENCES COUNTRIES 
  );
  
CREATE TABLE WAREHOUSES
  (
    WAREHSE_ID NUMBER CONSTRAINT PK_WAREHOUSES PRIMARY KEY,
    WAREHSE_NAME VARCHAR( 255 ) ,
    LOC_ID  NUMBER( 12, 0 ) CONSTRAINT FK_WAREHOUSES_LOC_ID REFERENCES LOCATIONS 
  );

CREATE TABLE PRODUCT_CATEGORIES
  (
    CATEGORY_ID NUMBER CONSTRAINT PK_PRODUCT_CATEGORIES PRIMARY KEY,
    CATEGORY_NAME VARCHAR2( 255 ) NOT NULL
  );


CREATE TABLE CUSTOMERS
  (
    CID INT CONSTRAINT PK_CUSTOMERS PRIMARY KEY,
    NAME         VARCHAR2( 255 ) NOT NULL,
    ADDRESS      VARCHAR2( 255 ),
    WEBSITE      VARCHAR2( 255 ),
    CREDIT_LIMIT NUMBER( 8, 2 )
  );

DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES(
		EMP_ID 		NUMBER(4) CONSTRAINT PK_EMPLOYEES PRIMARY KEY,
		ENAME 		VARCHAR2(10),
		JOB 		VARCHAR2(9),
		MGR 		NUMBER(4),
		HIREDATE 	DATE,
		SAL 		NUMBER(7,2),
		COMM 		NUMBER(7,2)
  ); 


CREATE TABLE CONTACT
  (
    CONTACT_ID INT CONSTRAINT PK_CONTACT PRIMARY KEY,
    FNAME  VARCHAR2( 255 ) NOT NULL,
    LNAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )          
  );
  
-- ################################################################
-- 5. Insert data into DML  
-- ################################################################

Insert into REGIONS  values (1,'Europe');
Insert into REGIONS  values (2,'Americas');
Insert into REGIONS  values (3,'Asia');
Insert into REGIONS  values (4,'Middle East and Africa');

-- ################################################################
Insert into COUNTRIES values ('AR','Argentina',2);
Insert into COUNTRIES values ('AU','Australia',3);
Insert into COUNTRIES values ('BE','Belgium',1);
Insert into COUNTRIES values ('BR','Brazil',2);
Insert into COUNTRIES values ('CA','Canada',2);
Insert into COUNTRIES values ('CH','Switzerland',1);
Insert into COUNTRIES values ('CN','China',3);
Insert into COUNTRIES values ('DE','Germany',1);
Insert into COUNTRIES values ('DK','Denmark',1);
Insert into COUNTRIES values ('EG','Egypt',4);
Insert into COUNTRIES values ('FR','France',1);
Insert into COUNTRIES values ('IL','Israel',4);
Insert into COUNTRIES values ('IN','India',3);
Insert into COUNTRIES values ('IT','Italy',1);
Insert into COUNTRIES values ('JP','Japan',3);
Insert into COUNTRIES values ('KW','Kuwait',4);
Insert into COUNTRIES values ('ML','Malaysia',3);
Insert into COUNTRIES values ('MX','Mexico',2);
Insert into COUNTRIES values ('NG','Nigeria',4);
Insert into COUNTRIES values ('NL','Netherlands',1);
Insert into COUNTRIES values ('SG','Singapore',3);
Insert into COUNTRIES values ('UK','United Kingdom',1);
Insert into COUNTRIES values ('US','United States of America',2);
Insert into COUNTRIES values ('ZM','Zambia',4);
Insert into COUNTRIES values ('ZW','Zimbabwe',4);

-- ################################################################
Insert into LOCATIONS values (1,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into LOCATIONS values (2,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into LOCATIONS values (3,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into LOCATIONS values (4,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into LOCATIONS values (5,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into LOCATIONS values (6,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into LOCATIONS values (7,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into LOCATIONS values (8,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into LOCATIONS values (9,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into LOCATIONS values (10,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into LOCATIONS values (11,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into LOCATIONS values (12,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into LOCATIONS values (13,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into LOCATIONS values (14,'198 Clementi North','540198','Singapore',null,'SG');
Insert into LOCATIONS values (15,'8204 Arthur St',null,'London',null,'UK');
Insert into LOCATIONS values (16,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into LOCATIONS values (17,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into LOCATIONS values (18,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into LOCATIONS values (19,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into LOCATIONS values (20,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into LOCATIONS values (21,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into LOCATIONS values (22,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into LOCATIONS values (23,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');

-- ################################################################

Insert into WAREHOUSES values (1,'Southlake, Texas',5);
Insert into WAREHOUSES values (2,'San Francisco',6);
Insert into WAREHOUSES values (3,'New Jersey',7);
Insert into WAREHOUSES values (4,'Seattle, Washington',8);
Insert into WAREHOUSES values (5,'Toronto',9);
Insert into WAREHOUSES values (6,'Sydney',13);
Insert into WAREHOUSES values (7,'Mexico City',23);
Insert into WAREHOUSES values (8,'Beijing',11);
Insert into WAREHOUSES values (9,'Bombay',12);

-- ################################################################

INSERT INTO EMPLOYEES VALUES(7369,'SUMMER','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL);
INSERT INTO EMPLOYEES VALUES(7499,'ANNABELLE','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300);
INSERT INTO EMPLOYEES VALUES(7521,'HARPER','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500);
INSERT INTO EMPLOYEES VALUES(7566,'JUDE','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL);
INSERT INTO EMPLOYEES VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400);
INSERT INTO EMPLOYEES VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL);
INSERT INTO EMPLOYEES VALUES(7782,'TYLER','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL);
INSERT INTO EMPLOYEES VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL);
INSERT INTO EMPLOYEES VALUES(7839,'CHARLES','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL);
INSERT INTO EMPLOYEES VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0);
INSERT INTO EMPLOYEES VALUES(7876,'ALEX','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL);
INSERT INTO EMPLOYEES VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL);
INSERT INTO EMPLOYEES VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL);
INSERT INTO EMPLOYEES VALUES(7934,'GRACIE','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL);
INSERT INTO EMPLOYEES VALUES(7901,'JOHN_SMITH','CLERK',7698,to_date('23-1-1982','dd-mm-yyyy'),3000,NULL);

-- ################################################################

Insert into CUSTOMERS values (177,'United Continental Holdings','2904 S Salina St Syracuse NY','http://www.unitedcontinentalholdings.com',5000);
Insert into CUSTOMERS values (180,'INTL FCStone','5344 Haverford Ave Philadelphia PA','http://www.intlfcstone.com',5000);
Insert into CUSTOMERS values (184,'Publix Super Markets','1795 Wu Meng Muang Chonburi ','http://www.publix.com',1200);
Insert into CUSTOMERS values (187,'ConocoPhillips','Walpurgisstr 69 Munich','http://www.conocophillips.com',2400);
Insert into CUSTOMERS values (190,'3M','Via Frenzy 6903 Roma ','http://www.3m.com',1200);
Insert into CUSTOMERS values (192,'Exelon','Via Luminosa 162 Firenze ','http://www.exeloncorp.com',500);
Insert into CUSTOMERS values (208,'Tesoro','Via Notoriosa 1942 Firenze ','http://www.tsocorp.com',500);
Insert into CUSTOMERS values (207,'Northwestern Mutual','1831 No Wong Peking ','http://www.northwesternmutual.com',3600);
Insert into CUSTOMERS values (200,'Enterprise Products Partners','Via Notoriosa 1949 Firenze ','http://www.enterpriseproducts.com',2400);
Insert into CUSTOMERS values (204,'Rite Aid','Piazza Cacchiatore 23 San Giminiano ','http://www.riteaid.com',3600);
Insert into CUSTOMERS values (212,'Qualcomm','Piazza Svizzera Milano ','http://www.qualcomm.com',500);
Insert into CUSTOMERS values (216,'EMC','Via Delle Grazie 11 San Giminiano ','http://www.emc.com',700);

-- ################################################################

Insert into CONTACT values (1,'Flor','Stone','flor.stone@raytheon.com','+1 317 123 4104');
Insert into CONTACT values (2,'Lavera','Emerson','lavera.emerson@plainsallamerican.com','+1 317 123 4111');
Insert into CONTACT values (3,'Fern','Head','fern.head@usfoods.com','+1 812 123 4115');
Insert into CONTACT values (4,'Shyla','Ortiz','shyla.ortiz@abbvie.com','+1 317 123 4126');
Insert into CONTACT values (5,'Jeni','Levy','jeni.levy@centene.com','+1 812 123 4129');
Insert into CONTACT values (6,'Matthias','Hannah','matthias.hannah@chs.net','+1 219 123 4136');
Insert into CONTACT values (7,'Matthias','Cruise','matthias.cruise@alcoa.com','+1 219 123 4138');
Insert into CONTACT values (8,'Meenakshi','Mason','meenakshi.mason@internationalpaper.com','+1 317 123 4141');
Insert into CONTACT values (9,'Christian','Cage','christian.cage@emerson.com','+1 219 123 4142');
Insert into CONTACT values (10,'Charlie','Sutherland','charlie.sutherland@up.com','+1 317 123 4146');
Insert into CONTACT values (11,'Charlie','Pacino','charlie.pacino@amgen.com','+1 812 123 4150');
Insert into CONTACT values (12,'Guillaume','Jackson','guillaume.jackson@usbank.com','+1 812 123 4151');
Insert into CONTACT values (13,'Daniel','Costner','daniel.costner@staples.com','+1 812 123 4153');

-- ################################################################

Insert into PRODUCT_CATEGORIES  values (1,'CPU');
Insert into PRODUCT_CATEGORIES  values (2,'Video Card');
Insert into PRODUCT_CATEGORIES  values (3,'RAM');
Insert into PRODUCT_CATEGORIES  values (4,'Mother Board');
Insert into PRODUCT_CATEGORIES  values (5,'Storage');

-- ################################################################
-- 8. Display all records from WAREHOUSES
-- ################################################################

SELECT 
   WAREHSE_ID,WAREHSE_NAME,LOC_ID
FROM
   WAREHOUSES;
   
-- ################################################################
-- 9. Display all records from LOCATIONS
-- ################################################################
SELECT 
  LOC_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID
FROM 
  LOCATIONS;
  
-- ################################################################
-- 10. Display all records from EMPLOYEES
-- ################################################################

SELECT 
  EMP_ID,ENAME,JOB,MGR,HIREDATE,SAL,COMM  
FROM 
  EMPLOYEES;
  
-- ################################################################
-- 11. Display all records from REGIONS
-- ################################################################

SELECT 
   REG_ID, REG_NAME
FROM
   REGIONS;

-- ################################################################

-- 11. Sort recrods using order by clause
-- ################################################################
-- 11.1 Sort the all LOCATIONS DETAILS ON LOC_ID
-- ################################################################

SELECT
  LOC_ID, ADDRESS, POSTAL_CODE, CITY, STATE, COUNTRY_ID
FROM
  LOCATIONS
ORDER BY
  LOC_ID;
  
-- ################################################################
-- 11.2 Sort the all COUNTRIES DETAILS ON REG_ID
-- ################################################################
SELECT
  COUNTRY_ID, COUNTRY_NAME, REG_ID 
FROM
  COUNTRIES
ORDER BY
  REG_ID
  
