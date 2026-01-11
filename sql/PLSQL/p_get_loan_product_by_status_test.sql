declare
   l_loan_cur sys_refcursor;
   erec loan_product%rowtype;--sys_refcursor
begin
   p_get_loan_prods_by_status('O',l_loan_cur);
   loop
   fetch l_loan_cur into erec;
   exit when l_loan_cur%notfound;
   dbms_output.put_line(erec.prod_id || ' ' || erec.prod_title || ' ' || erec.prod_status);
 end loop;
end;
/