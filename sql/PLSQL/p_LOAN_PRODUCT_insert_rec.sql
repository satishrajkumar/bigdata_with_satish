create or replace procedure p_LOAN_PRODUCT_insert_rec 
  (p_erec LOAN_PRODUCT%rowtype)
is
begin
insert into LOAN_PRODUCT values p_erec;

 if sql%rowcount=1 then
  dbms_output.put_line('one LOAN_PRODUCT data saved');
else
 dbms_output.put_line('Problem in saving LOAN_PRODUCT data');
end if;
end;
/