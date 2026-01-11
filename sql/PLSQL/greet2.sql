declare
  first_name varchar2(20);
  middle_name varchar2(20);
  last_name varchar2(20);
  full_name varchar2(70); 
begin
  first_name:='&first_name';
  middle_name:='&middle_name';
  last_name:='&last_name';

  full_name:=first_name || ' ' || middle_name || ' ' || last_name;
 
  dbms_output.put_line('my full name is ' || full_name);
end;
/ 

