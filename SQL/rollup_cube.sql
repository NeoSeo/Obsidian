with 
temp_01 as (
select to_char(b.order_date, 'yyyy') as year
	, to_char(b.order_date, 'mm') as month
	, to_char(b.order_date, 'dd') as day
	, sum(a.amount) as sum_amount
from nw.order_items a
	join nw.orders b on a.order_id = b.order_id
group by rollup(to_char(b.order_date, 'yyyy'), to_char(b.order_date, 'mm'), to_char(b.order_date, 'dd'))
) -- roll up 사용  
select case when year is null then '총매출' else year end as year
	, case when year is null then null -- year가 null이면 month가 null(rollup에선 year가 null로 나올수 있기 때문)
		else case when month is null then '년 총매출' else month end --year가 null이 아닌데 month가 null이면 
	  end as month
	, case when year is null or month is null then null
		else case when day is null then '월 총매출' else day end
	  end as day
	, sum_amount
from temp_01
order by year, month, day
;

-- 결과
/*
1998	05	05	7632.48
1998	05	06	2778.66
1998	05	  	18333.64 월매출
1998			    440623.89 05연매출
총매출			        1265792.95
*/

-- cube가 3개 -> 2^3 = 8개의 총계+소계가 나온다.
select c.category_name, b.product_name, e.last_name||e.first_name as emp_name, sum(amount) 
from nw.order_items a
	join nw.products b on a.product_id = b.product_id
	join nw.categories c on b.category_id = c.category_id
	join nw.orders d on a.order_id = d.order_id
	join nw.employees e on d.employee_id = e.employee_id
group by cube(c.category_name, b.product_name, e.last_name||e.first_name)
order by 1, 2, 3
;
