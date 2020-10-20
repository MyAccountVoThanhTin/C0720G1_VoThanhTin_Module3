drop database if exists  `create_primary_key`;
create database `create_primary_key`;
use create_primary_key;
create table users(
	users_id int auto_increment primary key,
    usersname varchar(255),
    password varchar(255),
    email varchar(255)
);
 create table roles(
	role_id int auto_increment,
    role_name varchar(255),
    constraint role_id_pk primary key(role_id)
 );
 
 -- khóa chính tổ hợp
 create table usersroles(
	user_id int not null,
    role_id int not null,
	constraint pk primary key(users_id,role_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(role_id) REFERENCES roles(role_id)
 );
 
 -- tạo khóa chính khi thay đổi bảng
 -- alter table usersroles add primary key(user_id);
 select * from users;

 