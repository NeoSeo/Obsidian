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
datetime yyyy-mm-dd hh:mm:ss
timestamp yyyy-mm-dd hh:mm:ss -- 시간존 포함
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
extract(year from hiredate) -- 연도 추출. worse syntax -> numeric type으로 나옮
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

[[2024-02-14]] percentile
with
temp_01 as
(
select percentile_disc(0.25) within group (order by sal) as qt_1
, percentile_disc(0.5) within group (order by sal) as qt_2
, percentile_disc(0.75) within group (order by sal) as qt_3
, percentile_disc(1.0) within group (order by sal) as qt_4
from hr.emp
)
select a.empno, ename, sal
, cume_dist() over (order by sal) as cume_dist
, b.qt_1, b.qt_2, b.qt_3, b.qt_4
from hr.emp a
cross join temp_01 b
order by sal; 
-- 실행하면 0.25를 첫번 째로 넣는 1250가 0.25값으로 나옮 cume_dist값에서는 0.33정도로 나온다.(discrete 특성)

select 'cont' as gubun
, percentile_cont(0.25) within group (order by sal) as qt_1
, percentile_cont(0.5) within group (order by sal) as qt_2
, percentile_cont(0.75) within group (order by sal) as qt_3
, percentile_cont(1.0) within group (order by sal) as qt_4
from hr.emp
-- disc는 기존에 있는 값에서 가져오지면 cont는 해당하는 값을 산출해서 보여줌

select * from hr.dept where (deptno, loc) in (select deptno, 'DALLAS' from hr.emp where sal < 1300);
-- you can use dept, loc at where clausse. When you use 'in', subqurey produces values using 'OR' condition 

-- 둘은 같은 값들을 보여주나 첫 쿼리는 group by 때문에 *를 쓰지 못하고 필요한 모든 컬럼명을 써줘야 한다.
select customer_id,max(order_date) from orders group by customer_id order by customer_id
select * from nw.orders where (customer_id, order_date) in (select customer_id, max(order_date) from nw.orders group by customer_id) order by customer_id;


```

|               |   non-correlated    |     correlated      |
|:-------------:|:-------------------:|:-------------------:|
|  unique row   | =, >, <, >=, <=, <> | =, >, <, >=, <=, <> |
| multiple rows |     in, not in      | exists, not exists  |

서브쿼리가 메인 쿼리의 집합 레벨을 변경 시키지도 않습니다. 때문에 실무에서 서브 쿼리를 많이 활용합니다. 그런데 서브 쿼리를 불필요하게 남발하는 경향이 생기다 보니 오히려 가독성이 떨어지거나 SQL 성능상에도 문제가 발생하는 사례가 많아지게 됩니다. 뒤에 제가 스칼라 서브쿼리를 설명 드릴텐데, 스칼라 서브쿼리가 도입되면서 한층 더 서브쿼리가 편해진 반면에 조인으로 사용되어야 할 SQL이 스칼라 서브쿼리가 활용되면서 비효율적인 SQL 작성 사례가 늘어나기도 합니다. 정리해서 말씀 드리면, 조인이 가장 기본입니다. 그리고 굳이 다른 테이블의 컬럼을 최종적으로 가져올 필요가 없고 체크 조건이나 Where절의 조건으로 사용된다면 서브쿼리를 이용하면 좋습니다. analytic SQL은 사용하는 업무가 분석 업무인가 아님 OLTP성 업무인가에 따라 달라질 수 있지만, 분석 업무에서는 analytic SQL을 사용하면 좋습니다.

[[데이터분석_SQL_Fundamentals.pdf]]

