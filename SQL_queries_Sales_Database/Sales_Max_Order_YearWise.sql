//* Find out which year saw the maximum orders and rank the years



select a.orderNumber, a.status, a.order_count, a.year, dense_rank()over(order by order_count desc)
from (select orderNumber, YEAR(orderDate) AS year, status,count(orderNumber)over(partition by YEAR(orderDate)) as order_count from orders
order by order_count  desc) a;

