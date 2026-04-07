<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #999;
            padding: 10px;
            text-align: left;
        }
        th {
            background: #f2f2f2;
        }
        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .footer {
            margin-top: 20px;
            font-weight: bold;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="top">
    <div>
        <h2>Xin chào, ${sessionScope.loggedUser}! Vai trò: ${sessionScope.role}</h2>
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
    </div>
</div>

<table>
    <thead>
    <tr>
        <th>Mã đơn</th>
        <th>Tên sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.orderCode}</td>
            <td>${order.productName}</td>
            <td>
                <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/> VNĐ
            </td>
            <td>
                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="footer">
    Tổng lượt xem đơn hàng toàn hệ thống: ${totalViewCount}
</div>
</body>
</html>