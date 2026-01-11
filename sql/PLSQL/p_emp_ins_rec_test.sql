declare
erec employ%rowtype;
begin
erec.eno:='&eno';
erec.ename:='&ename';
erec.gender:='&gender';
erec.salary:='&salary';

 p_emp_ins_rec(erec);
end;
/