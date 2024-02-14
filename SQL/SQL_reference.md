# SQL reference
---

```sql

-- reference expression
where country like 'q%' -- any letter set after q
where country not like 'q__' -- any 2 letters after q

-- Regular expression
where country REGEXP '^[a,e,d].*[c,e,g]$' -- starting with a or e or d, and finished with c,e,g// .* means any letters like %

-- Slicing
left('20240203', 4) = 2024
right('20240203', 4) = 0203
substr('20240203', 1, 5) = 20240

-- Conditional
if(sal >= 2000,'High', 'Low')
case when sal >= 2000 then 'Hihg' else 'Low' end
case sal when >= 2000 then 'High'
		 when < 2000 and >= 1000 then 'Middle'
		 else 'low'
		 end

select year||'&'||month -- concat
select concat(year(trans_date),'-',month(trans_date))
where a in (' ', ' ') -- 특정 문자 조건 condition for particular string

select length 
select char_length -- 바이트 혹은 그 자체의 글자수 처리 counting the number of letter

select sum(if(c.action="confirmed",1,0)) -- pivot using if clause
where datediff(date1, date2)=1 -- 날짜 차이가 1, math date difference

-- 날짜 예문 date examples
date yyyy-mm-dd
timestamp yyyy-mm-dd hh:mm:ss
time hh24:mm:ss
interval

SELECT DATE_ADD(NOW(), INTERVAL 1 SECOND)
SELECT DATE_SUB(NOW(), INTERVAL 1 SECOND)

where between cast('2024-01-02 02:00:00' as timestamp) and cast('2024-01-04 02:00:00' as timestamp) -- date or datetime is available

to_date('2022-03-11','yyyy-mm-dd') -- 문자열을 날짜형으로 바꾸기 str to date type

date_format(trans_date, '%Y-%m') -- MySQL (https://devjhs.tistory.com/89 참고)

to_timestamp('2022-03-11','yyyy-mm-dd hh24:mi:ss') -- 날짜및시간형으로 바꾸기 str to date&time

to_char(hiredate, 'yyyy-mm-dd') -- 날짜를 string type으로 변환 date to str type

to_date('2022-03-11','yyyy-mm-dd')::text -- 문자열로 바꿔줌 str to date, again date to str

pg_typeof() -- 타입을 나타내줌 show variables type
hiredate::timestamp -- ::을 활용한 빠른 변환 quick transform
extract(year from hiredate) -- 연도 추출. worse syntax
date_part('year', hiredate) -- 연도 추출. better clause than extract, oracle
year(hiredate) -- mysql용 연도 추출

select to_date('2024-03-11', 'yyyy-mm-dd') + 2 -- 2일 더하기 add 2 days
select to_timestamp('2024-02-11 13:24:35', 'yyyy-mm-dd hh24:mi:ss') + interval'10hour' -- 10시간 더하기 add 10 hours
-- '2day 3hour 30minute' 이렇게 일, 시간, 분도 가능 
-- to_date형에도 interval로 더하면 timestamp형이 됨. to_date to be timestamp type when added by interval clause

now() -- show current_timestamp
current_date, current_time -- () 없음. showing current date/time
date_trunc('second' now()) -- 초 단위 자르기, cut by second unit
trunc(99.9999, 2) -- == 99.99
justify_interval(duration) -- 한달을 무조건 30일로 계산, counting a month firmly 30 days
age() -- 한달을 28, 31일등 정확히 계산, counting actual days within month

avg(str)
sum(str) -- 문자열은 불가 aggregate 불가
min(str)
max(str) -- group by랑 쓸 경우 아무 str이나 가져와야 할 때 max/min을 쓴다
min(date)
max(date) -- min/max는 문자열/날짜 가능. 날짜의 경우 max는 가장 최근 날짜



-- group by Pivoting시 조건에 따른 건수 계산 유형(count case when then 1 else null end)

select deptno, count(*) as cnt
, count(case when job = 'SALESMAN' then 1 end) as sales_cnt
, count(case when job = 'MANAGER' then 1 end) as manager_cnt
, count(case when job = 'ANALYST' then 1 end) as analyst_cnt
, count(case when job = 'CLERK' then 1 end) as clerk_cnt
, count(case when job = 'PRESIDENT' then 1 end) as president_cnt
from emp
group by deptno;

-- group by Pivoting시 조건에 따른 건수 계산 시 잘못된 사례(count case when then 1 else null end) 
-- 아래에서 salesman이면 0으로 놓고 counting을 해버린다. 
-- 0으로 넣고 싶으면 count대신 sum으로 한다. 
select deptno, count(*) as cnt
, count(case when job = 'SALESMAN' then 1 else 0 end) as sales_cnt -- 0으로 넣고 0까지 카운트 해버린다.
, count(case when job = 'MANAGER' then 1 else 0 end) as manager_cnt
, count(case when job = 'ANALYST' then 1 else 0 end) as analyst_cnt
, count(case when job = 'CLERK' then 1 else 0 end) as clerk_cnt
, count(case when job = 'PRESIDENT' then 1 else 0 end) as president_cnt
from emp
group by deptno;


-- 같지만 다른 쿼리문. 아래는 case when으로 직업별 월급을 컬럼으로 만들었다.
select job, sum(sal) as sales_sum
from hr.emp a
group by job;

select sum(case when job = 'SALESMAN' then sal end) as sales_sum
, sum(case when job = 'MANAGER' then sal end) as manager_sum
, sum(case when job = 'ANALYST' then sal end) as analyst_sum
, sum(case when job = 'CLERK' then sal end) as clerk_sum
, sum(case when job = 'PRESIDENT' then sal end) as president_sum
from emp;


-- table create
create table emp (id int, ename str, salary int)
insert into emp values (1, 'Neo', '1000')
insert into emp values (2, 'Yongwon', '2000')


-- Analytic SQL sample

-- *********************************************************
-- rank functions don't use windown function, can omit partition by, require order by
-- aggregate fucnctions can omit partition by, order by(for cumulation), use window clause for dynamic calculation such as moving average (이동평균)
-- lag(), lead() can omit partition by, but require order by, don't use windown (instead use offset)
-- first_value(), last_value() can omit partition by, but require order by

-- *********************************************************

select *, sum(sal) over(partition by deptno order by hiredate nulls last rows between unbounded preceding and current row) as sum
from hr.emp a;
 [[2024-02-04]]
-- Keep an order : partition clause -> sorting clause -> window(range) clause

select *
	   , sum(amount) over (partition by order_id) as total
	   , sum(amount) over (partition by order_id order by line_prod_seq) as cum_sum -- sum analytic 함수에 order by를 추가하면서 누적합계가 만들어짐
from nw.order_items


avg(sal) over (partition by deptno order by sal range between unbounded preceding and current row) as avg_range -- 같은 sal값이 있으면 동일하게 취급해서 보여준다. 
, avg(sal) over (partition by deptno order by sal rows between unbounded preceding and current row) as avg_rows -- 같은 sal값이 있어도 하나씩 처리해도 보여준다.

-- null일 경우 'noprev'이나 'nonext'를 보여줌
select empno, deptno, hiredate, ename
, lag(ename, 1, 'NoPrev') over (partition by deptno order by hiredate) as prevname
from emp

select empno, deptno, hiredate, ename
, lead(ename,1,'NoNext') over (partition by deptno order by hiredate) as nextname
from emp

select empno, ename, deptno, hiredate, sal
, first_value(sal) over (partition by deptno order by hiredate) as first_hiredate_sal
from emp;

select empno, ename, deptno, hiredate, sal
, last_value(sal) over (partition by deptno order by hiredate rows between unbounded preceding and unbounded following) as last_hiredate_sal
from emp; -- 반드시 unbounded preceding and unbounded following이다

select a.empno, ename, job, sal
, rank() over(order by sal desc) as rank -- 랭크 순서대로
, cume_dist() over (order by sal desc) as cume_dist -- 전체값 대비 정규적인 누적 확률
, percent_rank() over (order by sal desc) as percent_rank -- 랭크 베이스로 퍼센티지 
, 1.0 * (rank() over(order by sal desc) -1 )/11 as percent_rank_calc
, ntile(10) over (order by sal desc) as ntile
from hr.emp a;

select percentile_disc(0.25) within group (order by sal) as qt_1
, percentile_disc(0.5) within group (order by sal) as qt_2
from hr.emp;

```




[[데이터분석_SQL_Fundamentals.pdf]]

