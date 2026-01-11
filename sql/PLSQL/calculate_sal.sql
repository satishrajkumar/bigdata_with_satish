declare
   v_eno emp2.eno%type;
   v_ename emp2.ename%type;
   v_basic_sal emp2.basic_sal%type;
   v_hra emp2.hra%type;
   v_tsal emp2.tsal%type;
begin
   select eno,ename,basic_sal,tsal into v_eno,v_ename,v_basic_sal,v_tsal from emp2 
   where eno='&eno';

if v_basic_sal >= 25000 then
   v_hra:=v_basic_sal * .2;
   v_tsal:=(v_basic_sal + v_hra);
else
   v_hra:=v_basic_sal * .10;
   v_tsal:=(v_basic_sal + v_hra);
end if ;
   update emp2 set hra=v_hra where eno=v_eno;
   update emp2 set tsal= v_tsal where eno=v_eno;
  
   dbms_output.put_line('Employ no :  ' || v_eno);
   dbms_output.put_line('Employ name :  ' || v_ename);
   dbms_output.put_line('Employ basic_sal :  ' || v_basic_sal);
   dbms_output.put_line('Employ hra :  ' || v_hra);
   dbms_output.put_line('Employ total_salary :  ' || v_tsal);
end;
/
