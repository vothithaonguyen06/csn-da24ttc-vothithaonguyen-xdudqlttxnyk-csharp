# Báo cáo tiến độ tuần 3

**Thời gian:** 26/10/2026 – 01/11/2026

## 1. Công việc thực hiện

- Rà soát lại sơ đồ thực thể – kết hợp (ERD/CDM) và chuyển đổi sang mô hình dữ liệu vật lý (PDM) bằng PowerDesigner.
- Thiết kế cơ sở dữ liệu trên Microsoft SQL Server cho hệ thống quản lý Trung tâm xét nghiệm y khoa.
- Tạo cơ sở dữ liệu và các bảng chính: người dùng, bệnh nhân, nhóm xét nghiệm, chỉ số xét nghiệm, phiếu xét nghiệm, chi tiết phiếu, mẫu xét nghiệm, kết quả xét nghiệm, thanh toán.
- Xác định khóa chính, khóa ngoại, các ràng buộc (NOT NULL, UNIQUE, CHECK) và quan hệ giữa các bảng.
- Chuẩn bị dữ liệu mô phỏng: danh mục nhóm xét nghiệm, chỉ số xét nghiệm (GLU, HGB, ALT, CRE) kèm đơn vị tính, khoảng tham chiếu mô phỏng và giá xét nghiệm; một số tài khoản Quản lý/Nhân viên và bệnh nhân giả lập.
- Lưu script tạo CSDL và script dữ liệu mẫu vào repository để quản lý phiên bản.
- Cập nhật `README.md` và chuẩn bị báo cáo tiến độ tuần 3.

## 2. Kết quả đạt được

- Hoàn thành cơ sở dữ liệu ban đầu trên SQL Server với đầy đủ bảng, khóa chính, khóa ngoại.
- Đã nhập dữ liệu mô phỏng cho các bảng danh mục và một số dữ liệu bệnh nhân, phiếu xét nghiệm để phục vụ kiểm tra.
- Đã kiểm tra các truy vấn cơ bản (thêm, sửa, xóa, truy vấn có JOIN) hoạt động đúng với dữ liệu mẫu.
- Đã đẩy script CSDL (thư mục `setup`) và các tập tin thiết kế lên GitHub.
- Toàn bộ khoảng tham chiếu được ghi rõ là dữ liệu mô phỏng, không dùng cho chẩn đoán y khoa.

## 3. Khó khăn

- Còn lúng túng khi chuẩn hóa dữ liệu và xác định mối quan hệ giữa phiếu xét nghiệm, chi tiết phiếu, mẫu và kết quả.
- Việc đặt khoảng tham chiếu theo từng chỉ số (có thể khác nhau theo giới tính) cần cân nhắc để cấu trúc bảng vừa đơn giản vừa đủ dùng.

## 4. Kế hoạch tuần tiếp theo

- Thiết kế giao diện Web cơ bản bằng HTML, CSS và JavaScript (có thể phác thảo trước bằng Figma).
- Xây dựng giao diện quản lý bệnh nhân, loại xét nghiệm và phiếu xét nghiệm.
- Kết nối thử giao diện với cơ sở dữ liệu SQL Server thông qua C#/.NET.
