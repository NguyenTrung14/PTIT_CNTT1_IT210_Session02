# Phân tích Scope và Race Condition

## 1. Vì sao thông báo lỗi đăng nhập phải lưu ở Request Scope?

Thông báo lỗi đăng nhập chỉ cần tồn tại trong đúng một lần request khi người dùng nhập sai tài khoản hoặc mật khẩu.  
Sau khi reload lại trang hoặc gửi request mới, thông báo đó nên biến mất.

Nếu lưu nhầm vào Session Scope thì:
- thông báo lỗi sẽ còn tồn tại qua nhiều request
- người dùng đã đăng nhập đúng vẫn có thể nhìn thấy lỗi cũ
- gây lẫn trạng thái giữa các lần thao tác trong cùng một phiên

Vì vậy, lỗi đăng nhập nên để trong Request Scope bằng `model.addAttribute(...)`.

---

## 2. Vì sao totalViewCount phải lưu ở Application Scope?

`totalViewCount` là bộ đếm dùng chung cho toàn hệ thống, tức là tất cả nhân viên đều nhìn thấy cùng một giá trị.

Application Scope phù hợp vì:
- dữ liệu được chia sẻ cho toàn bộ ứng dụng
- mọi session đều truy cập chung một biến đếm

Nếu lưu vào Session Scope thì:
- mỗi nhân viên có một bản sao riêng
- nhân viên A có thể thấy 2
- nhân viên B có thể thấy 1
- không phản ánh tổng lượt xem toàn hệ thống

---

## 3. Race Condition là gì?

Race Condition là tình huống nhiều request cùng truy cập và cập nhật một biến dùng chung tại cùng thời điểm, làm kết quả cuối cùng bị sai lệch.

Ví dụ:
- count hiện tại là 5
- request A đọc được 5
- request B cũng đọc được 5
- A tăng lên 6 rồi ghi lại
- B cũng tăng lên 6 rồi ghi lại

Kết quả cuối cùng là 6, trong khi đúng ra phải là 7.

---

## 4. Vì sao đoạn code sau có thể gây Race Condition?

```java
Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);