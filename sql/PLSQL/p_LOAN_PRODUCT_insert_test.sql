declare
   v_Prod_id LOAN_PRODUCT.Prod_id%type;
   v_Prod_title LOAN_PRODUCT.Prod_title%type;
   v_Prod_summary LOAN_PRODUCT.Prod_summary%type;
   v_Interest_type LOAN_PRODUCT.Interest_type%type;
   v_Interest_rate LOAN_PRODUCT.Interest_rate%type;
   v_Security_reqd LOAN_PRODUCT.Security_reqd%type;
   v_Min_loan_amt  LOAN_PRODUCT.Min_loan_amt%type;
   v_Max_loan_amt LOAN_PRODUCT.Max_loan_amt%type;
   v_Term_min LOAN_PRODUCT.Term_min%type;
   v_Term_max LOAN_PRODUCT.Term_max%type;
   v_Repayment_frequency LOAN_PRODUCT.Repayment_frequency%type;
   v_Repayment_amt LOAN_PRODUCT.Repayment_amt%type;
   v_Early_repay_allowed LOAN_PRODUCT.Early_repay_allowed%type;
   v_Min_age_limit LOAN_PRODUCT.Min_age_limit%type;
   v_Max_age_limit LOAN_PRODUCT.Max_age_limit%type;
   v_Resident LOAN_PRODUCT.Resident%type;
   v_Prod_start_dt LOAN_PRODUCT.Prod_start_dt%type;
   v_Prod_end_dt LOAN_PRODUCT.Prod_end_dt%type;
   v_Prod_status LOAN_PRODUCT.Prod_status%type;
begin
   v_Prod_id:='&Prod_id';
   v_Prod_title:='&Prod_title';
   v_Prod_summary:='&Prod_summary';
   v_Interest_type:='&Interest_type';
   v_Interest_rate:='&Interest_rate';
   v_Security_reqd:='&Security_reqd';
   v_Min_loan_amt:='&Min_loan_amt';
   v_Max_loan_amt:='&Max_loan_amt';
   v_Term_min:='&Term_min';
   v_Term_max:='&Term_max';
   v_Repayment_frequency:='&Repayment_frequency';
   v_Repayment_amt:='&Repayment_amt';
   v_Early_repay_allowed:='&Early_repay_allowed';
   v_Min_age_limit:='&Min_age_limit';
   v_Max_age_limit:='&Max_age_limit';
   v_Resident:='&Resident';
   v_Prod_start_dt:='&Prod_start_dt';
   v_Prod_end_dt:='&Prod_end_dt';
   v_Prod_status:='&Prod_status';
  
p_LOAN_PRODUCT_insert(v_Prod_id,v_Prod_title,v_Prod_summary,v_Interest_type,
 v_Interest_rate,v_Security_reqd,v_Min_loan_amt,v_Max_loan_amt,v_Term_min,
v_Term_max,v_Repayment_frequency,v_Repayment_amt,v_Early_repay_allowed,
v_Min_age_limit,v_Max_age_limit,v_Resident,v_Prod_start_dt,v_Prod_end_dt,v_Prod_status);
end;
/