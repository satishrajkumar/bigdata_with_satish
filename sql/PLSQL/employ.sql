-- This script is for creating employ table

/*
  Application Title 	:	Payroll 
  Developer Name	:	Srinivasa Omprakash
  Developed Date	:	13-Mar-2022
  Version		:	1.0
*/

-- creating table employ ...
create table employ
  (eno number(6),
   ename varchar2(20),
   gender char default 'M',
   salary number(9,2)
  );

-- Adding comment on employ table ...
comment on table employ is
  'It maintains all basic details of an employ';

-- adding comments on columns of employ table ...
comment on column employ.eno is
  'Maintains unique employ id';

comment on column employ.ename is
  'Maintains name in first middle last name format';

comment on column employ.gender is
  'Allowed gender is M for Male, F for Female. Default is M';

comment on column employ.salary is
  'It is CTC';
