CREATE TABLE emp_data(emp_no int NOT NULL,
Ename varchar(20),
Job varchar (20),
MGR int ,
HIREDATE varchar(10),
SAL INT ,
COMM INT,
DEPTNO INT
)
INSERT INTO emp_data values(7369,'SMITH','CLERK',7902,'17-Dec-80',800,null,20),
(7499,'ALLEN','SALESMAN',7698,'20-Feb-81',1600,300,30),
(7521,'WARD','SALESMAN',7698,'22-Feb-81',1250,500,30),
(7566,'JONES','MANAGER',7839,'02-Apr-81',2975,null,20),
(7654,'MARTIN','SALEMAN',7698,'28-Sep-81',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'01-May-81',2850,null,30),
(7782,'CLARK','MANAGER',7839,'09-Jun-81',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'09-Dec-82',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,'17-Nov-81',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'08-Sep-81',1500,0,30),
(7876,'ADAMS','CLERK',7788,'12-Jan-83',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'03-Dec-81',950,NULL,30),
(7902,'FORD','ANALYST',7566,'03-Dec-81',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'23-Jan-82',1300,NULL,10)

CREATE TABLE Dept_table(DEPTNO INT , DNAME VARCHAR(10),LOC VARCHAR(10))
INSERT INTO Dept_table VALUES (10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON')

update emp_data set HIREDATE = NULL 
ALTER TABLE emp_data alter column HIREDATE DATE

UPDATE emp_data set HIREDATE = '1980-12-17' where emp_no = 7369

UPDATE emp_data set HIREDATE = '1981-02-20' where emp_no = 7499
UPDATE emp_data set HIREDATE = '1981-02-22' where emp_no = 7521
UPDATE emp_data set HIREDATE = '1981-04-02' where emp_no = 7566
UPDATE emp_data set HIREDATE = '1981-09-28' where emp_no = 7654
shub
UPDATE emp_data set HIREDATE = '1981-05-01' where emp_no = 7698
shub
UPDATE emp_data set HIREDATE = '1981-06-09' where emp_no = 7782
shub
UPDATE emp_data set HIREDATE = '12-09-1982' where emp_no = 7788
shub
UPDATE emp_data set HIREDATE = '1981-11-17' where emp_no = 7839
shub
UPDATE emp_data set HIREDATE = '1981-09-08' where emp_no = 7844
shub
UPDATE emp_data set HIREDATE = '1983-01-12' where emp_no = 7876
shub
UPDATE emp_data set HIREDATE = '1981-12-03' where emp_no = 7900
shub
UPDATE emp_data set HIREDATE = '1981-12-03' where emp_no = 7902
shub
UPDATE emp_data set HIREDATE = '1982-01-23' where emp_no = 7934

alter table emp_data 
add primary key emp_no

-- create prcedure procedure 
/*Create procedure all_record
as 
begin
Select * from emp_data
end
exec all_record
drop procedure details_by_job*/
-- create input perameter procedure
/*create procedure details_by_job @job varchar(20)
as
begin
select * from emp_data where Job= @job
end
exec details_by_job @job = 'analyst'
exec details_by_job 'salesman'
exec [dbo].[details_by_job]'manager'  */
/*
create procedure evenodd (@input int , @result varchar output)
as 
begin
if @input%2=0 print 'Even'
else 
print 'odd'
end

exec evenodd @input = 26 , @result = outputo
*/
drop procedure evenodd


update emp_data set Job = 'SALESMAN' WHERE Job='SALEMAN'
--display all information of emp_data table
select * from emp_data

-- display unique job of emp_table
select distinct Job from emp_data
-- list the emp in asc order on basis of their salary
select * from emp_data order by SAL Desc
--list the details of the emps in asc order of the dptno, and desc of jobs
select * from emp_data order by  DEPTNO ASC, Job Desc
-- Display all the unique job groups in the desending order
select distinct Job from emp_data order by Job desc
-- display all the details of all managers
select * from emp_data where emp_no in (select MGR from emp_data)
-- list the emp who joined before 1981
select * from emp_data where HIREDATE < ('01-Jan-1981')

SELECT CONVERT (varchar(10),HIREDATE,13) FROM emp_data

--list the emp_no ,emp_name,sal,daily sal of all employe in asc order of annualsalary
select emp_no,Ename,SAL,SAL/30 dailysal,SAL*12 ANNUALSAL from emp_data order by ANNUALSAL

-- details of all managers with experience in months
select emp_no , Ename,job,HIREDATE ,datediff(m,HIREDATE,getdate())months FROM emp_data WHERE emp_no IN (SELECT MGR from emp_data)
--  list of emp_no , e_name, salary experiance  wroking for mgr 7369
select emp_no , Ename,SAL ,datediff(m,HIREDATE,getdate())EXPERIANCE FROM emp_data WHERE MGR=7839;
-- desplay all the details of the employ whose commn is more then their sal
select * from emp_data where SAL < COMM
--LIST THE EMPS IN THE ASC ORDER OF DESIGNATION OF THOSE JOINED AFTER THE SECOUND HALF OF 1981
SELECT * FROM emp_data where HIREDATE > '1981-06-30' ORDER BY Job
-- list the emps along with their experience and daily sal is more then 100
SELECT * ,datediff(m,HIREDATE,GETDATE())EXPERIENCE,SAL/30 DAILYSAL FROM emp_data WHERE SAL/30 > 100 
--list the emps who are either clerk or analyst in the desc order
SELECT * FROM emp_data WHERE Job = 'CLERK' OR Job = 'ANALYST ' ORDER BY Job
--list the emp who joined on 1may81,3dec,81,17dec81,19jan80 in asc order of seniorty
SELECT * FROM emp_data
SELECT * FROM emp_data WHERE HIREDATE IN ('1981-05-01','1981-12-03','1981-12-17','1980-01-19') ORDER BY HIREDATE
-- list the emp who are working for the deptno 10 or 20
SELECT * FROM emp_data WHERE DEPTNO = 10 OR DEPTNO = 20

-- list the emps who are joined in year 1981
SELECT * FROM emp_data WHERE HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'
--list the emp who joined in the month of agust 1980
SELECT * FROM emp_data WHERE HIREDATE BETWEEN '1980-08-01' AND '1980-08-31'
--list the emp who annual sal ranging from 22000and 45000
SELECT * FROM emp_data WHERE SAL*12 BETWEEN 22000 AND 45000
--list the enames those are having five characters in their names 
SELECT Ename from emp_data WHERE len(Ename) = 5 
-- list the enames those are staring with S and with 5 characters 
SELECT Ename FROM emp_data WHERE LEN(Ename) = 5 AND Ename LIKE 'S%'
-- list the emps those are having four characters and 3rd chr must b R
SELECT * FROM emp_data WHERE LEN(Ename) = 4 AND Ename LIKE '__R%'
-- list the five character names starting with S and end with H 
SELECT Ename FROM emp_data WHERE LEN(Ename) = 5 AND Ename LIKE 'S%'AND Ename LIKE '%H'
SELECT Ename FROM emp_data WHERE LEN(Ename) = 5 AND Ename LIKE 'S%H'
-- list the emps who joined in january 
SELECT * FROM emp_data WHERE MONTH(HIREDATE) = 01 

-- list the emps who joined in the month of which second character is a
SELECT * from emp_data WHERE CONVERT (varchar(10),HIREDATE,13) like '____a%'  
-- list the emps whose sal is four digit no. ending with zero 
select * from emp_data where LEN(SAL) = 4 AND SAL LIKE '%0' 
--list the emp whose names having character set ll together
select * from emp_data where Ename like '%LL%'
-- list the emp those who joined to 80s
SELECT * FROM emp_data WHERE HIREDATE LIKE '1980%'
--list the emp who donot belongs to deptno 20
SELECT * FROM emp_data WHERE DEPTNO != 20
--list all the emp except president and manager in asc order of salary 
SELECT * FROM emp_data WHERE Job != 'PRESIDENT' AND Job != 'MANAGER' ORDER BY SAL
-- list all the emp who joined before and after 1981
SELECT * FROM emp_data WHERE HIREDATE >'1981-12-31'
-- list the emps whose empno not starting with digit 78
SELECT * FROM emp_data WHERE emp_no LIKE '78%'
-- list the emp who working under mng
SELECT e.Ename , m.Ename as manager from emp_data e ,emp_data m where m.emp_no=e.MGR

-- list the emp who joined in any year but not belongs to the month of march 
Select * from emp_data where MONTH(HIREDATE) != 02
-- list all the emp clerk of depno 20
select * from emp_data where Job = 'CLERK' AND DEPTNO = 20
--list the emp od deptno30 or 10 joined in 1981
SELECT * FROM emp_data WHERE DEPTNO = 30 OR DEPTNO = 10 and HIREDATE between '1981-01-01'and'1981-12-31'
-- display the loc details of smith
select *from Dept_table
SELECT * FROM emp_data
select LOC from emp_data e, Dept_table d where e.Ename ='SMITH' and e.DEPTNO = d.DEPTNO

/*list the total information of EMP table along with DNAME and loc of all emp working 
under 'accounting' and Research in asc dept no*/
select * from emp_data e, Dept_table d where (DNAME = 'ACCOUNTING' OR DNAME = 'RESEARCH') AND e.DEPTNO = d.DEPTNO ORDER BY e.DEPTNO

/*40 list the empno,ename,sal,dname, of all mgrs and analyst working in newyork dallas with the exp
an exp more then 7 years without receiving the comm asc order of Loc*/
select emp_no , Ename,SAL, DNAME, LOC from emp_data e ,Dept_table d 
where (Job = 'MANAGER' OR Job='ANALYST') AND (LOC ='NEW YORK' OR LOC = 'DALLAS')
and datediff(Y,e.HIREDATE,GETDATE())>7 AND COMM IS NULL ORDER BY LOC 
/* Display the empno, ename , sal, Dname ,Loc , Deptno, Job  of all emps working at CJICAGO  OR working 
 for accounting dept with annual sal>28000 , but the sal not be ==3000 or 2800 who doesnot belongs to 
 the MGR and whose no is having a digit 7or8 in 3rd positon in the asc order of deptno and desc order of job
 */
 SELECT emp_no , Ename, SAL, Dname,LOC , e.DEPTNO ,Job from emp_data e , Dept_table d where (d.LOC = 'CHICAGO'
 OR d.DNAME = 'ACCOUNTING') AND e.DEPTNO = d.DEPTNO and e.emp_no IN ( select emp_no from emp_data where SAL*12 > 28000 and SAL != 3000 and SAL != 2800 
 and Job != 'MANAGER' AND( emp_no LIKE '__7%'OR  emp_no LIKE'__8%') )
 order by e.DEPTNO asc ,e.Job desc

 select * from emp_data
-- 2.47. List the details of the Depts along with Empno, Ename or without the emps
select * from Dept_table, emp_data where Dept_table.DEPTNO = emp_data.DEPTNO
--2.48. List the details of the emps whose Salaries more than the employee BLAKE.
select * from emp_data where SAL > (select SAL from emp_data where Ename = 'BLAKE')
--2.49. List the emps whose Jobs are same as ALLEN.
select Ename from emp_data where Job = (select Job from emp_data where Ename = 'ALLEN') and Ename!= 'ALLEN'
--2.50. List the emps who are senior to King.
select * from emp_data where HIREDATE < (select HIREDATE from emp_data where Ename = 'KING' )
--2.51. List the Emps who are senior to their own MGRS.
SELECT * FROM emp_data WHERE HIREDATE < (SELECT B.HIREDATE,A.Ename FROM emp_data A,emp_data B WHERE B.emp_no =A.MGR )

select E.Ename , M.Ename from emp_data E, emp_data M where E.MGR = M.emp_no
select * from emp_data


