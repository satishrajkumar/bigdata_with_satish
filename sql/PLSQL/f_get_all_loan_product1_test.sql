declare
l_erec LOAN_PRODUCT%rowtype;
begin
l_erec.Prod_id:='&Prod_id';
l_erec:=f_get_LOAN_PRODUCT(l_erec.Prod_id);
 dbms_output.put_line('Prod_id : '|| l_erec.Prod_id);
 dbms_output.put_line('Prod_title :' || l_erec.Prod_title);
 dbms_output.put_line('Prod_summary : ' || l_erec.Prod_summary);
 dbms_output.put_line('Interest type : ' || l_erec.Interest_type);
 dbms_output.put_line('Interest rate: ' || l_erec.Interest_rate);
 dbms_output.put_line('Security reqd : ' || l_erec.Security_reqd);
 dbms_output.put_line('Min loan amount : ' || l_erec.Min_loan_amt);
 dbms_output.put_line('Max loan amt : ' || l_erec.Max_loan_amt);
 dbms_output.put_line('Term min : '|| l_erec.Term_min);
 dbms_output.put_line('Term max : '|| l_erec.Term_max);
 dbms_output.put_line('Repayment frequency : '|| l_erec.Repayment_frequency);
 dbms_output.put_line('Repayment amount : ' || l_erec.Repayment_amt);
 dbms_output.put_line('Early repay allowed : ' || l_erec.Early_repay_allowed);
 dbms_output.put_line('Min age limit : '|| l_erec.Min_age_limit);
 dbms_output.put_line('Max age limit : '|| l_erec.Max_age_limit);
 dbms_output.put_line('Resident : '|| l_erec.Resident);
 dbms_output.put_line('Prod start date : '|| l_erec.Prod_start_dt);
 dbms_output.put_line('Prod end date : '|| l_erec.Prod_end_dt);
 dbms_output.put_line('Prod status : ' || l_erec.Prod_status);
end;
/