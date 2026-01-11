declare
  n1 number(7,2);
  n2 number (7,2);
  summ number(7);
begin
  n1:='&n1';
  n2:='&n2';
  summ:=(n1+n2);
  dbms_output.put_line('Value of n1 : ' || n1);
  dbms_output.put_line('Value of n2 : ' || n2);
  dbms_output.put_line('Sum of n1 and n2 : ' || summ);
end;
/