Phần 1 — Bảng phân tích ít nhất 5 vấn đề

# Vị trí / thành phần Loại vấn đề Mô tả chi tiết hậu quả

1 <%! private int requestCounter = 0; %> Race Condition / Thread Safety Biến khai báo bằng Declaration trở thành biến cấp instance của servlet JSP, nên nhiều request dùng chung một biến. Khi nhiều người truy cập cùng lúc, giá trị đếm có thể sai, không an toàn luồng, rất dễ gây lỗi logic.
2 <!-- ghi chú nội bộ ... --> Sai loại comment HTML comment vẫn được gửi xuống trình duyệt, người dùng có thể xem source để thấy ghi chú nội bộ. Với ghi chú kỹ thuật trong JSP phải dùng JSP Comment là <%-- --%>.
3 <%= someValue; %> Lỗi cú pháp JSP Expression Trong Expression không được có dấu ; ở cuối. Cú pháp này dễ gây lỗi biên dịch JSP hoặc lỗi cú pháp khi deploy.
4 for (...) { ... }, if (...) { ... } đặt trong <% %> Logic trong View / Vi phạm MVC View chỉ nên hiển thị dữ liệu. Việc dùng scriptlet để lặp, rẽ nhánh làm JSP khó đọc, khó bảo trì, trộn Java với HTML, không đúng tinh thần Spring MVC + JSP + JSTL.
5 <%= student.getName() %> hoặc in dữ liệu người dùng trực tiếp XSS Nếu dữ liệu như tên sinh viên, email, ghi chú do người dùng nhập có chứa mã HTML/JS thì khi in trực tiếp có thể bị chèn script. Nên dùng <c:out> để escape an toàn.
6 Ép kiểu / lấy dữ liệu bằng request.getAttribute(...) trong scriptlet Code smell / Coupling cao Làm JSP phụ thuộc trực tiếp vào API servlet và ép kiểu thủ công, khó bảo trì hơn EL ${}. Nếu attribute null còn dễ phát sinh lỗi logic hoặc hiển thị xấu.
7 Dùng <%= %> hàng loạt thay cho EL Thiết kế chưa tối ưu Vẫn chạy được nhưng làm giao diện khó đọc, không tận dụng được EL/JSTL vốn là cách chuẩn hơn trong JSP hiện đại.
8 Khối if/else Java thuần trong JSP Không dùng JSTL chuẩn JSTL <c:choose>, <c:when>, <c:otherwise> rõ ràng hơn, tách giao diện và điều kiện tốt hơn scriptlet.
