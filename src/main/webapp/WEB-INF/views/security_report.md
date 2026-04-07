# security_report.md

## 1. XSS là gì?

XSS (Cross-Site Scripting) là lỗ hổng cho phép dữ liệu do người dùng nhập vào được trình duyệt hiểu như mã HTML hoặc JavaScript và thực thi trên trang web. Khi dữ liệu hiển thị lại mà không được escape đúng cách, kẻ tấn công có thể chèn script để popup, đánh cắp cookie, giả mạo giao diện hoặc thực hiện hành vi trái phép.

Trong JSTL, `<c:out>` được dùng để xuất dữ liệu và có tác dụng escape các ký tự XML/HTML theo mặc định, giúp ngăn việc chuỗi nhập vào bị trình duyệt diễn giải thành markup. Jakarta Tags specification cũng nêu rõ có thể dùng `<c:out>` để đảm bảo các ký tự XML được escape đúng cách. :contentReference[oaicite:0]{index=0}

### So sánh khi input là:
```html
<script>alert(1)</script>
Nếu hiển thị kiểu không escape:
${keyword}

HTML sinh ra có thể là:

<script>alert(1)</script>

Trình duyệt sẽ hiểu đây là script và thực thi.

Nếu hiển thị bằng:
<c:out value="${keyword}" />

HTML sinh ra sẽ được escape thành dạng text an toàn, ví dụ:

&lt;script&gt;alert(1)&lt;/script&gt;

Khi đó trình duyệt chỉ hiển thị nguyên văn chuỗi, không chạy script. Đây là lý do <c:out> an toàn hơn trong tình huống này.

2. Khác nhau giữa <c:if> và <c:choose>

<c:if> phù hợp khi chỉ cần kiểm tra một điều kiện đơn lẻ: đúng thì hiển thị, sai thì bỏ qua.

<c:choose> / <c:when> / <c:otherwise> phù hợp khi có nhiều nhánh loại trừ nhau, tương tự if / else if / else.

Trong bài này:
Phần Giá vé nên dùng <c:choose> vì có 2 nhánh rõ ràng:
price == 0 → MIỄN PHÍ
còn lại → định dạng số
Phần Vé còn lại cũng nên dùng <c:choose> vì có 3 nhánh loại trừ nhau:
remainingTickets == 0
remainingTickets < 10
còn lại

Dùng <c:choose> sẽ rõ ràng hơn, tránh phải viết nhiều <c:if> rời rạc và giảm nguy cơ nhiều nhánh cùng hiển thị sai logic.

3. <c:url> giải quyết vấn đề gì?

<c:url> tạo URL theo ngữ cảnh ứng dụng thay vì hardcode đường dẫn tuyệt đối. Tài liệu tag c:url mô tả đây là tag dùng để xử lý và tạo URL; nó hỗ trợ giá trị đường dẫn tương đối theo context của ứng dụng.

Ví dụ hardcode:

href="/events/1/book"

Nếu ứng dụng deploy ở root context / thì có thể chạy.

Nhưng nếu ứng dụng được deploy với context path:

/ticketing

thì URL đúng phải là:

/ticketing/events/1/book

Nếu vẫn hardcode href="/events/1/book" thì trình duyệt sẽ gọi sai đường dẫn, dẫn tới 404 hoặc đi nhầm sang ứng dụng khác.

Khi dùng:

<c:url value="/events/${event.id}/book"/>

JSTL sẽ tạo URL phù hợp với context path hiện tại của ứng dụng, nên code portable hơn khi deploy ở các context khác nhau.