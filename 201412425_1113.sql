SELECT name,sum(saleprice)
from customer, orders
where customer.custid=orders.custid
group by name
order by name;

alter table orders
add foreign KEY(bookid) REFERENCES book(bookid);

SELECT name,bookname,orderdate
from customer cu,orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid
and price=20000;


select stff.eno , stff.ename , stff.job , stff.manager
from employee stff, employee mgr
where stff.manager=mgr.eno and mgr.ename like 'BLAKE';

select name,saleprice
from customer cu  left outer join
orders on cu.custid=orders.custid;

select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid=od.bookid
order by bk.bookid;

select bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.bookname;

select bk.publisher, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.publisher;

select dp.dno, dp.dname
from department dp,employee ep
where dp.dno=ep.dno and ep.ename = 'SCOTT';

select stff.ename, stff.job , stff.hiredate 
from employee stff,employee mgr
where stff.manager=mgr.eno
and stff.hiredate<mgr.hiredate;

select cu.name, bk.bookname , od.orderdate
from customer cu , book bk, orders od
where cu.custid=od.custid
and od.bookid=bk.bookid
order by od.orderdate;

select * from dba_users;

create user dituser2
identified by ditdb20;

create user yesgosu
IDENTIFIED by ditdb20;

grant CREATE SESSION to dituser2;

grant select, update on customer to dituser2;

select * from SYSTEM.customor;

grant connect, RESOURCE to yesgosu;
