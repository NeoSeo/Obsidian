with temp_01 as -- month 추출, extracting months
(
select *, extract(month from sign_up)  as sign_mon, extract(month from last_login) as last_mon
from retention
)
/* Checking last user q'ty by month
select sign_mon, last_mon, count(*) 
from temp_01
group by cube(sign_mon, last_mon)
order by sign_mon, last_mon
*/
, temp_02 as (-- 월별 마지막 유저수 the number of lost users by month
select sign_mon, last_mon, count(*) as lost
from temp_01
group by sign_mon, last_mon
order by sign_mon, last_mon
)
, temp_03 as -- 월별 가입자수 signup user by month
(
select sign_mon, count(*) as total
from temp_01	
group by sign_mon
order by sign_mon
)
, temp_04 as -- 월별 누적 중지 유저수 구하기 accumulated lost user by month
(
select t2.sign_mon as start, t2.last_mon as last, lost
	   , sum(lost) over(partition by t2.sign_mon order by t2.last_mon rows between unbounded preceding and current row) as sum
	   , t3.total as total_num
from temp_02 t2
	join temp_03 t3 on t3.sign_mon = t2.sign_mon
)

select start, last, lost, sum -- 최종 retention rate 구하기 calculating retention late
	   ,round((total_num - coalesce(lag(sum) over (partition by start),0))/total_num*100,0) as retention_rate
from temp_04;
