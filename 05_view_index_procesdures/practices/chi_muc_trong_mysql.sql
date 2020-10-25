SELECT * FROM classicmodels.customers;
ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
explain select * from classicmodels.customers where customers.customerNumber = 175; 
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';