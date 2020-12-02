drop TABLE EMP_second1;
drop TABLE dept_third;
drop TABLE customer1;

CREATE TABLE dept_second(
    dno NUMBER(2) CONSTRAINT pk_dept_second PRIMARY key,
    dname VARCHAR2(14),
    loc VARCHAR2(13)  
    );
    
INSERT into dept_second
    VALUES(10,'������','����');
INSERT into dept_second(dno,dname)
    VALUES(20,'�ѹ���');
    SELECT *FROM    dept_second;
    
CREATE TABLE customer1(
id VARCHAR2(20) CONSTRAINT customer1_id_uk UNIQUE,
pwd VARCHAR2(20) CONSTRAINT customer1_pwd_nn not null,
name VARCHAR2(20) CONSTRAINT customr1_name_nn not null,
phone VARCHAR2(30),
address VARCHAR2(100)
);

INSERT into customer1
VALUES('null', '1234','�����ư���','010-1111-1111','seoul');
SELECT*FROM customer1;

INSERT into customer1
VALUES('greentea','11234','�׸�Ƽ','010-111-1111','seoul');
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
VALUES('2','��浿');
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

/*emp_sample ���̺����(where0=1,�������� / �����ȣ eno�� �⺻Ű�� �ϴ� �������� �߰��ϱ� */
create table emp_sample
as SELECT *FROM employee
where 0 =1;

ALTER TABLE emp_sample
add constraint emp_sample_eno_pk primary key(eno);

SELECT table_name, constraint_name, status
from user_constraints
where table_name ='EMP_SAMPLE;

/*primary key = �⺻Ű fk = �ܷ�Ű */
ALTER TABLE emp_sample
add constraint emp_sample_dno_fk
foreign key(dno) references department(dno);

INSERT into emp_sample(eno,ename , dno)
values(1,'ȫ�浿',null);

create sequence sample_seq
start with 1
increment by 1;

select sample_seq.currval from dual;
/*�̷��� �ϸ� ������ ����  */

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
values(40,'����');

insert into dept_copy1(dno,dname,LOC)
values(20,'�ѹ���','�λ�');

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
/* delete�� ����Ҷ� where ���ǹ��� ��������ʰԵǸ� ��� ���� ������ �Ǵ� �����϶� */
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

/* Ʈ����� ���� */
create table dept_cp
as
select * from department;

select * from dept_cp;

delete dept_cp;

/*ROLLBACK �� �Ǽ������� ������ִ°�. */
ROLLBACK;

delete dept_cp
where dno=10;

COMMIT;
ROLLBACK;

select * from dept_cp;










