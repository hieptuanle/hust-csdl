USE CSDL_MuaHang;

CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY,
    TenSanPham NVARCHAR(100)
);

CREATE TABLE NhaCungCap (
    MaNhaCungCap INT PRIMARY KEY,
    TenNhaCungCap NVARCHAR(100),
    SoDienThoai NVARCHAR(15),
    SoTaiKhoan NVARCHAR(50),
    NganhNghe NVARCHAR(100)
);

CREATE TABLE PhongBan (
    MaPhongBan INT PRIMARY KEY,
    TenPhongBan NVARCHAR(100),
    MaNhanVienQuanLy INT
);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    GioiTinh NVARCHAR(10),
    ChucVu NVARCHAR(50),
    NgaySinh DATE,
    TenNhanVien NVARCHAR(100),
    MaPhongBan INT,
    FOREIGN KEY (MaPhongBan) REFERENCES PhongBan(MaPhongBan)
);

ALTER TABLE PhongBan
    ADD CONSTRAINT FK_PhongBan_NhanVien
    FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien);

CREATE TABLE HopDong (
    MaHopDong INT PRIMARY KEY,
    TrangThaiHopDong NVARCHAR(50),
    ThoiHanHopDong DATE,
    MaNhaCungCap INT,
    MaNhanVienPhuTrach INT,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap),
    FOREIGN KEY (MaNhanVienPhuTrach) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE DonDatHang (
    MaDonDatHang INT PRIMARY KEY,
    ThoiGianGiaoHangDuKien DATE,
    TongGiaTri DECIMAL(18, 2),
    TrangThaiDonHang NVARCHAR(50),
    GhiChu NVARCHAR(255),
    MaHopDong INT,
    MaNhaCungCap INT,
    MaNhanVienDuyet INT,
    ThoiGianDuyet DATE,
    KetQuaDuyet NVARCHAR(50),
    MaNhanVienPhuTrach INT,
    FOREIGN KEY (MaHopDong) REFERENCES HopDong(MaHopDong),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap),
    FOREIGN KEY (MaNhanVienDuyet) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaNhanVienPhuTrach) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE YeuCauThanhToan (
    MaYeuCau INT PRIMARY KEY,
    TongGiaTri DECIMAL(18, 2),
    PhuongThucThanhToan NVARCHAR(50),
    ThoiHan DATE,
    TrangThaiYeuCau NVARCHAR(50),
    MaDonDatHang INT,
    MaNhanVienDuyetYeuCau INT,
    KetQuaDuyetYeuCau NVARCHAR(50),
    ThoiGianDuyetYeuCau DATETIME,
    FOREIGN KEY (MaDonDatHang) REFERENCES DonDatHang(MaDonDatHang),
    FOREIGN KEY (MaNhanVienDuyetYeuCau) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE NhanVienDuyetHopDong (
    MaNhanVien INT,
    MaHopDong INT,
    KetQuaDuyet NVARCHAR(50),
    ThoiGianDuyet DATETIME,
    PRIMARY KEY (MaNhanVien, MaHopDong),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaHopDong) REFERENCES HopDong(MaHopDong)
);

CREATE TABLE DonDatHangSanPham (
    MaDonDatHang INT,
    MaSanPham INT,
    SoLuongDatHang INT,
    SoLuongThucTe INT,
    ThoiGianGiaoHangThucTe DATE,
    PRIMARY KEY (MaDonDatHang, MaSanPham),
    FOREIGN KEY (MaDonDatHang) REFERENCES DonDatHang(MaDonDatHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE LinkChungTuHopDong (
    MaHopDong INT,
    LinkHopDong NVARCHAR(255),
    PRIMARY KEY (MaHopDong),
    FOREIGN KEY (MaHopDong) REFERENCES HopDong(MaHopDong)
);

CREATE TABLE LinkChungTuThanhToan (
    MaYeuCau INT,
    LinkThanhToan NVARCHAR(255),
    PRIMARY KEY (MaYeuCau),
    FOREIGN KEY (MaYeuCau) REFERENCES YeuCauThanhToan(MaYeuCau)
);
