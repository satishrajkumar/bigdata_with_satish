create table fixed_deposit
  (acc number(10),
   cname varchar2(20),
   deposited_dt date,
   deposited_amt number(9,2),
   maturity_term interval year to month
);