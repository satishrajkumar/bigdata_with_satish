create table employ3
  (eno number(6),
   ename varchar(20),
   job varchar2(10),
   salary number(9,2),
   comm number(9,2),
   deptno number(2)
  );
 
alter table employ3 add
 constraint employ3_deptno_fk foreign key(deptno)
     references dept1(deptno);