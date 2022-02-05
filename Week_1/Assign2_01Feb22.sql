--#####################################################
--1.Display all the information of the EMP table
--#####################################################
SELECT EMPNO, DEPTNO, BRANCHNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM
FROM EMP
ORDER BY DEPTNO,BRANCHNO, EMPNO;

--#####################################################
--2. Display unique Jobs from EMP table
--#####################################################
SELECT JOB
FROM EMP
GROUP BY JOB;

--#####################################################
--3. List the emps in the asc order of their Salaries
--#####################################################
SELECT EMPNO,ENAME, SAL
FROM EMP
ORDER BY SAL;

--#####################################################
--4. List the details of the emps in asc order of the Dptnos and desc of Jobs
--#####################################################
SELECT EMPNO, DEPTNO, ENAME, JOB, MGR, HIREDATE, COMM, SAL
FROM EMP
ORDER BY DEPTNO, JOB DESC;

--#####################################################
--5. Display all the unique job groups in the descending order
--#####################################################
SELECT JOB
FROM EMP
GROUP BY JOB
ORDER BY JOB DESC;

--#####################################################
--6. Display all the details of all ‘Mgrs’
--#####################################################
SELECT MGR, DEPTNO, BRANCHNO 
FROM EMP
ORDER BY MGR;

--#####################################################
--7. List the emps who joined before 1981
--#####################################################
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < TO_DATE ('1981','YYYY')
ORDER BY HIREDATE

--#####################################################
--8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
--#####################################################
SELECT EMPNO,
       ENAME,
       SAL MON_SAL,
       SAL/30 DAILY_SAL,
       12*SAL ANNUAL_SAL
FROM EMP
ORDER BY ANNUAL_SAL ASC;

--#####################################################
--9.  Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
--#####################################################
SELECT EMPNO,
       ENAME,
       JOB,
       HIREDATE,
       MONTHS_BETWEEN(SYSDATE,HIREDATE) EXP
FROM EMP
WHERE EMPNO IN(SELECT MGR FROM EMP);

--#####################################################
--10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698
--#####################################################
SELECT EMPNO,
       ENAME,
       JOB,
       HIREDATE,
       MONTHS_BETWEEN(SYSDATE,HIREDATE) EXP
FROM EMP
WHERE MGR = '7698'

--#####################################################
--11. Display all the details of the emps whose Comm  Is more than their Sal
--#####################################################

SELECT EMPNO, ENAME, SAL, COMM
FROM EMP
WHERE COMM > SAL
ORDER BY EMPNO;

--#####################################################
--13. List the emps along with their Exp and Daily Sal is more than Rs 100
--#####################################################
SELECT EMPNO,
       ENAME,
       SAL MON_SAL,
       SAL/30 DAILY_SAL,
       HIREDATE,
       MONTHS_BETWEEN(SYSDATE,HIREDATE) EXP
FROM EMP
WHERE (SAL/30) > '100'
ORDER BY EMPNO;

--#####################################################
--14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
--#####################################################
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB IN ('CLERK', 'ANALYST')
ORDER BY JOB;

--#####################################################
--15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,17-DEC-80 in asc order of seniority
--#####################################################
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE IN ('01-MAY-81','03-DEC-81','17-DEC-81','17-DEC-80')
ORDER BY HIREDATE;


--#####################################################
--16. List the emp who are working for the Deptno 10 or20
--#####################################################
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (10,20)
ORDER BY DEPTNO;

--#####################################################
--17.  List the emps who are joined in the year 81
--#####################################################
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
WHERE TO_CHAR (HIREDATE,'YY')=81
ORDER BY EMPNO;

--#####################################################
--19.  List the emps Who Annual sal ranging from 22000 and 45000
--#####################################################
SELECT EMPNO,
       ENAME,
       SAL MON_SAL,
       SAL/30 DAILY_SAL,
       12*SAL ANNUAL_SAL
FROM EMP
WHERE 12*SAL BETWEEN 22000 AND 45000
ORDER BY EMPNO;

--#####################################################
--20.  List the Enames those are having five characters in their Names
--#####################################################
SELECT EMPNO, ENAME
FROM EMP
WHERE LENGTH(ENAME)=5
ORDER BY EMPNO;

--#####################################################
--21.  List the Enames those are starting with ‘S’ and with five characters
--#####################################################
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE 'S%' AND LENGTH(ENAME)=5
ORDER BY EMPNO;

--#####################################################
--22. List the emps those are having four chars and third character must be ‘R’
--#####################################################

SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '__R_'
ORDER BY EMPNO;

--#####################################################
--23. List the Five character names starting with ‘S’ and ending with ‘H’
--#####################################################

SELECT EMPNO, ENAME
FROM EMP
WHERE LENGTH(ENAME)=5 AND ENAME LIKE 'S%H'
ORDER BY EMPNO;

--#####################################################
--24. List the emps who joined in January
--#####################################################
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')= 01
ORDER BY EMPNO;

--#####################################################
--27. List the emps whose names having a character set ‘ll’ together
--#####################################################

SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%LL%'
ORDER BY EMPNO;

--#####################################################
--29. List the emps who does not belong to Deptno 20
--#####################################################

SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN 20
ORDER BY DEPTNO;

--#####################################################
--30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
--#####################################################
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE JOB NOT IN ('PRESIDENT','MANAGER')
ORDER BY SAL;

--#####################################################
--31. List the emps whose Empno not starting with digit78
--#####################################################
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO NOT LIKE '78%'
ORDER BY EMPNO;

--#####################################################
--33. List the emps who are working under ‘MGR’
--#####################################################

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR IS NOT NULL
ORDER BY EMPNO;

--#####################################################
--34. List the emps who joined in any year but not belongs to the month of March
--#####################################################

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM') NOT IN 03
ORDER BY EMPNO;

--#####################################################
--35. List all the Clerks of Deptno 20
--#####################################################

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB='CLERK' AND DEPTNO=20
ORDER BY EMPNO;

--#####################################################
--36. List the emps of Deptno 30 or 10 joined in the year 1981
--#####################################################

SELECT EMPNO, ENAME, DEPTNO, HIREDATE
FROM EMP
WHERE DEPTNO IN (30,10) AND TO_CHAR(HIREDATE,'YY')=81
ORDER BY DEPTNO;

--#####################################################
--37. Display the details of SMITH
--#####################################################

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM
FROM EMP
WHERE ENAME= 'SMITH'

--#####################################################
--38. Display the location of SMITH
--#####################################################
-- above question related to JOINS