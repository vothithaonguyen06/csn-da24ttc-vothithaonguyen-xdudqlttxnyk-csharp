# Xây dựng ứng dụng quản lý Trung tâm xét nghiệm y khoa

## 1. Giới thiệu đề tài

Đề tài xây dựng ứng dụng Web mô phỏng quy trình quản lý cơ bản của một trung tâm xét nghiệm y khoa. Hệ thống hỗ trợ quản lý thông tin bệnh nhân, loại xét nghiệm, phiếu xét nghiệm, mẫu xét nghiệm, kết quả xét nghiệm và thanh toán.

Ứng dụng được thực hiện nhằm phục vụ mục đích học tập trong khuôn khổ đồ án cơ sở ngành. Toàn bộ dữ liệu bệnh nhân và kết quả xét nghiệm đều là dữ liệu mô phỏng.

## 2. Mục tiêu

- Quản lý thông tin bệnh nhân.
- Quản lý loại xét nghiệm, chỉ số xét nghiệm, đơn vị tính và giá xét nghiệm.
- Tạo phiếu xét nghiệm và quản lý mẫu xét nghiệm.
- Nhập và quản lý kết quả xét nghiệm mô phỏng.
- Hiển thị trạng thái kết quả: Thấp, Bình thường hoặc Cao theo khoảng tham chiếu mô phỏng.
- Quản lý thanh toán và in phiếu kết quả.
- Hỗ trợ tra cứu kết quả bằng mã hoặc QR Code.
- Kiểm thử và hoàn thiện các chức năng chính của hệ thống.

## 3. Công nghệ sử dụng

- **Ngôn ngữ lập trình:** C#/.NET.
- **Cơ sở dữ liệu:** Microsoft SQL Server.
- **Giao diện Web:** HTML, CSS, JavaScript cơ bản.
- **Quản lý mã nguồn:** Git và GitHub.

## 4. Phạm vi dự án

- Xây dựng ứng dụng Web ở mức đồ án cơ sở ngành.
- Sử dụng dữ liệu giả lập, không sử dụng dữ liệu bệnh nhân thật.
- Mô phỏng khoảng 5 nhóm xét nghiệm mẫu.
- Hệ thống có hai nhóm người dùng nội bộ: Quản lý và Nhân viên.
- Bệnh nhân không cần tài khoản, có thể tra cứu kết quả bằng mã hoặc QR Code.
- Không kết nối thiết bị xét nghiệm thực tế và không thực hiện chẩn đoán y khoa.
- QR Code dùng để mở trang Web tra cứu kết quả.

## 5. Tiến độ thực hiện

### Tuần 1: 12/10/2026 – 18/10/2026

**Công việc:**
- Tìm hiểu đề tài và quy trình mô phỏng của trung tâm xét nghiệm.
- Xác định yêu cầu và các chức năng chính của hệ thống.

**Trạng thái:** Đã hoàn thành

### Tuần 2: 19/10/2026 – 25/10/2026

**Công việc:**
- Xây dựng sơ đồ hoạt động.
- Xây dựng sơ đồ thực thể – kết hợp (ERD) và lược đồ quan hệ.

**Trạng thái:** Chưa thực hiện.

### Tuần 3: 26/10/2026 – 01/11/2026

**Công việc:**
- Thiết kế cơ sở dữ liệu trên SQL Server.
- Tạo các bảng, khóa chính, khóa ngoại và các mối quan hệ.
- Chuẩn bị dữ liệu mô phỏng.

**Trạng thái:** Chưa thực hiện.

### Tuần 4: 02/11/2026 – 08/11/2026

**Công việc:**
- Thiết kế giao diện Web cơ bản bằng HTML, CSS và JavaScript.
- Xây dựng giao diện quản lý bệnh nhân, loại xét nghiệm và phiếu xét nghiệm.

**Trạng thái:** Chưa thực hiện.

### Tuần 5: 09/11/2026 – 15/11/2026

**Công việc:**
- Xây dựng chức năng đăng nhập và phân quyền Quản lý/Nhân viên.
- Lập trình chức năng quản lý bệnh nhân, loại xét nghiệm và phiếu xét nghiệm.

**Trạng thái:** Chưa thực hiện.

### Tuần 6: 16/11/2026 – 22/11/2026

**Công việc:**
- Xây dựng chức năng quản lý mẫu xét nghiệm.
- Lập trình chức năng nhập và quản lý kết quả xét nghiệm.
- Hiển thị trạng thái kết quả theo khoảng tham chiếu mô phỏng.

**Trạng thái:** Chưa thực hiện.

### Tuần 7: 23/11/2026 – 29/11/2026

**Công việc:**
- Xây dựng chức năng thanh toán và in phiếu kết quả.
- Xây dựng chức năng tạo QR Code và tra cứu kết quả trên Web.
- Kiểm tra các luồng xử lý chính.

**Trạng thái:** Chưa thực hiện.

### Tuần 8: 30/11/2026 – 06/12/2026

**Công việc:**
- Kiểm thử các chức năng bằng dữ liệu mô phỏng.
- Sửa lỗi và hoàn thiện các chức năng chính của hệ thống.

**Trạng thái:** Chưa thực hiện.

### Giai đoạn hoàn thiện báo cáo: 07/12/2026 – 28/12/2026

**Công việc:**
- Hoàn thiện giao diện và các chức năng còn thiếu.
- Chuẩn bị dữ liệu minh họa.
- Cập nhật README.md theo tiến độ thực tế.
- Hoàn thiện báo cáo và chuẩn bị sản phẩm đồ án.

**Trạng thái:** Chưa thực hiện.

## 6. Hướng dẫn sử dụng

Hướng dẫn cài đặt, cấu hình cơ sở dữ liệu và chạy chương trình sẽ được bổ sung sau khi hoàn thiện ứng dụng.

## 7. Tác giả

- **Sinh viên:** Võ Thị Thảo Nguyên
- **Lớp:** DA24TTC
- **Đề tài:** Xây dựng ứng dụng quản lý Trung tâm xét nghiệm y khoa

