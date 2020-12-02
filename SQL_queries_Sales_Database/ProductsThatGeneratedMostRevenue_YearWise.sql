//* Find out which product generated most revenue in each year and rank the products in each year



select a.orderNumber, a.productName, a.YEAR, sum(revenue)over(partition by a.YEAR, a.productName) AS sum_revenue from 
(select od.orderNumber, p.productName, YEAR(o.orderDate) as YEAR, (od.quantityOrdered*od.priceEach) AS revenue from 
orders o JOIN orderdetails od ON o.orderNumber=od.orderNumber
JOIN products p ON od.productCode=p.productCode)a;
