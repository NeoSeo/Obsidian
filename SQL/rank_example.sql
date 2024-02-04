-- null값을 맨 마지막으로 처리
select *
	   , rank() over (order by comm desc nulls last) as ranknum
from emp

-- salary 최고, 최저 순으로 각각 랭크 나타내기
select *
from 
(
select a.*
	, row_number() over (partition by deptno order by sal desc) as sal_rank_desc
	, row_number() over (partition by deptno order by sal asc) as sal_rank_asc
from hr.emp a
)
where sal_rank_desc = 1 or sal_rank_asc = 1

