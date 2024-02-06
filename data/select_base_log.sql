select
  r.*,
  c.customer_id,
  c.age,
  c.sex
from reserve_tb r 
join customer_tb c 
  on r.customer_id = c.customer_id 
where r.checkin_date between '2016-01-01' and '2016-12-31'
