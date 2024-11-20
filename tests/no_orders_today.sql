-- Test to check if there are no orders from today

select count(*) as num_orders_today
from {{ref('stg_orders')}}
where SAFE.PARSE_DATE('%m/%d/%Y', order_date) = CURRENT_DATE()
having count(*) >0
