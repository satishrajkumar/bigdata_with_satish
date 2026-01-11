declare
  eno number(3);
  ename varchar2(20);
  basic_sal number(9,2);
  hra number(9,2);
  tsal number(10,2);
begin
  eno:='&eno';
  ename:='&ename';
  basic_sal:='&basic_sal';
  hra:=(0.2*basic_sal);
  tsal:=(basic_sal+hra);
  dbms_output.put_line('Employ number  :' || eno);
  dbms_output.put_line('Employ Name :' || ename);
  dbms_output.put_line('basic_salary  :' || basic_sal);
  dbms_output.put_line('HRA  :' || hra);
  dbms_output.put_line('Total salary  :' || tsal);
end;
/
 