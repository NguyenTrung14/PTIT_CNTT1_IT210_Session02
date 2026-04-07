<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%-- Báo cáo sinh viên --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        th, td { border: 1px solid #ccc; padding: 10px; }
        th { background: #f3f3f3; }
        .good { color: green; font-weight: bold; }
        .avg { color: orange; font-weight: bold; }
        .weak { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <h2>Báo cáo điểm sinh viên</h2>

    <p>
        Người dùng nhập:
        <c:out value="${keyword}" />
    </p>

    <c:if test="${empty students}">
        <p>Không có dữ liệu sinh viên.</p>
    </c:if>

    <c:if test="${not empty students}">
        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã SV</th>
                <th>Họ tên</th>
                <th>Lớp</th>
                <th>Điểm</th>
                <th>Xếp loại</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="student" items="${students}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${student.code}" /></td>
                    <td><c:out value="${student.fullName}" /></td>
                    <td><c:out value="${student.className}" /></td>
                    <td>
                        <fmt:formatNumber value="${student.score}" minFractionDigits="1" maxFractionDigits="1"/>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${student.score >= 8}">
                                <span class="good">Giỏi</span>
                            </c:when>
                            <c:when test="${student.score >= 5}">
                                <span class="avg">Trung bình</span>
                            </c:when>
                            <c:otherwise>
                                <span class="weak">Yếu</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>