declare
erec LOAN_PRODUCT%rowtype;
begin
erec.Prod_id:='&Prod_id';
erec.Prod_title:='&Prod_title';
erec.Prod_summary:='&Prod_summary';
erec.Interest_type:='&Interest_type';
erec.Interest_rate:='&Interest_rest';
erec.Security_reqd:='&Security_reqd';
erec.Min_loan_amt:='&Min_loan_amt';
erec.Max_loan_amt:='&Max_loan_amt';
erec.Term_min:='&Term_min';
erec.Term_max:='&Term_max';
erec.Repayment_frequency:='&Repayment_frequency';
erec.Repayment_amt:='&Repayment_amt';
erec.Early_repay_allowed:='&Early_repay_allowed'; 
erec.Min_age_limit:='&Min_age_limit';
erec.Max_age_limit:='&Max_age_limit';
erec.Resident:='&Resident';
erec.Prod_start_dt:='&Prod_start_dt';
erec.Prod_end_dt:='&Prod_end_dt';
erec.Prod_status:='&Prod_status';

 p_LOAN_PRODUCT_insert_rec (erec);
end;
/