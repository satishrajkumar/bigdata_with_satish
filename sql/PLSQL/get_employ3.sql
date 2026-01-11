declare
  v_eno number(4);
  v_ename varchar2(20);
  v_job varchar2(10);
  v_sal number(9,2);
  v_comm number(9,2);
  v_deptno number(2);
begin
   select eno, ename, job,salary,comm,deptno into
        v_eno,v_ename,v_job,v_sal,v_comm,v_deptno 
   from employ3
   where eno=&eno;

 dbms_output.put_line('Employ no : ' || v_eno);
 dbms_output.put_line('Employ ename : ' || v_ename);
 dbms_output.put_line('Employ job: ' || v_job);
 dbms_output.put_line('Employ salary : ' || v_sal);
 dbms_output.put_line('Employ comm : ' || v_comm);
 dbms_output.put_line('Employ deptno : ' || v_deptno);
end;
/