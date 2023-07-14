#Q - Find new & repeated customers for every date for e-commerce website. 
#first calculate minimum order date for each customer as first order date. 
#then create temp columns with values 1 & 0 using CASE to check if it's new or old customer my matching order_date with first_order_date
#then aggregate those values by grouping over order_date to know no of new & repeat customers for each date.   


with orders_analyse
AS
(
	select *,
	CASE WHEN order_date=first_order_date THEN 1 ELSE 0 END as new_cust,
	CASE WHEN order_date<>first_order_date THEN 1 ELSE 0 END as repeat_cust
	from
	(
	  select *,
	  min(order_date) over(partition by customer_id) as first_order_date
	  from dengg.orders
	) as q1
)
select order_date,sum(new_cust) as New_Cust,sum(repeat_cust) as Repeat_Cust 
from orders_analyse
group by order_date
order by order_date;
