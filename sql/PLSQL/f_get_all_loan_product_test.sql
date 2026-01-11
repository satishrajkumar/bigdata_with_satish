declare 
 l_lom_cur sys_refcursor;
erec LOAN_PRODUCT%rowtype;
begin
 l_lom_cur:=f_get_all_loan_product;
 loop
  fetch l_lom_cur into erec;
  exit when l_lom_cur%notfound;
  dbms_output.put_line(erec.Prod_id || ' ' || erec.Prod_title || '  ' ||
                       erec.Prod_summary || ' ' || erec.Interest_type || ' ' || 
                       erec.Interest_rate || ' ' || erec.Security_reqd || ' ' ||
                       erec.Min_loan_amt || ' ' || erec.Max_loan_amt || ' ' ||
                       erec.Term_min || ' ' || erec.Term_max || ' ' ||
                       erec.Repayment_frequency || ' ' || erec.Repayment_amt || ' ' ||
                       erec.Early_repay_allowed || ' ' || erec.Min_age_limit || ' ' ||
                       erec.Max_age_limit || ' ' ||  erec.Resident || ' ' ||
                       erec.Prod_start_dt || ' ' ||  erec.Prod_end_dt || ' ' ||
                       erec.Prod_status);
end loop;
end;
/