/* ============================================================
   01_RangBuoc.sql
   Bổ sung ràng buộc CHECK / DEFAULT / UNIQUE cho CSDL QLTTXNYK
   Chạy 1 LẦN, SAU khi đã tạo xong các bảng từ file QLTTXNYK.sql
   (chạy lần 2 sẽ báo lỗi "already exists" - đó là bình thường)
   ============================================================ */
USE QLTTXNYK;
GO

-- Vai trò chỉ gồm 2 nhóm theo đề cương
ALTER TABLE TAIKHOAN ADD CONSTRAINT CK_TAIKHOAN_VAITRO
    CHECK (VAITRO IN (N'Quản lý', N'Nhân viên'));

-- Khoảng tham chiếu hợp lệ: min <= max
ALTER TABLE CHISOXETNGHIEM ADD CONSTRAINT CK_CHISO_KHOANG
    CHECK (GIATRIMIN <= GIATRIMAX);

-- Trạng thái phiếu đúng 5 bước trong đề cương
ALTER TABLE PHIEUXETNGHIEM ADD CONSTRAINT CK_PHIEU_TRANGTHAI
    CHECK (TRANGTHAI IN (N'Đã tiếp nhận', N'Đã lấy mẫu', N'Đang xét nghiệm',
                         N'Đã có kết quả', N'Đã trả kết quả'));

-- Mặc định khi tạo phiếu mới
ALTER TABLE PHIEUXETNGHIEM ADD CONSTRAINT DF_PHIEU_NGAYTAO
    DEFAULT GETDATE() FOR NGAYTAO;
ALTER TABLE PHIEUXETNGHIEM ADD CONSTRAINT DF_PHIEU_TRANGTHAI
    DEFAULT N'Đã tiếp nhận' FOR TRANGTHAI;
ALTER TABLE PHIEUXETNGHIEM ADD CONSTRAINT DF_PHIEU_TTTHANHTOAN
    DEFAULT N'Chưa thanh toán' FOR TRANGTHAITHANHTOAN;

-- Mỗi chỉ số chỉ có 1 kết quả cho mỗi dòng chi tiết phiếu
ALTER TABLE KETQUA ADD CONSTRAINT UQ_KETQUA_CT_CHISO
    UNIQUE (MACT, MACHISO);
GO
USE QLTTXNYK;
-- Các cột bắt buộc phải có giá trị
ALTER TABLE BENHNHAN       ALTER COLUMN HOTEN       nvarchar(100) NOT NULL;
ALTER TABLE TAIKHOAN       ALTER COLUMN MATKHAUHASH varchar(225)  NOT NULL;
ALTER TABLE TAIKHOAN       ALTER COLUMN VAITRO      nvarchar(30)  NOT NULL;
ALTER TABLE LOAIXETNGHIEM  ALTER COLUMN TENXN       nvarchar(100) NOT NULL;
ALTER TABLE LOAIXETNGHIEM  ALTER COLUMN GIA         decimal(12)   NOT NULL;
ALTER TABLE CHISOXETNGHIEM ALTER COLUMN GIATRIMIN   decimal(10,2) NOT NULL;
ALTER TABLE CHISOXETNGHIEM ALTER COLUMN GIATRIMAX   decimal(10,2) NOT NULL;