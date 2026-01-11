declare
  l_emp_cur sys_refcursor;
  erec employ%rowtype;
begin
  l_emp_cur:=f_get_all_employs;
  loop
    fetch l_emp_cur into erec;
    exit when l_emp_cur%notfound;
    dbms_output.put_line(erec.eno || ' ' || erec.ename || ' ' ||
                      erec.gender || ' ' ||   erec.salary);

end loop;
end;
/