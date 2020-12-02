create user dituser9
IDENTIFIED by dibdb20;

create user dituser8
IDENTIFIED by ditdb20;

grant CONNECT, resource to dituser9;
grant create session to dituser8;
grant SELECT on book to dituser8;

revoke update on customer from dituser2;

create role programmer1;
grant connect,RESOURCE, create view to programmer1;

create user dituser102
IDENTIFIED by ditdb20;
GRANT programmer1 to dituser102;

select abs(-78), abs(78)
from dual;

select round(4.875, 1)
from dual;

select trunc(4.875, 1)
from dual;

select custid "����ȣ",round(AVG(saleprice),-2) "��ձݾ�"
from orders
group by custid
order by "��ձݾ�" desc;

select ename, lower(ename) , job , initcap(job)
from employee;


select bookname , length(bookname)
from book
where bookid=1;

select bookname , length(bookname)
from book
where length(bookname) >= 8;

select bookid, replace(bookname, '�߱�' , '��') bookname,
publisher, price
from book;

select SUBSTR(name,1,1) "��", count(*) "�ο�"
from customer
group by substr(name,1,1);

select sysdate from dual;

select round(sysdate-hiredate) "�ٹ��ϼ�"
from employee;

select round(sysdate) from employee;

select ename, sysdate, hiredate,
trunc(months_between(sysdate,hiredate)) "�ٹ�����"
from employee;

select orderid "�ֹ���ȣ", orderdate "�ֹ���",
orderdate+10 "Ȯ����"
from orders;

select ename, hiredate
from employee
where hiredate = to_date(19810220,'YYYYMMDD');

SELECT ORDERID, TO_CHAR(orderdate, 'yyyy-mm-dd dy')
custid, bookid
from orders
where orderdate=TO_DATE('20190707','yyyymmdd');

select ename,to_char(hiredate,'yy-mm-dd-dy') as "�Ի���"
from employee;

select *
from employee
where commission is null;

INSERT into customer(custid,name,address)
values(7,'�̽¿�','������ �ٸ����γ�');

select * from customer;

select name "�̸�", nvl(phone,'����ó����') "��ȭ��ȣ" from customer;


select rownum "����", custid, name, phone
from customer;

select rownum "����", custid, name, phone
from customer
where rownum <=2;

select rownum "����", custid, name, phone
from customer
where rownum <=2
order by name;

select rownum "����", custid, name, phone
from (select custid,name , phone
from customer
order by name)
where rownum <=2;
