create table Book(
    bookid NUMBER,
    bookname VARCHAR2(40) NOT NULL,
    publisher VARCHAR2(30)NOT NULL,
    price NUMBER NOT NULL,
    PRIMARY KEY(bookid)
);

create table Customer(
    custid NUMBER,
    name VARCHAR2(20) NOT NULL,
    address VARCHAR2(40) NOT NULL,
    phone VARCHAR2(20),
    PRIMARY KEY(custid)
);

create table Orders(
    orderid NUMBER,
    custid NUMBER,
    bookid NUMBER,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES Customer
);

insert into Book values(1,'축구의 역사', '굿스포츠', 7000);
insert into Book values(2,'축구아는 여자', '나무수', 13000);
insert into Book values(3,'축구의 이해', '대한미디어', 22000);
insert into Book values(4,'골프 바이블', '대한미디어', 35000);
insert into Book values(5,'피겨 교본', '굿스포츠', 8000);
insert into Book values(6,'역도 단계별 기술', '굿스포츠', 6000);
insert into Book values(7,'야구의 추억', '이상미디어', 20000);
insert into Book values(8,'야구를 부탁해', '이상미디어', 13000);
insert into Book values(9,'올림픽 이야기', '심성당', 7500);
insert into Book values(10,'Olympic Champion', 'Pearson', 13000);

insert into Customer values(1,'박지성', '영국 맨체스타', '000-5000-0001');
insert into Customer values(2,'김연아', '대한민국 서울', '000-6000-0001');
insert into Customer values(3,'장미란', '대한민국 강원도', '000-7000-0001');
insert into Customer values(4,'추신수', '미국 클리블랜드', '000-8000-0001');
insert into Customer values(5,'박혜리', '대한민국 대전','');


insert into Orders values(1,1,1,6000,'2019-07-01');
insert into Orders values(2,1,3,21000,'2019-07-03');
insert into Orders values(3,2,5,8000,'2019-07-03');
insert into Orders values(4,3,6,6000,'2019-07-04');
insert into Orders values(5,4,7,20000,'2019-07-05');
insert into Orders values(6,1,2,12000,'2019-07-07');
insert into Orders values(7,4,8,13000,'2019-07-07');
insert into Orders values(8,3,10,12000,'2019-07-08');
insert into Orders values(9,2,10,7000,'2019-07-09');
insert into Orders values(10,3,8,13000,'2019-07-01');