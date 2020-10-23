drop database if exists thu_vien;
create database thu_vien;
use thu_vien;

create table sach(
	ma_sach int primary key auto_increment,
    ten_sach nvarchar(1000) not null unique,
    nha_xuat_ban nvarchar(1000) not null,
    tac_gia nvarchar(500) not null,
    nam_xuat_ban int(4) not null,
    so_lan_xuat_ban int(100),
    hinh_anh text
);

create table sinh_vien(
	ma_sv int primary key auto_increment,
    ten_sv nvarchar(500) not null unique,
    ngay_sinh date not null,
    dia_chi text,
    email varchar(500) not null unique,
    dien_thoai varchar(10)not null,
    hinh_anh text
);

create table loai_sach(
	ma_loai_sach int primary key auto_increment,
    ten_loai_sach nvarchar(500) not null unique
);
create table sach_phieu(
	id_phieu int,
    id_sach int
);
create table phieu_muon(
	id int primary key auto_increment,
    ten_phieu varchar(100) not null unique,
    so_sach_no int not null default 0
);
drop table if exists phieu_muon_sach;
create table phieu_muon_sach(
	id_phieu_muon int ,
    ten_sach_muon nvarchar(100) not null
);
drop table if exists muon_sach;
create table muon_sach(
	id_muon_sach int primary key,
	ten_sach_muon nvarchar(100) not null,
    ngay_muon date,
    ngay_tra date,
    tinh_trang varchar(50) default 'ok' not null,
	check(ngay_tra >= ngay_muon)
);
alter table sach add column ma_loai_sach int after hinh_anh;
alter table sach add foreign key(ma_loai_sach) references loai_sach(ma_loai_sach);
alter table muon_sach add column id int after tinh_trang;
alter table muon_sach add foreign key(id) references phieu_muon(id);
alter table phieu_muon add column ma_sv int after so_sach_no;
alter table phieu_muon add foreign key(ma_sv) references sinh_vien(ma_sv);
alter table phieu_muon_sach add foreign key(id_phieu_muon) references phieu_muon(id);
alter table phieu_muon_sach add foreign key(id_phieu_muon) references muon_sach(id_muon_sach);
alter table sach_phieu add foreign key(id_phieu) references phieu_muon(id);
alter table sach_phieu add foreign key(id_sach) references sach(ma_sach);