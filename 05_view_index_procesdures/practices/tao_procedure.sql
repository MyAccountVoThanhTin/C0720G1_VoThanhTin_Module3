use classicmodels ;
-- tạo store procedure
delimiter //
create procedure findAllCustomers()
begin 
select * from classicmodels.customers;
end//
delimiter ;
-- gọi procedure 
call findAllCustomers ;
-- xóa store procedure : chỉ có cách xóa store procedure và tạo lại
delimiter //
drop procedure if exists findAllCustomers ;
create procedure findAllCustomers()
begin
select * from classicmodels.customers
end //
delimiter ;