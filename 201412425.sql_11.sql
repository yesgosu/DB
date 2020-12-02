SELECT*FROM customer;

SELECT*FROM orders;

SELECT*FROM book;

SELECT
    *
FROM customer,orders
where customer.custid=orders.custid;

SELECT
    ORDERID,orders.custid,name,address,bookid,saleprice
     from customer,orders
     where customer.custid = orders.custid;

SELECT
   orderid, orders.custid , name , address , bookid
     from customer,orders
     where customer.custid = orders.custid
    order by orders.custid; 
    

