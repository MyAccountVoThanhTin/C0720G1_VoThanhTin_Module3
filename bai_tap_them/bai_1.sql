create database `exercise`;
use exercise; 
create table Product(
	`No` int not null,
    FieldName varchar(50) not null,
    DataType varchar(50) not null,
    DataSize int
);
create table Orders(
	No int not null,
    FieldName varchar(50) not null,
    DataType varchar(50) not null,
    DataSize int
);
SET SQL_SAFE_UPDATES = 0;
INSERT into Product(`No`,FieldName,DataType) VALUES(1,'id','INT');
INSERT into Product VALUES(2,'NAME','NVARCHAR',50),(3,'UmageUrl','NVARCHAR',1000);
INSERT into Product(`No`,FieldName,DataType) VALUES(4,'Price','INT'),(5,'Discount','INT'),(6,'Stock','INT'),(7,'CategoryId','INT'),(8,'SupplierId','INT'),
(9,'Decription','NVARCHAR');
INSERT into Orders(`No`,FieldName,DataType) VALUES(1,'id','INT'),(2,'CreatedDate','DATETIME'),(3,'ShippedDate','DATETIME');
INSERT into Orders VALUES(4,'Status','VARCHAR',50);
INSERT into Orders(`No`,FieldName,DataType) VALUES(5,'Decription','NVARCHAR');
INSERT into Orders VALUES(6,'ShippingAddress','NVARCHAR',500),(7,'ShippingCity','NVARCHAR',50),(8,'PaymentType','VARCHAR',20),(9,'CustomerId','VARCHAR',50),
(10,'EmployeeId','VARCHAR',50);
select * from product;
DELETE From Product where `No` = 1;
DELETE From Product where `No` = 2;
DELETE From Product where `No` = 3;
DELETE From Product where `No` = 4;
DELETE From Product where `No` = 5;
DELETE From Product where `No` = 6;
DELETE From Product where `No` = 7;
DELETE From Product where `No` = 8;
DELETE From Product where `No` = 9;
