
rem copyright (c) 1990 by oracle corporation
rem name
rem    utlsampl.sql
rem  function
rem  notes
rem  modified
rem	gdudey	   06/28/95 -  modified for desktop seed database
rem	glumpkin   10/21/92 -  renamed from sqlbld.sql
rem	blinden   07/27/92 -  added primary and foreign keys to emp and dept
rem	rlim	   04/29/91 -	      change char to varchar2
rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
rem	pritto	   04/04/91 -	      change sysdate to 13-jul-87
rem   mendels	 12/07/90 - bug 30123;add to_date calls so language independent
rem
rem
rem $header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli generic<base> $ sqlbld.sql
rem
set termout off
set echo off

rem congdon    invoked in rdbms at build time.	 29-dec-1988
rem oates:     created: 16-feb-83

grant connect,resource,unlimited tablespace to nexven identified by nexven123;
alter user nexven default tablespace users;
alter user nexven temporary tablespace temp;
connect nexven/nexven123

create sequence mem_seq;

drop table dept;
create table dept
       (deptno number(2) constraint pk_dept primary key,
	dname varchar2(14 char) ,
	loc varchar2(13 char) ) ;
drop table emp;
create table emp
(empno number(4) constraint pk_emp primary key,
	ename varchar2(10 char) not null,
	job varchar2(9 char),
	mgr number(4),
	hiredate date,
	sal number(7),
	comm number(7),
	deptno number(2) constraint fk_deptno references dept);
insert into dept values
	(10,'accounting','new york');
insert into dept values (20,'research','dallas');
insert into dept values
	(30,'sales','chicago');
insert into dept values
	(40,'operations','boston');
insert into emp values
(7369,'smith','clerk',7902,to_date('17-12-1980','dd-mm-yyyy'),800,null,20);
insert into emp values
(7499,'allen','salesman',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
insert into emp values
(7521,'ward','salesman',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
insert into emp values
(7566,'jones','manager',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,null,20);
insert into emp values
(7654,'martin','salesman',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
insert into emp values
(7698,'blake','manager',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,null,30);
insert into emp values
(7782,'clark','manager',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,null,10);
insert into emp values
(7788,'scott','analyst',7566,to_date('13-jul-87')-85,3000,null,20);
insert into emp values
(7839,'king','president',null,to_date('17-11-1981','dd-mm-yyyy'),5000,null,10);
insert into emp values
(7844,'turner','salesman',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
insert into emp values
(7876,'adams','clerk',7788,to_date('13-jul-87')-51,1100,null,20);
insert into emp values
(7900,'james','clerk',7698,to_date('3-12-1981','dd-mm-yyyy'),950,null,30);
insert into emp values
(7902,'ford','analyst',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,null,20);
insert into emp values
(7934,'miller','clerk',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,null,10);
drop table bonus;
create table bonus
	(
	ename varchar2(10 char)	,
	job varchar2(9 char)  ,
	sal number,
	comm number
	) ;
drop table salgrade;
create table salgrade
      ( grade number,
	losal number,
	hisal number );
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);
commit;

set termout on
set echo on
