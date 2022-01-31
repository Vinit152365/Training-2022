--  SELECT 
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

-- connect c##erpuser/root
--   GRANT create session TO c##erpuser;
--   GRANT create table TO  c##erpuser;
--   GRANT create view TO c##erpuser;
--   GRANT create any trigger TO c##erpuser;
--   GRANT create any procedure TO c##erpuser;
--   GRANT create sequence TO c##erpuser;
--   GRANT create synonym TO c##erpuser;
--   GRANT ALL PRIVILEGES TO c##erpuser;

--   GRANT CONNECT TO c##erpuser;
--   GRANT RESOURCE TO c##erpuser;
--   GRANT DBA TO c##erpuser;

-- ################################################################	
-- 3. Connect to user c##erpuser
-- ################################################################
	connect c##erpuser/root
--  Connected.
--  Connection created by CONNECT script command disconnected
