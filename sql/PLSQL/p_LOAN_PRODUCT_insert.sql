create or replace procedure p_LOAN_PRODUCT_insert
  (p_Prod_id LOAN_PRODUCT.Prod_id%type,
   p_Prod_title LOAN_PRODUCT.Prod_title%type,
   p_Prod_summary LOAN_PRODUCT.Prod_summary%type,
   p_Interest_type LOAN_PRODUCT.Interest_type%type,
   p_Interest_rate LOAN_PRODUCT.Interest_rate%type,
   p_Security_reqd LOAN_PRODUCT.Security_reqd%type,
   p_Min_loan_amt  LOAN_PRODUCT.Min_loan_amt%type,
   p_Max_loan_amt LOAN_PRODUCT.Max_loan_amt%type,
   p_Term_min LOAN_PRODUCT.Term_min%type,
   p_Term_max LOAN_PRODUCT.Term_max%type,
   p_Repayment_frequency LOAN_PRODUCT.Repayment_frequency%type,
   p_Repayment_amt LOAN_PRODUCT.Repayment_amt%type,
   p_Early_repay_allowed LOAN_PRODUCT.Early_repay_allowed%type,
   p_Min_age_limit LOAN_PRODUCT.Min_age_limit%type,
   p_Max_age_limit LOAN_PRODUCT.Max_age_limit%type,
   p_Resident LOAN_PRODUCT.Resident%type,
   p_Prod_start_dt LOAN_PRODUCT.Prod_start_dt%type,
   p_Prod_end_dt LOAN_PRODUCT.Prod_end_dt%type,
   p_Prod_status LOAN_PRODUCT.Prod_status%type
  )
is
  nn_ex exception;
  pragma exception_init(nn_ex,-1400);

  Prodtitle_length_ex exception;
  pragma exception_init(Prodtitle_length_ex, -20006);
begin
 
  if length (p_Prod_title) < 8 then
  --raise application error (-20006,'Minimum length for Prod_title is 8 charecter');
   raise Prodtitle_length_ex;
end if;
 

insert into LOAN_PRODUCT values 
   (p_Prod_id,
    p_Prod_title,
    p_Prod_summary,
    p_Interest_type,
    p_Interest_rate,
    p_Security_reqd ,
    p_Min_loan_amt,
    p_Max_loan_amt,
    p_Term_min,
    p_Term_max,
    p_Repayment_frequency,
    p_Repayment_amt,
    p_Early_repay_allowed,
    p_Min_age_limit,
    p_Max_age_limit,
    p_Resident,
    p_Prod_start_dt,
    p_Prod_end_dt,
    p_Prod_status 
);
 
if sql%rowcount=1 then
  dbms_output.put_line('one employ is saved successfully');
else
  dbms_output.put_line('There is problem in saving details');
end if;
exception 
 when dup_val_on_index then
  dbms_output.put_line('Given Prod ID is already used, Please enter another Prod-ID');
  dbms_output.put_line('Error Code : ' || sqlcode);
  dbms_output.put_line('Error message :  ' || sqlerrm);

 when nn_ex then
  if sqlerrm like '%PROD_TITLE%' then
    dbms_output.put_line('PROD-TITLE is mandatory');
  elsif sqlerrm like '%LOP_PROD_SUMMARY_NN%' then
    dbms_output.put_line('Please enter PROD SUMMARY');
  elsif sqlerrm like '%INTEREST_TYPE%' then
    dbms_output.put_line('Interest type is mandatory');
  elsif sqlerrm like '%INTEREST_RATE%' then
    dbms_output.put_line('Interest rate is not entered');
  elsif sqlerrm like '%SECURITY_REQD%' then
    dbms_output.put_line('Please enter security reqd');
  elsif sqlerrm like '%MIN_LOAN_AMT%' then
    dbms_output.put_line('Please enter Min loan amount');
  elsif sqlerrm like '%MAX_LOAN_AMT%' then
    dbms_output.put_line('Please enter Max loan amount');
  elsif sqlerrm like '%TERM_MIN%' then
    dbms_output.put_line('Please enter Term minimum');
  elsif sqlerrm like '%TERM_MAX%' then
    dbms_output.put_line('Please enter Term maximum');
  elsif sqlerrm like '%REPAYMENT_FREQUENCY%' then
    dbms_output.put_line('Please enter Repayment frequency');
  elsif sqlerrm like '%REPAYMENT_AMT%' then
    dbms_output.put_line('Please enter Repayment amount');
  elsif sqlerrm like '%EARLY_REPAY_ALLOWED%' then
    dbms_output.put_line('Early Reapy allowed is mandatory');
  elsif sqlerrm like '%MIN_AGE_LIMIT%' then
    dbms_output.put_line('Min age limit is mandatory');
  elsif sqlerrm like '%MAX_AGE_LIMIT%' then
    dbms_output.put_line('Max age limit is mandatory');
  elsif sqlerrm like '%RESIDENT%' then
    dbms_output.put_line('Resident is mandatory');
  elsif sqlerrm like '%PROD_STATUS%' then
    dbms_output.put_line('Prod status  is mandatory');
  else 
    dbms_output.put_line('Unhandling not null exception ' || ' ' || sqlerrm);
 end if;

 when Prodtitle_length_ex then
  dbms_output.put_line('Prod title name must be 8 charecter or morethan 8 charecters');  


  when others then 
  if sqlcode = -2290 then
    if sqlerrm like '%LOM_INTEREST_TYPE_CK%' then
      dbms_output.put_line('Invalid Interest type.Valid values are F and V');
    elsif sqlerrm like '%LOM_SECURITY_REQD_CK%' then
      dbms_output.put_line('Invalid security reqd.valid values are M and O');
    elsif sqlerrm like '%EARLY_REPAY_ALLOWED%' then 
      dbms_output.put_line('Invalid Entry, please enter either Y or N for Early Repay allowed');
    elsif sqlerrm like  '%LOM_PROD_STATUS_CK%' then
      dbms_output.put_line('Invalid entry for Prod status.Valid values are O ,C or H');
    else
      dbms_output.put_line('Unhandling Check constraint  ' ||  sqlerrm);
    end if;
   else 
      dbms_output.put_line('Unhandling exception ' || ' ' || sqlerrm);
    end if;
end;
/