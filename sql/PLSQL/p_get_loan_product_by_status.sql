create or replace PROCEDURE P_GET_LOAN_PRODS_BY_STATUS 
(
  p_prod_status IN loan_product.prod_status%type,
  loan_cursor OUT sys_refcursor
) 
is
BEGIN
  open loan_cursor for SELECT * from loan_product where prod_status=p_prod_status;
END;
/