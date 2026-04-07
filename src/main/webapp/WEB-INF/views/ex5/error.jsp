<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang lỗi</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .error-box {
            border: 1px solid #f5c2c7;
            background: #f8d7da;
            color: #842029;
            padding: 18px;
            border-radius: 8px;
            max-width: 700px;
        }
    </style>
</head>
<body>

<h2>Đã xảy ra lỗi</h2>

<div class="error-box">
    <c:out value="${errorMessage}" />
</div>

<div style="margin-top:16px;">
    <a href="<c:url value='/employees' />">Quay lại danh sách nhân viên</a>
</div>

</body>
</html>