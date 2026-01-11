create or replace procedure p_lp_ins_vw_insert
  (p_lp_ins_vw_rec loan_product_ins_vw%rowtype)
is
 begin
   insert into loan_product_ins_vw values p_lp_ins_vw_rec;
  
  if sql%rowcount=1 then
     dbms_output.put_line('One employ is saved with default data');
  else
     dbms_output.put_line('Problem in saving employ details');
 end if;
end;
/
