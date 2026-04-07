Phần 1 — Phân tích logic

1) Lỗi trong MyWebAppInitializer.java

Nếu DispatcherServlet được map là:

"/api/*"

thì nó chỉ nhận các request bắt đầu bằng /api/, ví dụ:

/api/welcome
/api/users
/api/test

Nó không nhận request:

/welcome

nên khi bạn truy cập:

http://localhost:8080/demo/welcome

request đó không đi vào DispatcherServlet, vì servlet này chỉ “nghe” nhóm URL /api/*. Kết quả là Tomcat trả về 404 Not Found do không có servlet nào xử lý URL đó. Đây cũng đúng với triệu chứng đề bài mô tả: ban đầu vào /welcome bị 404.

2) Lỗi trong WebConfig.java

Nếu cấu hình:

@ComponentScan(basePackages = "com.demo.service")

thì Spring chỉ quét bean trong package com.demo.service và các package con của nó.

Trong Spring MVC, @Controller phải nằm trong vùng được @ComponentScan quét thì Spring mới đăng ký nó vào container. Nếu WelcomeController nằm ở package kiểu như:

com.demo.controller

thì với cấu hình trên, Spring sẽ không tìm thấy controller này. Hậu quả là dù bạn có sửa servlet mapping đúng rồi, Spring MVC vẫn không có handler/controller cho /welcome, nên ứng dụng vẫn chưa chạy đúng.

Tóm lại:

Spring đang tìm @Controller trong com.demo.service
Spring không tìm @Controller trong com.demo.controller

3) Nếu chỉ sửa lỗi 1 mà không sửa lỗi 2 thì ứng dụng có chạy không?

Không.

Vì:

sửa lỗi 1 ("/" thay cho "/api/*") chỉ giúp request /welcome đi vào DispatcherServlet
nhưng nếu @ComponentScan vẫn quét sai package, WelcomeController không được tạo bean
lúc đó Spring MVC không có controller để xử lý /welcome

Nghĩa là ứng dụng đi được thêm một bước, nhưng vẫn không hoàn chỉnh. Nó không thể render đúng trang chào mừng.