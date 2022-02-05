CREATE USER 
	c##erpuserprac 
IDENTIFIED BY 
	root;
    
--SELECT 
--		username, 
--		default_tablespace, 
--		profile, 
--		authentication_type
--	FROM
--		dba_users 
--	WHERE 
--		account_status = 'OPEN'
--	ORDER BY
--		username;

-- ################################################################	
-- 2. Grant Control
-- ################################################################
--GRANT create session TO c##erpuserprac;
--GRANT create table TO  c##erpuserprac;
--GRANT create view TO c##erpuserprac;
--GRANT create any trigger TO c##erpuserprac;
--GRANT create any procedure TO c##erpuserprac;
--GRANT create sequence TO c##erpuserprac;
--GRANT create synonym TO c##erpuserprac;
--GRANT ALL PRIVILEGES TO c##erpuserprac;
--
--GRANT CONNECT TO c##erpuserprac;
--GRANT RESOURCE TO c##erpuserprac;
--GRANT DBA TO c##erpuserprac;

-- ################################################################	
-- 3. Connect to user c##erpuser
-- ################################################################
--             connect c##erpuserprac/root
 