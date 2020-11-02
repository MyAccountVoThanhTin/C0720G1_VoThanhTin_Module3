use `bt_them`;

-- B . THAO TÁC DỮU LIỆU
-- 1. Viết câu lệnh UPDATE để cập nhật Price với điều kiện: Các mặt hàng có Price <= 1000 thì tăng thêm 10
SET SQL_SAFE_UPDATES = 0;
update products set price = price + 10 where Price <= 1000;
 -- 2. Viết câu lệnh UPDATE để cập nhật DISCOUNT với điều kiện: Các mặt hàng có Discount <= 10 thì tăng thêm 5
 update products set discount =  discount + 5 where discount <= 10;
  -- 3 . Viết câu lệnh XOÁ tất cả các mặt hàng có Stock là 0
  delete from products where products.stock = 0;
  
  -- C. TRUY VẤN DỮ LIỆU
  -- 1. Hiển thị tất cả các mặt hàng có giảm giá <= 10
  select * from products where discount <= 15;
  -- 2 . Hiển thị tất cả các mặt hàng có tồn kho <= 5 
  select * from products where stock <= 5;
  -- 3. Hiển thị tất cả các mặt hàng có Giá bán sau khi đã giảm giá <= 1000
 select * from products where (products.price *(1 - products.discount/100)) <= 1000;
  -- 4. 
  SELECT * FROM bt_them.products;