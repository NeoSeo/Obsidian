-- 01 --
SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;

-- 02 It shows dept table repetitively ************ -- 
with
temp_01 as (
select 1 as rnum 
union all
select 2 as rnum
)
select a.*
from hr.dept a
	cross join temp_01 b;
/*
10	ACCOUNTING	NEW YORK
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
20	RESEARCH	DALLAS
30	SALES	CHICAGO
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
40	OPERATIONS	BOSTON
*/

-- 03 --
Select a.*, b.* From table a cross join table b
/* They're same */
Select a.*, b.* From table a, table b
-- red/blue * small/medium/large/extra large = creating 8 rows

