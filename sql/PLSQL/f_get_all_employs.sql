create or replace function f_get_all_employs
 return sys_refcursor
is
  emp_cur sys_refcursor;
begin
  open emp_cur for select * from employ;
  return emp_cur;
end;
/