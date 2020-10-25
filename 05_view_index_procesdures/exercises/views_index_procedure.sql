create database demo;
use demo;
create table product(
	id int primary key,
    productCode varchar(255),
    productName varchar(255),
    productPrice int,
    productAmount int,
    productDescription text,
    productStatus text
);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
 create unique index inx_productCode
 on product(productCode);
 -- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
 create index inx_double on product(productName,productPrice);
 explain select productCode,productName,productPrice from product;
 show index from product;
 -- tạo views
create view view_products as select * from product;
select * from view_products;
-- sửa dổi views
create or replace view view_products as select id,productCode,productName, productPrice,productAmount
from product;
-- xóa view 
drop view view_products;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure getAllProduct()
begin
	select * from product;
end //
delimiter ;
call getAllProduct;
-- Tạo store procedure thêm một sản phẩm mới	