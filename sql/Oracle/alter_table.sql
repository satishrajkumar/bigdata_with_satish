alter table customers add
  constraint martial_ck check(martial_status in('MARRIED','SINGLE');
 
 SELECT * FROM CALENDARS;
 
--(1)SELECT SUBSTR(Date1,1,2),substr(date1,4,3),substr(date1,8,2) from calendars;

select * from customers;

--(2)select prefix || firstname ||lastname as fullname from customers

--3)select count(maritalstatus) from customers where maritalstatus='M';

--(4)SELECT REPLACE(ANNUALINCOME,'$','Rs') as SALARY FROM CUSTOMERS

---(5)SELECT * FROM CUSTOMERS WHERE TOTALCHILDREN='0'; 
---(5)SELECT COUNT(TOTALCHILDREN)FROM CUSTOMERS WHERE TOTALCHILDREN='0';

