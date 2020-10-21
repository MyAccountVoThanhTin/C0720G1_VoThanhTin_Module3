drop database if exists oto;
create database oto;
use oto;
drop table if exists customers;
create table customers(
	cus_id int primary key ,
    cus_name varchar(50) not null,
    cus_LastName varchar(50) not null,
    cus_firstName varchar(50) not null,
    cus_phone varchar(10) not null,
    cus_address1 longtext not null,
    cus_address2 longtext not null,
    cus_city varchar(50) not null,
    cus_state varchar(255) not null,
    cus_postalCode int not null,
    cus_country varchar(255) not null,
    cus_creditLimit double,
    salesRepEmployeeNumber int,
    foreign key(salesRepEmployeeNumber) references Employees(ma_nv)
); 
drop table if exists ProductsLine;
create table ProductsLine(
	prod_id int primary key ,
    prod_decription longtext,
    prod_image text
); 
drop table if exists Products;
create table Products(
	product_code int primary key,
    product_name varchar(70) not null,
    product_scale varchar(10) not null,
    supplier varchar(50)  not null,
    product_decription text not null,
    amount int not null,
    import_price double not null,
    export_price double not null,
    prod_id int,
	 foreign key(prod_id) references ProductsLine(prod_id)
);
drop table if exists orders;
create table orders(
	order_number int primary key,
    ngay_mua date,
    ngay_giao date,
    ngay_giao_thuc_te date,
	trang_thai varchar(15)not null,
    ghi_chu text not null,
    so_luong_dat int,
    gia  double,
    cus_id int,
	foreign key(cus_id) references customers(cus_id)
);
drop table if exists OrderDetails;
create table OrderDetails(
	order_number int ,
    product_code int,
	constraint pk_pro foreign key(order_number) references orders(order_number),
    constraint pk_code foreign key(product_code) references Products(product_code)
); 
drop table if exists Payments;
create table Payments(
	ma_thanh_toan int primary key,
    ngay_thanh_toan date not null,
    so_tien double,
    cus_id int,
    foreign key(cus_id) references customers(cus_id)
);
drop table if exists Employees;
create table Employees(
    ma_nv int primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(100) not null,
    ten_cong_viec varchar(50) not null,
    reportTo int,
    foreign key(reportTo) references Employees(ma_nv)
);
drop table if exists Offices;
create table Offices(
	ma_van_phong int primary key,
    dia_chi1 varchar(50)  not null,
    dia_chi2 varchar(50) not null,
    thanh_pho varchar(50) not null,
    bang_vung varchar(50) not null,
    dien_thoai varchar(50) not null,
    quoc_gia varchar(30),
    ma_vung varchar(15) not null,
    ma_nv int,
    foreign key(ma_nv) references Employees(ma_nv)
);
