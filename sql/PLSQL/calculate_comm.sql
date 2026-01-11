declare
  v_eno employ3.eno%type;
  v_ename employ3.ename%type;
  v_salary employ3.salary%type;
  v_comm employ3.comm%type;
begin
    select eno,ename,salary into v_eno,v_ename,v_salary from employ3 
    where eno='&eno';

  if v_salary >= 7500 then
     v_comm:=v_salary* .3;
  elsif v_salary >= 6000 then
     v_comm:=v_salary*.2;
  else
     v_comm:=v_salary* .1;
  end if;

  update employ3 set comm=v_comm where eno=v_eno;

  dbms_output.put_line('Employ no : ' ||  v_eno);
  dbms_output.put_line('Employ name : ' ||  v_ename);
  dbms_output.put_line('Employ salary : ' ||  v_salary);
  dbms_output.put_line('Employ commission : ' ||  v_comm);
end;
/