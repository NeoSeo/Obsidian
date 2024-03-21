with temp_01 as -- month 추출, extracting months
(
select *, extract(month from sign_up)  as sign_mon, extract(month from last_login) as last_mon
from retention
)
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
, temp_05 as ( -- 12월의 유저별 결제횟수, 결제총액 payment count, total payment by user_id in December
select user_id, count(*) as cnt, sum(amount) as total
from payment
group by user_id
order by user_id
)
, temp_06 as ( -- 가입월 조인 join sign up month
select t5.user_id, cnt, total, signup
from temp_05 t5
	join (select user_id, extract(month from sign_up) as signup
from retention) r on r.user_id = t5.user_id
)
, temp_07 as (
select signup, count(total) as payingcount, sum(total) as payingsum -- 가입월에 따른 12월의 결제횟수 및 결제총액
from temp_06
group by signup
order by signup
)
select signup -- revenue 분석
	, total as monthly_signup
	, round(lost*100.0/t3.total,0) as retention_rate
	, lost, round(payingcount*100.0/lost,0) as paying_rate
	, payingcount
	, round(payingsum/payingcount,0) as ARPPU
	, payingsum
from temp_07 t7
	join temp_03 t3 on t3.sign_mon = t7.signup
	join (select sign_mon, lost from temp_02 where last_mon = 12) t2 on t2.sign_mon = t7.signup
order by signup;
