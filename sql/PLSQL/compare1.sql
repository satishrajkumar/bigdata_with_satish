declare
  n1 number(6,2);
  n2 number(6,2);
begin 
  n1:='&n1';
  n2:='&n2';
  if n1>n2 then
     dbms_output.put_line('n1 is greater than n2');
  elsif n1<n2 then
     dbms_output.put_line('n1 is less than n2');
  elsif n1=n2 then
     dbms_output.put_line('n1 and  n2 are equal');
  else 
     dbms_output.put_line('sorry unable to compare n1 and n2');
  end if;
end;
/