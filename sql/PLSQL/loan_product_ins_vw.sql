create view loan_product_ins_vw
 as select Prod_id,
   Prod_title,
   Prod_summary,
   Interest_rate,
   Min_loan_amt,
   Max_loan_amt,
   Term_min,
   Term_max,
   Repayment_frequency,
   Repayment_amt,
   Early_repay_allowed,
   Min_age_limit,
   Max_age_limit,
   Resident,
   Prod_start_dt,
   Prod_end_dt
  from LOAN_PRODUCT;