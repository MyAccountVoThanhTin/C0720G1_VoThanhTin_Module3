use case_study;
select * from khachhang;
--  2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhanvien where (nhanvien.HoTen like 'T%' or nhanvien.HoTen like 'K%' or nhanvien.HoTen like 'H%') and length(nhanvien.hoten) < 15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang where (year(now()) - (year(khachhang.ngaysinh)) between 18 and 50) and (khachhang.diachi = 'DaNang' or khachhang.diachi = 'QuangTri');
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khachhang.HoTen, count(hopdong.IDHopDong) as so_lan_dat from khachhang inner join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach 
where loaikhach.TenLoaiKhach = 'Diamond'
group by khachhang.IDKhachHang
order by so_lan_dat;
-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khachhang.idkhachhang, khachhang.hoten,loaikhach.TenLoaiKhach,hopdong.idHopDong,dichvu.TenDichVu,hopdong.NgayLamHopDong,hopdong.NgayKetThuc
 from khachhang
 inner join loaikhach on khachhang.idloaikhach = loaikhach.idloaikhach
 inner join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
 inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
 group by hopdong.idhopdong;