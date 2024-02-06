with target_customer_month_log as (
  with customer_month_log as (
    select
      c.customer_id,
      c.age,
      c.sex,
      m.year_num,
      m.month_num,
      to_date(m.month_first_day , 'YYYY-MM-DD') as month_first_day,
      to_date(m.month_last_day , 'YYYY-MM-DD') as month_last_day
  from customer_tb c 
  cross join month_mst m 
  where m.month_first_day between '2016-01-01' and '2017-04-01'
  ), tmp_rsvflg_log as(
    select 
      c.customer_id,
      c.sex,
      c.age,
      c.year_num,
      c.month_num,
      c.month_first_day,
      case when count(r.reserve_id) > 0 then 1 else  0 end as rsv_flg
    from customer_month_log c 
    left join reserve_tb r 
      on c.customer_id = r.customer_id 
      and r.reserve_datetime between c.month_first_day and c.month_last_day

      group by c.customer_id,
              c.sex, c.age, c.year_num, c.month_num, c.month_first_day
  ), rsvflg_log as (
    select 
      *,
      lag(rsv_flg, 1) over(partition by customer_id order by month_first_day) as before_rsv_flg_m1,
      lag(rsv_flg, 2) over(partition by customer_id order by month_first_day) as before_rsv_flg_m2,
      lag(rsv_flg, 3) over(partition by customer_id order by month_first_day) as before_rsv_flg_m3
    from tmp_rsvflg_log
  ), rsvflg_target_log as(
    select 
      *,
      row_number() over(partition by customer_id order by random()) as random_rank
    from rsvflg_log
    where month_first_day between '2016-04-01' and '2017-04-01'
  )
  select * from rsvflg_target_log where random_rank = 1

), rsvflg_and_history_rsv_log as (
  select 
    base.*,
    before_rsv.reserve_id as before_reserve_id,
    before_rsv.reserve_datetime as before_reserve_date,
    before_rsv.total_price as  before_total_price,
    case when before_rsv.people_num = 1 then 1 else 0 end as before_people_num_1,
    case when before_rsv.people_num > 1 then 1 else 0 end as before_people_num_over2,
    case when base.month_num = cast(date_part('month', reserve_datetime) as int) then 1 else 0 end as before_rsv_target_month
  from target_customer_month_log base
  left join reserve_tb before_rsv
    on base.customer_id  = before_rsv.customer_id
    and before_rsv.checkin_date between base.month_first_day + cast('-365 days' as interval) and base.month_first_day + cast('-1 days' as interval)
)
select
  customer_id,
  rsv_flg,
  sex,
  age,
  month_num,
  before_rsv_flg_m1,
  before_rsv_flg_m2,
  before_rsv_flg_m3,
  coalesce(sum(before_total_price), 0) as before_total_price,
  count(before_reserve_id) as before_rsv_cnt,
  sum(before_people_num_1) as before_rsv_cnt_people_num_1,
  sum(before_people_num_1) as before_rsv_cnt_people_num_over2,
  coalesce(cast(cast(month_first_day as date) - max(cast(before_reserve_date as date) ) as int), 366) as last_rsv_day_diff,
  sum(before_rsv_target_month) as before_rsv_cnt_target_month
from rsvflg_and_history_rsv_log
group by 
  customer_id,
  sex,
  age,
  before_rsv_flg_m1,
  before_rsv_flg_m2,
  before_rsv_flg_m3,
  month_first_day,
  rsv_flg,
  month_num
