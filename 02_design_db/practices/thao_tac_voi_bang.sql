CREATE DATABASE `vd`;
use `vd`;
create table contacts(
	contact_id int(11) not null auto_increment,
    birthday date,
    constraint contack_pk primary key(contact_id)
);
create table suppliers(
	supplier_id int(11) not null auto_increment,
    supplier_name varchar(30) not null,
    acccount_rep varchar(30) not null default 'TBD',
    constraint supplier_pk primary key(supplier_id) 
);
-- lệnh xóa các bảng đã được tạo
-- drop table table_name1,table_name2.....;

-- cách chỉnh sửa các trong bẳng dùng alter table table_name add | drop | modifi | change | remane
-- Thêm cột vào bảng
Alter table contacts add last_name varchar(30) not null after contact_id;
Alter table contacts add first_name varchar(30) not null first;

-- chỉnh sửa mô tả của một cột
-- ALTER TABLE table_name MODIFY column_name column_definition;

-- xóa một cột trong bảng 
alter table contacts drop column first_name;

-- thay đổi tên một cột 
alter table contacts change column birthday birthday_contacts date;

-- dổi tên bảng
alter table contacs rename to contacts;
select * from contacts;