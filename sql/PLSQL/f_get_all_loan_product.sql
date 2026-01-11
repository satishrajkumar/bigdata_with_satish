create or replace function f_get_all_loan_product
  return sys_refcursor 
is
 lom_cur sys_refcursor;
begin
 open lom_cur for select * from LOAN_PRODUCT;
  return lom_cur;
end;
/
