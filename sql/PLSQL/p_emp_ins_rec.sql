create or replace procedure p_emp_ins_rec 
  (p_erec employ%rowtype)
is
begin
  insert into employ values p_erec;

 if sql%rowcount=1 then
  dbms_output.put_line('one employ data saved');
else
 dbms_output.put_line('Problem in saving employ data');
end if;
end;
/