declare
 n number(3);
begin
n:='&n';
 while(n<=10) 
 loop
  dbms_output.put_line(n);
n:=n+1;
end loop;
end;
/