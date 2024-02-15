-- subquery  
select * from nw.orders where (customer_id, order_date) in (select customer_id, max(order_date) 
from nw.orders group by customer_id) order by customer_id;

-- row_number()
with temp_01 as
(
select order_id, customer_id, employee_id, order_date
	   , row_number() over (partition by customer_id order by order_date DESC) as recent
from orders
)
select * from temp_01
where recent = 1
order by customer_id

-- group by
select customer_id,max(order_date) from orders group by customer_id order by customer_id
