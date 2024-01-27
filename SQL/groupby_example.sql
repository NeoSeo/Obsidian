select to_char(hiredate, 'yyyy') as hire_year, avg(sal)
from emp 
group by to_char(hiredate, 'yyyy')

-- group by is not only used for existing column, it also used for manifulated columns like to_char(hiredate, 'year')
