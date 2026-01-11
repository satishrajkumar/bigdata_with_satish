with t as(select * from (select to_date('01-Sep-22','dd-mon-yy')+level-1 as m from dual
connect by level <=to_date('31-Dec-22','dd-mon-yy') - to_date('01-Sep-22','dd-mon-yy')+1)
where to_char(m,'day')='saturday ')
select count(m) from t

with t as (select dates days from (select to_date('01-Sep-22','dd-mon-yy'),level , to_date('01-Sep-22','dd-mon-yy')+level-1 as dates from dual
connect by level <=to_date('31-Dec-22','dd-mon-yy') - to_date('01-Sep-22','dd-mon-yy')+1))
select * from t where to_char(days,'dy') in ('sun','sat')
sun'



select dates days from 
(select to_date('01-Sep-22','dd-mon-yy'),rownum ,to_date('01-Sep-22','dd-mon-yy')+rownum-1 as dates from dual
connect by level <=to_date('31-Dec-22','dd-mon-yy')-to_date('01-Sep-22','dd-mon-yy')+1)
where to_char(dates,'dy') in ('sat','sun')



select to_char(sysdate,'Dy') from dual