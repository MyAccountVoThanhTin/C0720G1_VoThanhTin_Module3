use classicmodels;
-- tạo views;
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM  customers;
select * from customer_views;
-- cập nhật lại views;
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';
select * from customer_views;
-- xóa views
drop view customer_views_2;