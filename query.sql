USE CSDL_MuaHang;

-- Liệt kê các phòng ban
SELECT * FROM PhongBan;

-- Liệt kê nhân viên và tên phòng ban của họ
SELECT NhanVien.*, PhongBan.TenPhongBan FROM NhanVien
JOIN PhongBan ON NhanVien.MaPhongBan = PhongBan.MaPhongBan;

-- Cập nhật một nhân viên làm quản lý 1 phòng ban
UPDATE PhongBan SET MaNhanVienQuanLy = 3 WHERE MaPhongBan = 3;

-- Liệt kê các phòng ban và nhân viên quản lý của phòng ban
SELECT
  PhongBan.*,
  NhanVien.TenNhanVien AS TenNhanVienQuanLy,
  NhanVien.ChucVu AS ChucVuQuanLy
FROM PhongBan
LEFT JOIN NhanVien ON PhongBan.MaNhanVienQuanLy = NhanVien.MaNhanVien;

-- Cập nhật tên phòng ban
UPDATE PhongBan SET TenPhongBan = N'Phòng Tài Chính' WHERE MaPhongBan = 3;
UPDATE PhongBan SET TenPhongBan = N'Phòng Hành Chính Pháp Lý' WHERE MaPhongBan = 4;


-- Thêm nhân viên mới
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, ChucVu, MaPhongBan) VALUES
(6, N'Đinh Công G', '2000-01-01', N'Nam', N'Nhân viên mua hàng', 2);


-- Show thông tin hợp đồng và tình trạng duyệt
SELECT
  HopDong.MaHopDong,
  HopDong.TrangThaiHopDong,
  NhanVienDuyetHopDong.KetQuaDuyet,
  NhanVienDuyetHopDong.ThoiGianDuyet,
  NhanVien.MaNhanVien,
  NhanVien.TenNhanVien,
  NhanVien.ChucVu
FROM HopDong
RIGHT JOIN NhanVienDuyetHopDong ON HopDong.MaHopDong = NhanVienDuyetHopDong.MaHopDong
JOIN NhanVien ON NhanVienDuyetHopDong.MaNhanVien = NhanVien.MaNhanVien
ORDER BY MaHopDong ASC;

-- Update trạng thái hợp đồng
UPDATE HopDong SET TrangThaiHopDong = N'Đã duyệt' WHERE MaHopDong = 1;
UPDATE HopDong SET TrangThaiHopDong = N'Từ chối' WHERE MaHopDong = 2;

-- Thêm nhân viên cần duyệt cho 1 hợp đồng
INSERT INTO CSDL_MuaHang.dbo.NhanVienDuyetHopDong (MaNhanVien,MaHopDong,KetQuaDuyet,ThoiGianDuyet) VALUES
	 (2,1,N'Chờ duyệt', NULL),
	 (3,1,N'Chờ duyệt',NULL),
	 (4,1,N'Chờ duyệt',NULL);

-- create new column MaNhanVienPhuTrach for table DonDatHang
ALTER TABLE DonDatHang ADD MaNhanVienPhuTrach INT;

-- add foreign key for MaNhanVienPhuTrach in DonDatHang
ALTER TABLE DonDatHang ADD FOREIGN KEY (MaNhanVienPhuTrach) REFERENCES NhanVien(MaNhanVien);

-- update MaNhanVienPhuTrach for DonDatHang
UPDATE DonDatHang SET MaNhanVienPhuTrach = 6;

-- Tất cả hợp đồng đều do 1 nhân viên mua hàng phụ trách
Update HopDong SET MaNhanVienPhuTrach = 6;
