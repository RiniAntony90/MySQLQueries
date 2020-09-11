//* Find out which year saw the most revenue generated and rank the years in order of revenue generated


select c.YEAR, c.Sum_YearWise, c.Revenue_rank from 
(select b.orderNumber, b.YEAR, b.Sum_YearWise, dense_rank()over(order by Sum_YearWise desc) AS Revenue_rank from (select a.orderNumber, a.YEAR,
 sum(total_price)over(partition by a.YEAR) AS Sum_YearWise from
(select o.orderNumber, YEAR(o.orderDate) as YEAR, (od.quantityOrdered*od.priceEach) AS total_price from 
orderdetails od JOIN orders o ON od.orderNumber=o.orderNumber) a)b)c
GROUP BY c.YEAR;
