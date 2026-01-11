declare
  n number(4);
begin 
 n:='&n';
 while n <= 5
  loop
   dbms_output.put_line(n || ' ' || (n+1) || ' ' || (n+2));
   n:=n+1;
   end loop;
 end;
/
