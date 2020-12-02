//* Find out which product sold the most in each year and rank the products in each year



select c.productName, c.orderNumber, c.year, c.rank_by_product_count from
(select b.productName, b.orderNumber, b.year, b.product_count, dense_rank()over(partition by b.year order by b.product_count desc) AS rank_by_product_count from
(select a.productName, a.orderNumber, 
a.year, count(a.productCode)over(partition by a.year, a.productCode) AS product_count from (select p.productName, o.orderNumber,
YEAR(o.orderDate) as year, od.productCode from
orders o JOIN orderdetails od ON o.orderNumber=od.orderNumber
JOIN products p ON od.productCode=p.productCode) a)b)c
where rank_by_product_count=1
GROUP BY c.year;
