use classicmodels;
select * from classicmodels.products 
where  products.buyPrice > 56.76 and products.quantityInStock > 10;

select products.productCode , products.productName,products.buyPrice,productlines.textDescription from products
inner join productlines on products.productLine = productlines.productLine 
where products.buyPrice between 56.76  and 95.59;
-- sử dụng or
select * from products where  productLine = 'Classic Cars' or productVendor = 'Min Lin Diecast'; 
