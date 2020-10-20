drop database if exists bankingaccount;
create database bankingaccount;
use bankingaccount;
drop table if exists customers;
create table customers(
	cus_number int primary key,
    full_name varchar(100),
    address varchar(255),
    email varchar(255) unique,
    phone bigint(10) unique
);
drop table if exists accounts;
create table accounts(
	account_number int primary key,
    account_type varchar(50) not null,
    date_create date,
    balance double,
    foreign key (account_number) references customers(cus_number)
);
drop table if exists transactions;
create table transactions(
	tran_number int primary key,
    account_number  int,
    date_create date,
    amounts double,
    descriptions varchar(255),
    foreign key (account_number) references accounts(account_number)
);