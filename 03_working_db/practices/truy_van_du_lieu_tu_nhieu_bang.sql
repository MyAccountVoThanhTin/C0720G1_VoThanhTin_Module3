use classicmodels;
select customers.customerNumber,customers.customerName,customers.phone,customers.city,payments.paymentDate,payments.amount
from customers inner join payments on customers.customerNumber = payments.customerNumber 
where customers.city = 'Las Vegas';

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers left join orders
on customers.customerNumber = orders.customerNumber ;

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers LEFT JOIN orders
on customers.customerNumber = orders.customerNumber
where orderNumber is null