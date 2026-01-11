declare
  l_lp_ins_vw_rec loan_product_ins_vw%rowtype;
begin
  l_lp_ins_vw_rec.Prod_id:='&Prod_id';
  l_lp_ins_vw_rec.Prod_title:='&Prod_title';
  l_lp_ins_vw_rec.Prod_summary:='&Prod_summary';
  l_lp_ins_vw_rec.Interest_rate:='&Interest_rate';
  l_lp_ins_vw_rec.Min_loan_amt:='&Min_loan_amt';
  l_lp_ins_vw_rec.Max_loan_amt:='&Max_loan_amt';
  l_lp_ins_vw_rec.Term_min:='&Term_min';
  l_lp_ins_vw_rec.Term_max:='&Term_max';
  l_lp_ins_vw_rec.Repayment_frequency:='&Repayment_frequency';
  l_lp_ins_vw_rec.Repayment_amt:='&Repayment_amt';
  l_lp_ins_vw_rec.Early_repay_allowed:='&Early_repay_allowed';
  l_lp_ins_vw_rec.Min_age_limit:='&Min_age_limit';
  l_lp_ins_vw_rec.Max_age_limit:='&Max_age_limit';
  l_lp_ins_vw_rec.Resident:='&Resident';
  l_lp_ins_vw_rec.Prod_start_dt:='&Prod_start_dt';
  l_lp_ins_vw_rec.Prod_end_dt:='&Prod_end_dt';

p_lp_ins_vw_insert ( l_lp_ins_vw_rec );
end;
/
  
