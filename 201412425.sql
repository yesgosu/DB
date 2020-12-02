drop TABLE EMP_second1;
drop TABLE dept_third;
drop TABLE customer1;

CREATE TABLE dept_second(
    dno NUMBER(2) CONSTRAINT pk_dept_second PRIMARY key,
    dname VARCHAR2(14),
    loc VARCHAR2(13)  
    );
    
INSERT into dept_second
    VALUES(10,'영업부','서울');
INSERT into dept_second(dno,dname)
    VALUES(20,'총무부');
    SELECT *FROM    dept_second;
    
CREATE TABLE customer1(
id VARCHAR2(20) CONSTRAINT customer1_id_uk UNIQUE,
pwd VARCHAR2(20) CONSTRAINT customer1_pwd_nn not null,
name VARCHAR2(20) CONSTRAINT customr1_name_nn not null,
phone VARCHAR2(30),
address VARCHAR2(100)
);

INSERT into customer1
VALUES('null', '1234','녹차아가씨','010-1111-1111','seoul');
SELECT*FROM customer1;

INSERT into customer1
VALUES('greentea','11234','그린티','010-111-1111','seoul');
SELECT *FROM    customer1;

CREATE TABLE emp_second1(
eno NUMBER CONSTRAINT emp_second1_eno_pk PRIMARY key,
ename VARCHAR2(9),
job VARCHAR2(10),
dno NUMBER CONSTRAINT emp_second1_dno_fk REFERENCES department
);

INSERT into emp_second
values(1, 'SEITH','SALESMAN',50);


CREATE TABLE EMP3(
eno NUMBER CONSTRAINT emp_EMP3_eno_pk PRIMARY key,
ename VARCHAR2(10) CONSTRAINT EMP3_ename_nu not null,
salary NUMBER(7,2) DEFAULT 1000
CONSTRAINT EMP3_salary_min check(salary>0)); 

INSERT into EMP3
VALUES('1','KIM',5999);
SELECT *FROM    EMP3;

INSERT into EMP3(eno,ename)
VALUES('2','김길동');
SELECT *FROM    EMP3;

CREATE TABLE emp_copy as SELECT *FROM    employee;
CREATE TABLE dept_copy as SELECT *FROM    department;
SELECT table_name, constraint_name from user_constraints
where table_name in('EMPLOYEE', 'DEPARTMENT');

ALTER TABLE emp_copy
add CONSTRAINT emp_copy_eno_pk PRIMARY KEY(eno);

ALTER TABLE dept_copy
add CONSTRAINT dept_copy_dno_pk PRIMARY KEY(dno);

ALTER TABLE emp_copy
add CONSTRAINT emp_copy_dno_fk
FOREIGN KEY(dno) REFERENCES dept_copy(dno);

SELECT table_name, constraint_name
from user_constraints
where table_name in('EMP_COPY','DEPT_COPY');

INSERT into emp_copy(eno,ename,job,dno)
VALUES('1','hong','manager','40');
SELECT *FROM  emp_copy;

SELECT * from emp_copy
where eno = '1';

ALTER TABLE dept_copy
drop PRIMARY key;

ALTER TABLE dept_copy
drop PRIMARY key CASCADE;

alter TABLE emp_copy
disable CONSTRAINT emp_copy_dno_fk;

SELECT table_name, constraint_name
from user_constraints
where table_name='EMP_COPY';

SELECT table_name, constraint_name , status
from user_constraints
where table_name in('EMP_COPY','DEPT_COPY');

/*emp_sample 테이블생성(where0=1,서브쿼리 / 사원번호 eno를 기본키로 하는 제약조건 추가하기 */
create table emp_sample
as SELECT *FROM employee
where 0 =1;

ALTER TABLE emp_sample
add constraint emp_sample_eno_pk primary key(eno);

SELECT table_name, constraint_name, status
from user_constraints
where table_name ='EMP_SAMPLE;

/*primary key = 기본키 fk = 외래키 */
ALTER TABLE emp_sample
add constraint emp_sample_dno_fk
foreign key(dno) references department(dno);

INSERT into emp_sample(eno,ename , dno)
values(1,'홍길동',null);

create sequence sample_seq
start with 1
increment by 1;

select sample_seq.currval from dual;
/*이렇게 하면 오류가 나옴  */

create sequence dno_seq
start with 10
increment by 10;

create table dept_copy1
as
select * from department where 0=1;

insert into dept_copy1
values(dno_seq.nextval, 'ACCOUNTING' , 'NEW YORK');

insert into dept_copy1
values(dno_seq.nextval, 'SALES' , 'CHICAGO');

SELECT * FROM DEPT_COPY1;

delete dept_copy1
where dno = 20;

create table detp_copy1
as
select * from department where 0=1;

insert into dept_copy1
values(10,'ACCOUNTING',' NEW YORK');

DESC DEPT_copy1;

insert into dept_copy1(dno,dname)
values(40,'영업');

insert into dept_copy1(dno,dname,LOC)
values(20,'총무부','부산');

select * from dept_copy1
order by dno;

update dept_copy1
set dname='PROGRAMMING'
where dno = 10;

update dept_copy1
set dname='HR';

update dept_copy1
set dname='PROGRAMMING', loc='SEOUL'
where dno=10;

delete dept_copy1
where dno=10;
/* delete를 사용할때 where 조건문을 사용하지않게되면 모든 행이 삭제과 되니 참고하라 */
select*from dept_copy1;

delete dept_copy1;
select * from dept_copy1;

update dept_copy1
set dname=(select dname
from dept_copy
where dno=30),
loc=(select loc
from dept_copy
where dno=30)
where dno=10;
select * from dept_copy1;

/* 트랜잭션 관리 */
create table dept_cp
as
select * from department;

select * from dept_cp;

delete dept_cp;

/*ROLLBACK 란 실수했을때 백업해주는것. */
ROLLBACK;

delete dept_cp
where dno=10;

COMMIT;
ROLLBACK;

select * from dept_cp;










