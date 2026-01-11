create or replace function f_get_loan_product
(p_Prod_id LOAN_PRODUCT.Prod_id%type)
return LOAN_PRODUCT%rowtype
is
 erec LOAN_PRODUCT%rowtype;
begin
  select * into erec from LOAN_PRODUCT where Prod_id=p_Prod_id;
return erec;
end;
/
