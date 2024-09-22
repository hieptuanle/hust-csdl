SELECT * FROM PhongBan;

SELECT NhanVien.*, PhongBan.TenPhongBan FROM NhanVien
JOIN PhongBan ON NhanVien.MaPhongBan = PhongBan.MaPhongBan;

SELECT
  PhongBan.*,
  NhanVien.TenNhanVien AS TenNhanVienQuanLy,
  NhanVien.ChucVu AS ChucVuQuanLy
FROM PhongBan
LEFT JOIN NhanVien ON PhongBan.MaNhanVienQuanLy = NhanVien.MaNhanVien;


UPDATE PhongBan SET TenPhongBan = N'Phòng Tài Chính' WHERE MaPhongBan = 3;
UPDATE PhongBan SET TenPhongBan = N'Phòng Hành Chính Pháp Lý' WHERE MaPhongBan = 4;



INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, ChucVu, MaPhongBan) VALUES
(6, N'Đinh Công G', '2000-01-01', N'Nam', N'Nhân viên mua hàng', 2);

INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, ChucVu, MaPhongBan) VALUES
(7, N'Nguyễn Văn H', '2000-01-01', N'Nam', N'Giám đốc Pháp lý', 2);


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
JOIN NhanVien ON NhanVienDuyetHopDong.MaNhanVien = NhanVien.MaNhanVien;

SELECT * FROM NhanVienDuyetHopDong;


INSERT INTO CSDL_MuaHang.dbo.NhanVienDuyetHopDong (MaNhanVien,MaHopDong,KetQuaDuyet,ThoiGianDuyet) VALUES
	 (4,1,N'Chờ duyệt', NULL),
	 (4,2,N'Chờ duyệt',NULL),
	 (4,3,N'Chờ duyệt',NULL),
	 (4,4,N'Chờ duyệt',NULL),
	 (4,5,N'Chờ duyệt',NULL);

-- create new column MaNhanVienPhuTrach for table DonDatHang
ALTER TABLE DonDatHang ADD MaNhanVienPhuTrach INT;

-- add foreign key for MaNhanVienPhuTrach in DonDatHang
ALTER TABLE DonDatHang ADD FOREIGN KEY (MaNhanVienPhuTrach) REFERENCES NhanVien(MaNhanVien);

-- update MaNhanVienPhuTrach for DonDatHang
UPDATE DonDatHang SET MaNhanVienPhuTrach = 6;

Update HopDong SET MaNhanVienPhuTrach = 6;

SELECT * FROM DonDatHang;
SELECT * FROM HopDong;
