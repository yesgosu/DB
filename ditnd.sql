 CREATE table member(
    memberid varchar2(10) primary key,
    membername varchar2(20) not null,
    phone varchar2(15),
    email varchar2(30)
 );
 
 create table mem_order(
    orderid number PRIMARY key,
    memberid varchar2(10) not null,
    orderdate date
);

alter table mem_order
add foreign KEY(memberid) REFERENCES member;

insert into member(memberid, membername)
VALUES('lee1','이순신');
insert into member(memberid, membername)
VALUES('lee2','이순진');
insert into member(memberid, membername)
VALUES('lee3','이순희');


insert into mem_order(orderid, memberid)
VALUES(1,'lee2');
insert into mem_order(orderid, memberid)
VALUES(2,'lee1');

alter table mem_order
modify orderdate date default sysdate;

update member
set phone='010-1212-2323'
where memberid='lee2';

update system.customer
set phone='000-0000-0002'
where custid=5;




 