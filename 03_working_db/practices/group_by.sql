use classicmodels;
SELECT * FROM classicmodels.orders;

select status from orders 
group by status;

select status, COUNT(*) as 'So luong status'
from orders
group by status;

select orders.*,orderdetails.productCode,orderdetails.priceEach,
sum(orderdetails.quantityOrdered * orderdetails.priceEach) as total
 from orders inner join orderdetails
 on orders.orderNumber = orderdetails.orderNumber group by orders.status;