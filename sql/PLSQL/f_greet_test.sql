declare
  myname varchar2(20);
begin
 myname:='&myname';
 dbms_output.put_line(f_greet  || ' ' || myname);
end;
/