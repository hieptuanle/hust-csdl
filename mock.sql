USE CSDL_MuaHang;

-- Insert mock data for
INSERT INTO SanPham (MaSanPham, TenSanPham) VALUES
(1, N'Bánh sinh nhật'),
(2, N'Bột mì'),
(3, N'Sữa tươi'),
(4, N'Đường'),
(5, N'Socola'),
(6, N'Bột cacao');


INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, SoDienThoai, SoTaiKhoan, NganhNghe) VALUES
(1, N'Công ty Bánh Kẹo ABC', '0909123456', '123456789', N'Bánh kẹo'),
(2, N'Công ty Sữa XYZ', '0909345678', '987654321', N'Sữa và chế phẩm từ sữa'),
(3, N'Công ty Bột Mì MNO', '0909765432', '123987456', N'Bột mì'),
(4, N'Công ty Đường PQR', '0909123765', '1122334455', N'Nguyên liệu đường'),
(5, N'Công ty Socola LMN', '0909876543', '9988776655', N'Socola');


INSERT INTO PhongBan (MaPhongBan, TenPhongBan, MaNhanVienQuanLy) VALUES
(1, N'Phòng Kế Toán', NULL),
(2, N'Phòng Mua Hàng', NULL),
(3, N'Phòng Quản Lý Sản Phẩm', NULL),
(4, N'Phòng Hành Chính', NULL),
(5, N'Phòng Kinh Doanh', NULL);


INSERT INTO NhanVien (MaNhanVien, GioiTinh, ChucVu, NgaySinh, TenNhanVien, MaPhongBan) VALUES
(1, N'Nam', N'Kế Toán Trưởng', '1985-07-15', N'Trần Văn A', 1),
(2, N'Nữ', N'Quản Lý Mua Hàng', '1990-03-22', N'Nguyễn Thị B', 2),
(3, N'Nam', N'Chuyên Viên Sản Phẩm', '1992-06-18', N'Lê Văn C', 3),
(4, N'Nữ', N'Nhân Viên Hành Chính', '1995-01-05', N'Phạm Thị D', 4),
(5, N'Nam', N'Nhân Viên Kinh Doanh', '1993-08-19', N'Hoàng Văn E', 5);


INSERT INTO HopDong (MaHopDong, TrangThaiHopDong, ThoiHanHopDong, MaNhaCungCap, MaNhanVienPhuTrach) VALUES
(1, N'Chờ duyệt', '2024-12-31', 1, 2),
(2, N'Đã duyệt', '2024-11-30', 2, 2),
(3, N'Từ chối', '2024-10-15', 3, 2),
(4, N'Hủy', '2024-09-25', 4, 2),
(5, N'Chờ duyệt', '2024-08-20', 5, 2);


INSERT INTO DonDatHang (MaDonDatHang, ThoiGianGiaoHangDuKien, TongGiaTri, TrangThaiDonHang, GhiChu, MaHopDong, MaNhaCungCap, MaNhanVienDuyet, ThoiGianDuyet, KetQuaDuyet) VALUES
(1, '2024-09-30', 5000000, N'Chờ duyệt', N'Đơn hàng bánh sinh nhật', 1, 1, 1, '2024-09-20', N'Chờ duyệt'),
(2, '2024-10-10', 7500000, N'Đã duyệt', N'Nguyên liệu sữa', 2, 2, 2, '2024-09-15', N'Đã duyệt'),
(3, '2024-10-05', 4500000, N'Đã đặt hàng', N'Nguyên liệu bột mì', 3, 3, 3, '2024-09-18', N'Từ chối'),
(4, '2024-09-25', 12000000, N'Chờ thanh toán', N'Nguyên liệu đường', 4, 4, 4, '2024-09-17', N'Chờ duyệt'),
(5, '2024-11-01', 2000000, N'Đã thanh toán', N'Nguyên liệu socola', 5, 5, 5, '2024-09-20', N'Đã duyệt');


INSERT INTO YeuCauThanhToan (MaYeuCau, TongGiaTri, PhuongThucThanhToan, ThoiHan, TrangThaiYeuCau, MaDonDatHang, MaNhanVienDuyetYeuCau, KetQuaDuyetYeuCau, ThoiGianDuyetYeuCau) VALUES
(1, 5000000, N'Trả góp', '2024-10-01', N'Chờ thanh toán', 1, 1, N'Chờ duyệt', '2024-09-20'),
(2, 7500000, N'Trả toàn bộ', '2024-10-05', N'Đã thanh toán', 2, 2, N'Đã duyệt', '2024-09-15'),
(3, 4500000, N'Trả sau', '2024-10-07', N'Chờ duyệt', 3, 3, N'Từ chối', '2024-09-18'),
(4, 12000000, N'Trả toàn bộ', '2024-09-30', N'Chờ thanh toán', 4, 4, N'Chờ duyệt', '2024-09-17'),
(5, 2000000, N'Trả góp', '2024-11-10', N'Đã thanh toán', 5, 5, N'Đã duyệt', '2024-09-20');


INSERT INTO NhanVienDuyetHopDong (MaNhanVien, MaHopDong, KetQuaDuyet, ThoiGianDuyet) VALUES
(1, 1, N'Chờ duyệt', '2024-09-20'),
(2, 2, N'Đã duyệt', '2024-09-15'),
(3, 3, N'Từ chối', '2024-09-18'),
(4, 4, N'Chờ duyệt', '2024-09-17'),
(5, 5, N'Đã duyệt', '2024-09-20');


INSERT INTO DonDatHangSanPham (MaDonDatHang, MaSanPham, SoLuongDatHang, SoLuongThucTe, ThoiGianGiaoHangThucTe) VALUES
(1, 1, 100, 95, '2024-09-28'),
(2, 2, 50, 50, '2024-10-08'),
(3, 3, 75, 70, '2024-10-04'),
(4, 4, 200, 195, '2024-09-22'),
(5, 5, 30, 30, '2024-11-02');


INSERT INTO LinkChungTuHopDong (MaHopDong, LinkHopDong) VALUES
(1, 'http://example.com/hopdong1.pdf'),
(2, 'http://example.com/hopdong2.pdf'),
(3, 'http://example.com/hopdong3.pdf'),
(4, 'http://example.com/hopdong4.pdf'),
(5, 'http://example.com/hopdong5.pdf');


INSERT INTO LinkChungTuThanhToan (MaYeuCau, LinkThanhToan) VALUES
(1, 'http://example.com/thanhtoan1.pdf'),
(2, 'http://example.com/thanhtoan2.pdf'),
(3, 'http://example.com/thanhtoan3.pdf'),
(4, 'http://example.com/thanhtoan4.pdf'),
(5, 'http://example.com/thanhtoan5.pdf');

