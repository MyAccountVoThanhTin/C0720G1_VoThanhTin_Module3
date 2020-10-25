drop database if exists case_study;
create database case_study;
use case_study;
drop table if exists NhanVien;
create table NhanVien(
	IDNhanVien int primary key,
    HoTen varchar(255) not null unique,
    NgaySinh date not null,
    SoCMND varchar(45) not null unique,
    Luong varchar(45) ,
    SDT varchar(45) not null,
	Email varchar(45) not null,
    DiaChi varchar(45) not null
);

create table ViTri(
	IDViTri int primary key,
    TenViTri varchar(45) not null
);

create table TrinhDo(
	IDTrinhDo int primary key,
    TrinhDo varchar(45) not null
);

create table BoPhan(
	IDBoPhan int primary key,
    TenBoPhan varchar(45) not null
);

create table KhachHang(
	IDKhachHang int primary key,
    HoTen varchar(45) not null,
    NgaySinh date not null,
    SoCMND varchar(45) not null unique,
    SDT varchar(45) not null,
    Email varchar(45) not null,
    DiaChi varchar(45) not null
);

create table LoaiKhach(
	IDLoaiKhach int primary key,
    TenLoaiKhach varchar(45)  not null
);

create table HopDong(
	IDHopDong int primary key,
    NgayLamHopDong date not null unique,
    NgayKetThuc date not null,
    TienDatCoc int,
    TongTien int not null
);

create table DichVu(
	IDDichVu int primary key,
    TenDichVu varchar(45) not null,
    DienTich int,
    SoTang int,
    SoNguoiToiDa int not null,
    ChiPhiThue varchar(45) not null,
    TrangThai varchar(45)  not null
);

create table KieuThue(
	IDKieuThue int primary key,
    TenKieuThue varchar(45)  not null,
    Gia int 
);

create table LoaiDichVu(
	IDLoaiDichVu int primary key,
    TenLoaiDichVu varchar(45) not null
);
create table DichVuDiKem(
	IDDichVUDiKem int primary key,
    TenDichVuDiKem varchar(45) not null,
    Gia int,
    DonVi int,
    TrangThaiKhaDung varchar(45) not null 
);

create table HopDongChiTiet(
	IDHopDongChiTiet int primary key,
    SoLuong int not null
);

alter table NhanVien add column IDViTri int after HoTen;
alter table NhanVien add foreign key(IDViTri) references ViTri(IDVITri);
alter table NhanVien add column IDTrinhDo int after IDViTri;
alter table NhanVien add foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo);
alter table NhanVien add column IDBoPhan int after IDTrinhDo;
alter table NhanVien add foreign key(IDBoPhan) references BoPhan(IDBoPhan);
alter table DichVu add column IDKieuThue int after ChiPhiThue;
alter table DichVu add foreign key(IDKieuThue) references KieuThue(IDKieuThue);
alter table DichVu add column IDLoaiDichVu int after IDKieuThue;
alter table DichVu add foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu);
alter table KhachHang add column IDLoaiKhach int after IDKhachHang;
alter table KhachHang add foreign key(IDLoaiKhach) references LoaiKhach(IDLoaiKhach);
alter table HopDong add column IDNhanVien int after IDHopDong;
alter table HopDong add foreign key(IDNhanVien) references NhanVien(IDNhanVien);
alter table HopDong add column IDKhachHang int after IDNhanVien;
alter table HopDong add foreign key(IDKhachHang) references KhachHang(IDKhachHang);
alter table HopDong add column IDDichVu int after IDKhachHang;
alter table HopDong add foreign key(IDDichVu) references DichVu(IDDichVu);
alter table HopDongChiTiet add column IDHopDong int after IDHopDongChiTiet;
alter table HopDongChiTiet add foreign key(IDHopDong) references HopDong(IDHopDong);
alter table HopDongChiTiet add column IDDichVuDIKem int after IDHopDong;
alter table HopDongChiTiet add foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem);

