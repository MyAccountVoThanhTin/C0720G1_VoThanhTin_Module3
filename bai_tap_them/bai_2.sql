drop database if exists bt_2;
create database bt_2;
use bt_2;
drop table if exists Categories;
create table Categories(
	Id int primary key auto_increment,
	Name_Cate nvarchar(50) not null unique,
    Decription nvarchar(500)
);
drop table if exists Suppliers;
create table Suppliers(
	Id int primary key auto_increment,
    Name_Sup nvarchar(50) not null,
    Email varchar(50) not null unique,
    PhoneNummber varchar(50),
    Address nvarchar(500) not null
);

create table Customers(
	Id varchar(50) primary key,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    PhoneNumber varchar(50),
    Address nvarchar(500) not null,
    Email varchar(50) not null unique,
    Birthday date
);

create table Employees(
	Id varchar(50) primary key,
	FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
	PhoneNumber varchar(50),
	Address nvarchar(500) not null,
    Email varchar(50) not null unique,
    Birthday date
);

create table Products(
	Id int primary key auto_increment,
    Name_Prod nvarchar(50) not null,
    UmageUrl nvarchar(1000) not  null,
    Price int not null default 0 Check (Price >=0),
    Discount int not null default 0 check(Discount between 0 and 100),
    Stock int default 0 not null,
    Decription nvarchar(4000) not null,
	CategoryId int,
    foreign key(CategoryId) references Categories(Id),
    SupplierId int,
    foreign key(SupplierId) references  Suppliers(Id)
);
drop table Orders;
create table Orders(
	Id int primary key auto_increment,
    CreateDate datetime not null default CURRENT_TIMESTAMP,
    ShippedDate datetime not null,
	Status_ord varchar(50) not null default 'WAITING',
    Decription nvarchar(4000),
    ShippingAddress nvarchar(500) not null,
    ShippingCity nvarchar(50) not null,
    PaymentType varchar(20) not null default'CASH',
	check(PaymentType = 'CREDIT CARD' or PaymentType = 'CASH'),
	constraint stt check (Status_ord = 'WAITING' or Status_ord = 'COMPLETED' or Status_ord = 'CANCELED'),
	check(ShippedDate >= CreateDate),
	CustomerId varchar(50),
	foreign key(CustomerId)references Customers(Id),
	EmployeesId varchar(50),
	foreign key(EmployeesId) references Employees(Id)
);

create table OrdersDetails(
	Id int primary key auto_increment,
    OrderId int not null,
    foreign key(OrderId) references Orders(Id),
    ProductId int,
    foreign key(ProductId) references Products(Id),
    Quantity int not null
);