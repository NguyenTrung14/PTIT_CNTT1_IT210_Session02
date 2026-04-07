<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .box { width: 420px; margin: 0 auto; border: 1px solid #ccc; padding: 24px; border-radius: 8px; }
        input { width: 100%; padding: 10px; margin: 8px 0 16px; box-sizing: border-box; }
        button { padding: 10px 16px; }
        .error { color: red; margin-bottom: 12px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Đăng nhập hệ thống nhân sự</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>

    <form action="<c:url value='/login' />" method="post">
        <label>Tên đăng nhập</label>
        <input type="text" name="username" required>

        <label>Mật khẩu</label>
        <input type="password" name="password" required>

        <button type="submit">Đăng nhập</button>
    </form>

    <div style="margin-top:16px;color:#555;">
        <div>hr_manager / hr123</div>
        <div>hr_staff / staff456</div>
    </div>
</div>
</body>
</html>