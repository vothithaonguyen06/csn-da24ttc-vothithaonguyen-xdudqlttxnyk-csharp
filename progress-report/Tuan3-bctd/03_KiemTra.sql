/* ============================================================
   03_KiemTra.sql
   Kiểm tra dữ liệu mẫu và các truy vấn nghiệp vụ cơ bản.
   CÁCH CHẠY: bôi đen TỪNG KHỐI (từ dấu "-- ====" đến hết câu lệnh)
   rồi bấm Execute (F5) để chỉ chạy phần đã chọn.
   ============================================================ */
USE QLTTXNYK;
GO

-- ============ 3.1 Đếm số dòng của 10 bảng ============
-- Kết quả mong đợi: TAIKHOAN 3, NHOMXETNGHIEM 5, LOAIXETNGHIEM 7,
-- CHISOXETNGHIEM 9, BENHNHAN 3, PHIEUXETNGHIEM 3, CHITIETPHIEU 5,
-- MAUXETNGHIEM 3, KETQUA 6, THANHTOAN 2
SELECT 'TAIKHOAN' AS Bang, COUNT(*) AS SoDong FROM TAIKHOAN
UNION ALL SELECT 'NHOMXETNGHIEM',   COUNT(*) FROM NHOMXETNGHIEM
UNION ALL SELECT 'LOAIXETNGHIEM',   COUNT(*) FROM LOAIXETNGHIEM
UNION ALL SELECT 'CHISOXETNGHIEM',  COUNT(*) FROM CHISOXETNGHIEM
UNION ALL SELECT 'BENHNHAN',        COUNT(*) FROM BENHNHAN
UNION ALL SELECT 'PHIEUXETNGHIEM',  COUNT(*) FROM PHIEUXETNGHIEM
UNION ALL SELECT 'CHITIETPHIEU',    COUNT(*) FROM CHITIETPHIEU
UNION ALL SELECT 'MAUXETNGHIEM',    COUNT(*) FROM MAUXETNGHIEM
UNION ALL SELECT 'KETQUA',          COUNT(*) FROM KETQUA
UNION ALL SELECT 'THANHTOAN',       COUNT(*) FROM THANHTOAN;

-- ============ 3.2 Tự động xác định Thấp / Bình thường / Cao ============
-- So sánh GIATRI với khoảng tham chiếu mô phỏng của từng chỉ số.
-- Đây chính là logic sẽ viết lại bằng C# ở tuần 6.
UPDATE kq
SET DANHGIA = CASE
                  WHEN kq.GIATRI < cs.GIATRIMIN THEN N'Thấp'
                  WHEN kq.GIATRI > cs.GIATRIMAX THEN N'Cao'
                  ELSE N'Bình thường'
              END
FROM KETQUA kq
JOIN CHISOXETNGHIEM cs ON cs.MACHISO = kq.MACHISO;

-- ============ 3.3 Xem phiếu kết quả đầy đủ (JOIN nhiều bảng) ============
-- LEFT JOIN để phiếu chưa có kết quả (phiếu 3) vẫn hiện ra.
-- Mong đợi: HGB = Thấp, GLU = Cao, các chỉ số còn lại = Bình thường.
SELECT p.MASOPHIEU, bn.HOTEN, lx.TENXN,
       cs.TENCHISO, kq.GIATRI, cs.DONVITINH,
       cs.GIATRIMIN, cs.GIATRIMAX, kq.DANHGIA, p.TRANGTHAI
FROM PHIEUXETNGHIEM p
JOIN BENHNHAN bn            ON bn.MABN   = p.MABN
JOIN CHITIETPHIEU ct        ON ct.MAPHIEU = p.MAPHIEU
JOIN LOAIXETNGHIEM lx       ON lx.MAXN   = ct.MAXN
LEFT JOIN KETQUA kq         ON kq.MACT   = ct.MACT
LEFT JOIN CHISOXETNGHIEM cs ON cs.MACHISO = kq.MACHISO
ORDER BY p.MASOPHIEU, cs.MACHISO;

-- ============ 3.4 Kiểm tra TONGTIEN khớp tổng chi tiết phiếu ============
-- Mong đợi: cột ChenhLech = 0 ở mọi dòng
SELECT p.MASOPHIEU, p.TONGTIEN,
       SUM(ct.DONGIA) AS TongChiTiet,
       p.TONGTIEN - SUM(ct.DONGIA) AS ChenhLech
FROM PHIEUXETNGHIEM p
JOIN CHITIETPHIEU ct ON ct.MAPHIEU = p.MAPHIEU
GROUP BY p.MASOPHIEU, p.TONGTIEN;

-- ============ 3.5 Kiểm tra tính nhất quán chỉ số - xét nghiệm ============
-- Một kết quả chỉ hợp lệ nếu chỉ số thuộc ĐÚNG loại xét nghiệm trong
-- chi tiết phiếu. Mong đợi: 0 dòng. (CSDL chưa tự chặn lỗi này nên
-- khi lập trình C# phải kiểm tra trước khi lưu kết quả.)
SELECT kq.MAKQ, ct.MAXN AS XN_TrongPhieu, cs.MAXN AS XN_CuaChiSo
FROM KETQUA kq
JOIN CHITIETPHIEU ct        ON ct.MACT = kq.MACT
JOIN CHISOXETNGHIEM cs      ON cs.MACHISO = kq.MACHISO
WHERE ct.MAXN <> cs.MAXN;

-- ============ 3.6 Mô phỏng tra cứu bằng mã (sẽ dùng cho QR) ============
-- QR chỉ chứa MATRACUU. Chỉ cho xem khi phiếu đã có/đã trả kết quả.
-- Mong đợi: mã của phiếu 1 -> có kết quả; mã của phiếu 3 -> 0 dòng.
DECLARE @MaTraCuu varchar(100) = 'TC-A1B2C3D4E5';   -- thử đổi thành 'TC-L1M2N3P4Q5'
SELECT p.MASOPHIEU, bn.HOTEN, cs.TENCHISO, kq.GIATRI, cs.DONVITINH, kq.DANHGIA
FROM PHIEUXETNGHIEM p
JOIN BENHNHAN bn       ON bn.MABN    = p.MABN
JOIN CHITIETPHIEU ct   ON ct.MAPHIEU = p.MAPHIEU
JOIN KETQUA kq         ON kq.MACT    = ct.MACT
JOIN CHISOXETNGHIEM cs ON cs.MACHISO = kq.MACHISO
WHERE p.MATRACUU = @MaTraCuu
  AND p.TRANGTHAI IN (N'Đã có kết quả', N'Đã trả kết quả');

-- ============ 3.7 Thống kê doanh thu theo ngày ============
SELECT CAST(NGAYTHANHTOAN AS date) AS Ngay,
       COUNT(*)      AS SoGiaoDich,
       SUM(SOTIEN)   AS DoanhThu
FROM THANHTOAN
GROUP BY CAST(NGAYTHANHTOAN AS date)
ORDER BY Ngay;

-- ============ 3.8 Thử ràng buộc CHECK (CHẠY RIÊNG, PHẢI BÁO LỖI) ============
-- Vai trò 'Khách' không hợp lệ -> SQL Server báo lỗi 547 (CHECK constraint).
-- Chụp màn hình lỗi này để đưa vào báo cáo. Lỗi có thể làm nhảy số MATK,
-- không ảnh hưởng gì.
INSERT INTO TAIKHOAN (TENDANGNHAP, MATKHAUHASH, HOTEN, VAITRO, TRANGTHAI)
VALUES ('test', 'x', N'Thử nghiệm', N'Khách', N'Hoạt động');

-- Thử 1: xóa được (không bảng nào tham chiếu tới dòng thanh toán)
BEGIN TRAN;
DELETE FROM THANHTOAN WHERE MATT = 2;
SELECT COUNT(*) AS SoDongConLai FROM THANHTOAN;   -- còn 1 dòng
ROLLBACK;                                         -- hoàn tác, dữ liệu trở lại như cũ

-- Thử 2: xóa BỊ CHẶN (phiếu 1 còn chi tiết/kết quả -> lỗi 547 do khóa ngoại)
BEGIN TRAN;
DELETE FROM PHIEUXETNGHIEM WHERE MAPHIEU = 1;
ROLLBACK;

SELECT COUNT(*) AS SoThanhToan FROM THANHTOAN;      -- phải ra 2
SELECT COUNT(*) AS SoPhieu     FROM PHIEUXETNGHIEM;  -- phải ra 3
SELECT @@TRANCOUNT AS GiaoDichDangMo;                -- phải ra 0