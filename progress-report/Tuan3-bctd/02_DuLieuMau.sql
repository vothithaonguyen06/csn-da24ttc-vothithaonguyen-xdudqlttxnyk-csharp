/* ============================================================
   02_DuLieuMau.sql
   Dữ liệu MÔ PHỎNG cho CSDL QLTTXNYK (phục vụ học tập)
   - Bệnh nhân, phiếu, kết quả đều là dữ liệu giả lập.
   - Khoảng tham chiếu chỉ mang tính mô phỏng, có thể khác giữa
     các phòng xét nghiệm, KHÔNG dùng để chẩn đoán y khoa.
   Chạy khi các bảng còn TRỐNG (ID identity bắt đầu từ 1).
   Thứ tự INSERT theo khóa ngoại:
   TAIKHOAN > NHOMXETNGHIEM > LOAIXETNGHIEM > CHISOXETNGHIEM >
   BENHNHAN > PHIEUXETNGHIEM > CHITIETPHIEU > MAUXETNGHIEM >
   KETQUA > THANHTOAN
   ============================================================ */
USE QLTTXNYK;
GO

/* ---- (TÙY CHỌN) Xóa sạch dữ liệu cũ để nhập lại từ đầu ----
   Bỏ comment khối này nếu đã lỡ nhập dữ liệu trước đó.
   Xóa theo thứ tự NGƯỢC với thứ tự INSERT.

DELETE FROM THANHTOAN;
DELETE FROM KETQUA;
DELETE FROM MAUXETNGHIEM;
DELETE FROM CHITIETPHIEU;
DELETE FROM PHIEUXETNGHIEM;
DELETE FROM BENHNHAN;
DELETE FROM CHISOXETNGHIEM;
DELETE FROM LOAIXETNGHIEM;
DELETE FROM NHOMXETNGHIEM;
DELETE FROM TAIKHOAN;
DBCC CHECKIDENT ('THANHTOAN', RESEED, 0);
DBCC CHECKIDENT ('KETQUA', RESEED, 0);
DBCC CHECKIDENT ('MAUXETNGHIEM', RESEED, 0);
DBCC CHECKIDENT ('CHITIETPHIEU', RESEED, 0);
DBCC CHECKIDENT ('PHIEUXETNGHIEM', RESEED, 0);
DBCC CHECKIDENT ('BENHNHAN', RESEED, 0);
DBCC CHECKIDENT ('CHISOXETNGHIEM', RESEED, 0);
DBCC CHECKIDENT ('LOAIXETNGHIEM', RESEED, 0);
DBCC CHECKIDENT ('NHOMXETNGHIEM', RESEED, 0);
DBCC CHECKIDENT ('TAIKHOAN', RESEED, 0);
---------------------------------------------------------------- */

/* 1. TAIKHOAN (MATK = 1, 2, 3)
   MATKHAUHASH tạm dùng chuỗi giả; khi làm chức năng đăng nhập
   sẽ băm mật khẩu thật bằng C# (BCrypt/PBKDF2) rồi cập nhật lại. */
INSERT INTO TAIKHOAN (TENDANGNHAP, MATKHAUHASH, HOTEN, VAITRO, TRANGTHAI) VALUES
('admin',     'HASH_GIA_LAP_ADMIN', N'Nguyễn Quản Lý', N'Quản lý',  N'Hoạt động'),
('nhanvien1', 'HASH_GIA_LAP_NV1',   N'Phạm Thu Hà',    N'Nhân viên', N'Hoạt động'),
('nhanvien2', 'HASH_GIA_LAP_NV2',   N'Lê Minh Tuấn',   N'Nhân viên', N'Hoạt động');

/* 2. NHOMXETNGHIEM (MANHOM = 1..5) - 5 nhóm xét nghiệm mẫu */
INSERT INTO NHOMXETNGHIEM (TENNHOM) VALUES
(N'Huyết học'),          -- 1
(N'Đường huyết'),        -- 2
(N'Chức năng gan'),      -- 3
(N'Chức năng thận'),     -- 4
(N'Mỡ máu');             -- 5

/* 3. LOAIXETNGHIEM (MAXN = 1..7) */
INSERT INTO LOAIXETNGHIEM (MANHOM, TENXN, GIA, TRANGTHAI) VALUES
(1, N'Tổng phân tích tế bào máu', 80000, N'Đang áp dụng'),  -- 1
(2, N'Định lượng Glucose',        30000, N'Đang áp dụng'),  -- 2
(3, N'Định lượng ALT (SGPT)',     35000, N'Đang áp dụng'),  -- 3
(3, N'Định lượng AST (SGOT)',     35000, N'Đang áp dụng'),  -- 4
(4, N'Định lượng Creatinine',     35000, N'Đang áp dụng'),  -- 5
(5, N'Cholesterol toàn phần',     40000, N'Đang áp dụng'),  -- 6
(5, N'Triglycerid',               40000, N'Đang áp dụng');  -- 7

/* 4. CHISOXETNGHIEM (MACHISO = 1..9)
   Giá trị min/max là khoảng tham chiếu MÔ PHỎNG (1 khoảng chung) */
INSERT INTO CHISOXETNGHIEM (MAXN, MACODE, TENCHISO, DONVITINH, GIATRIMIN, GIATRIMAX, MOTA) VALUES
(1, 'HGB',  N'Hemoglobin',        N'g/dL',   12.00,  16.00, N'Khoảng tham chiếu mô phỏng'),  -- 1
(1, 'WBC',  N'Số lượng bạch cầu', N'10^9/L',  4.00,  10.00, N'Khoảng tham chiếu mô phỏng'),  -- 2
(1, 'PLT',  N'Số lượng tiểu cầu', N'10^9/L', 150.00, 400.00, N'Khoảng tham chiếu mô phỏng'),  -- 3
(2, 'GLU',  N'Glucose',           N'mmol/L',  3.90,   6.40, N'Khoảng tham chiếu mô phỏng'),  -- 4
(3, 'ALT',  N'ALT (SGPT)',        N'U/L',     0.00,  40.00, N'Khoảng tham chiếu mô phỏng'),  -- 5
(4, 'AST',  N'AST (SGOT)',        N'U/L',     0.00,  40.00, N'Khoảng tham chiếu mô phỏng'),  -- 6
(5, 'CRE',  N'Creatinine',        N'µmol/L', 62.00, 106.00, N'Khoảng tham chiếu mô phỏng'),  -- 7
(6, 'CHOL', N'Cholesterol toàn phần', N'mmol/L', 0.00, 5.20, N'Khoảng tham chiếu mô phỏng'), -- 8
(7, 'TRIG', N'Triglycerid',       N'mmol/L',  0.00,   1.70, N'Khoảng tham chiếu mô phỏng');  -- 9

/* 5. BENHNHAN (MABN = 1..3) - toàn bộ là dữ liệu giả lập
   Dùng định dạng ngày YYYYMMDD để không phụ thuộc cấu hình ngôn ngữ SQL Server */
INSERT INTO BENHNHAN (HOTEN, NGAYSINH, GIOITINH, SODIENTHOAI, DIACHI) VALUES
(N'Nguyễn Văn An',  '19900512', N'Nam', '0900000001', N'Phường 1, Vĩnh Long'),
(N'Trần Thị Bình',  '19850920', N'Nữ',  '0900000002', N'Phường 2, Vĩnh Long'),
(N'Lê Hoàng Cường', '20000115', N'Nam', '0900000003', N'Phường 3, Vĩnh Long');

/* 6. PHIEUXETNGHIEM (MAPHIEU = 1..3)
   MATK_TIEPNHAN: nhân viên tiếp nhận (2 hoặc 3)
   MATRACUU: mã dùng để tra cứu/QR (khi lập trình sẽ sinh ngẫu nhiên, khó đoán) */
INSERT INTO PHIEUXETNGHIEM
 (MATK_TIEPNHAN, MABN, MASOPHIEU, MATRACUU, NGAYTAO, TRANGTHAI, TONGTIEN, TRANGTHAITHANHTOAN) VALUES
(2, 1, 'PXN-20261030-001', 'TC-A1B2C3D4E5', '20261030 08:15:00', N'Đã có kết quả',  110000, N'Đã thanh toán'),
(3, 2, 'PXN-20261031-001', 'TC-F6G7H8J9K0', '20261031 09:00:00', N'Đã trả kết quả',   70000, N'Đã thanh toán'),
(2, 3, 'PXN-20261101-001', 'TC-L1M2N3P4Q5', '20261101 10:30:00', N'Đã tiếp nhận',     30000, N'Chưa thanh toán');

/* 7. CHITIETPHIEU (MACT = 1..5) - DONGIA lấy theo giá lúc tạo phiếu */
INSERT INTO CHITIETPHIEU (MAPHIEU, MAXN, DONGIA) VALUES
(1, 1, 80000),   -- MACT 1: phiếu 1 - Tổng phân tích tế bào máu
(1, 2, 30000),   -- MACT 2: phiếu 1 - Glucose
(2, 3, 35000),   -- MACT 3: phiếu 2 - ALT
(2, 5, 35000),   -- MACT 4: phiếu 2 - Creatinine
(3, 2, 30000);   -- MACT 5: phiếu 3 - Glucose (chưa lấy mẫu, chưa có kết quả)

/* 8. MAUXETNGHIEM (phiếu 3 chưa lấy mẫu nên chưa có dòng) */
INSERT INTO MAUXETNGHIEM (MAPHIEU, MASOMAU, LOAIMAU, NGAYLAYMAU) VALUES
(1, 'M-0001', N'Máu toàn phần (EDTA)', '20261030 08:30:00'),
(1, 'M-0002', N'Huyết thanh',          '20261030 08:30:00'),
(2, 'M-0003', N'Huyết thanh',          '20261031 09:20:00');

/* 9. KETQUA - cố ý để DANHGIA = NULL.
   Cột này sẽ được tính tự động bằng câu UPDATE trong file 03_KiemTra.sql
   (đây cũng là logic Thấp / Bình thường / Cao sẽ viết lại bằng C#).
   Cột: MATK_DUYET, MACHISO, MATK_NHAP, MACT, GIATRI, NGAYNHAP, NGAYDUYET */
INSERT INTO KETQUA (MATK_DUYET, MACHISO, MATK_NHAP, MACT, GIATRI, NGAYNHAP, NGAYDUYET) VALUES
(1, 1, 2, 1,  11.20, '20261030 10:00:00', '20261030 11:00:00'),  -- HGB  (phiếu 1)
(1, 2, 2, 1,   7.50, '20261030 10:00:00', '20261030 11:00:00'),  -- WBC
(1, 3, 2, 1, 260.00, '20261030 10:00:00', '20261030 11:00:00'),  -- PLT
(1, 4, 2, 2,   7.10, '20261030 10:05:00', '20261030 11:00:00'),  -- GLU
(1, 5, 3, 3,  28.00, '20261031 10:30:00', '20261031 11:30:00'),  -- ALT  (phiếu 2)
(1, 7, 3, 4,  85.00, '20261031 10:30:00', '20261031 11:30:00');  -- CRE

/* 10. THANHTOAN - MATK_THUNGAN: tài khoản thu tiền */
INSERT INTO THANHTOAN (MATK_THUNGAN, MAPHIEU, SOTIEN, PHUONGTHUC, NGAYTHANHTOAN) VALUES
(2, 1, 110000, N'Tiền mặt',     '20261030 08:20:00'),
(3, 2,  70000, N'Chuyển khoản', '20261031 09:10:00');
GO
