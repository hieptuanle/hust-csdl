USE CSDL_MuaHang;
-- Add the new columns to the DonDatHang table
ALTER TABLE DonDatHang
ADD
    MaNhanVienDuyet INT,
    ThoiGianDuyet DATE,
    KetQuaDuyet NVARCHAR(50);

-- Add the foreign key constraint for MaNhanVienDuyet
ALTER TABLE DonDatHang
ADD CONSTRAINT FK_DonDatHang_MaNhanVienDuyet FOREIGN KEY (MaNhanVienDuyet)
REFERENCES NhanVien(MaNhanVien);

