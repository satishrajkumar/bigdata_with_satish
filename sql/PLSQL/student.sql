declare
  sno number(6);
  sname varchar2(20);
  msql number(3);
  mplsql number(3);
 avge number(3);
begin
  sno:='&sno';
  sname:='&sname';
  msql:='&msql';
  mplsql:='&mplsql';
 avge:=(msql+mplsql)/2;
 dbms_output.put_line('student No  : ' || sno);
 dbms_output.put_line('student Name : ' || sname);
 dbms_output.put_line('Marks in  SQL : ' || msql);
 dbms_output.put_line('Marks in PLSQL : ' || mplsql);
 dbms_output.put_line(' Average marks : ' || avge);
end;
/