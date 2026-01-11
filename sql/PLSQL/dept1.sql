create table dept1
  (deptno number(2),
  dname varchar2(20),
  loc varchar2(20)
  );

alter table dept1 add
  constraint dept1_deptno_pk primary key(deptno);