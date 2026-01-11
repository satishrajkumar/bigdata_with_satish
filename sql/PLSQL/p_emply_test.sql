declare
 v_eno employ.eno%type;
 v_ename employ.ename%type;
 v_gender employ.gender%type;
 v_salary employ.salary%type;
begin
 v_eno:='&eno';
 v_ename:='&ename';
 v_gender:='&gender';
 v_salary:='&salary';
 
  p_employ_insert(v_eno,v_ename,v_gender,v_salary);
end;
/