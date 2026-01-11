declare
  n number:=1;
begin
  loop
    dbms_output.put_line(n);
    n:=n+1;
    /*if n>10 then
      exit;
    end if;
   */
  exit when n>5;
  end loop;
end;
/
