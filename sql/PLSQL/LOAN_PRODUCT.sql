--This script is creating LOAN_PRODUCT TABLE

/*
  Application Title     :        CBIC LOAN_PRODUCT   
  Developer Name        :        MALLINATH
  Developed Date        :        14-MAR-2022
  Version               :        1.0
*/

-- creating table LOAN_PRODUCT ...
create table LOAN_PRODUCT
  (Prod_id char(8),
   Prod_title varchar2(30),
   Prod_summary varchar2(150),
   Interest_type char(1) default 'F',
   Interest_rate number(4,2),
   Security_reqd char(1) default 'O',
   Min_loan_amt number(9,-2),
   Max_loan_amt number(9,-2),
   Term_min interval year to month,
   Term_max interval year to month,
   Repayment_frequency interval year to month,
   Repayment_amt number(9,2),
   Early_repay_allowed char(1),
   Min_age_limit number(2),
   Max_age_limit number(2),
   Resident varchar2(15),
   Prod_start_dt date,
   Prod_end_dt date,
   Prod_status char(1) default 'O'
  );

-- adding comment on LOAN_PRODUCT table ...
comment on column LOAN_PRODUCT.Prod_id is
  'Trigger is used to auto generate prod_id from prod_title.it is unique';

comment on column LOAN_PRODUCT.Prod_title is
  'it is the main description about the laon product';

comment on column LOAN_PRODUCT.Prod_summary is
  'it is the detailed description about the loan product';

comment on column LOAN_PRODUCT.Interest_type is
  'F for Fixed type, V for variable type.Default is F';

comment on column LOAN_PRODUCT.Interest_rate is
  'Rate of interest';

comment on column LOAN_PRODUCT.Security_reqd is
  'O for optional, M for Mandatory. Default is O';

comment on column LOAN_PRODUCT.Min_loan_amt is
  'The minimum loan amount that can be given to a customer';

comment on column LOAN_PRODUCT.Max_loan_amt is
  'The maxmum loan amount that can be given to a customer';

comment on column LOAN_PRODUCT.Term_min is
  'Minimum duration of time for repaying the loan amount';

comment on column LOAN_PRODUCT.Term_max is
  'Maximum duration of time for repaying the loan amount';

comment on column LOAN_PRODUCT.Repayment_frequency is
  'The interval for repaying loan installament, 0-1 indicates monthly installment payment (EMI)';

comment on column LOAN_PRODUCT.Repayment_amt is
  'Installment loan amount';

comment on column LOAN_PRODUCT.Early_repay_allowed is
  'Y for Yes ,N for No';

comment on column LOAN_PRODUCT.Min_age_limit is 
  'Minimum age considered for giving loan';

comment on column LOAN_PRODUCT.Max_age_limit is
  'Maximum age considered for giving loan';

comment on column LOAN_PRODUCT.Resident is
  'Country name where the customer is residing';

comment on column LOAN_PRODUCT.Prod_start_dt is
  'Loan product launched date';

comment on column LOAN_PRODUCT.Prod_end_dt is
  'Loan product terminated or closed date';

comment on column LOAN_PRODUCT.Prod_status is
  'O for Open, C for Closed ,H for Hold. Default is O';

--adding primary key on Prod_id column...
alter table LOAN_PRODUCT add
  constraint lop_Prod_id_pk primary key(Prod_id);
 
--adding NOT NULL constraint on....
alter table LOAN_PRODUCT modify
(Prod_title constraint lop_Prod_title_nn not null,
Prod_summary constraint lop_prod_summary_nn not null,
Interest_type constraint lop_Interest_type_nn not null,
Interest_rate constraint lop_Interest_rate_nn not null,
Security_reqd constraint lop_Security_reqd_nn not null,
Min_loan_amt constraint lop_Min_loan_amt_nn not null,
Max_loan_amt constraint lop_Max_loan_amt_nn not null,
Term_min constraint lop_Term_min_nn not null,
Term_max constraint lop_Term_max_nn not null,
Repayment_frequency constraint lop_Repayment_frequency_nn not null,
Repayment_amt constraint lop_Repayent_amt_nn not null,
Early_repay_allowed constraint lop_Early_repay_allowed_nn not null,
Min_age_limit constraint lop_Min_age_limit_nn not null,
Max_age_limit constraint lop_max_age_limit_nn not null,
Resident constraint lop_Resident_nn not null,
Prod_status constraint lop_Prod_status_nn not null);

alter table LOAN_PRODUCT add
  (constraint lom_Interest_type_ck check(Interest_type in('F','V')),
  constraint lom_Security_reqd_ck check(Security_reqd in('O','M')),
  constraint lom_Early_repay_allowed_ck check(Early_repay_allowed in('Y','N')),
  constraint lom_Prod_status_ck check(Prod_status in ('O','C','H')));