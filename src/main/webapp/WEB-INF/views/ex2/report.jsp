<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo điểm sinh viên</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #f2f2f2;
        }
        .excellent {
            color: green;
            font-weight: bold;
        }
        .warning {
            color: red;
            font-weight: bold;
        }
        .empty {
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <h1>Báo cáo điểm sinh viên</h1>

    <c:choose>
        <c:when test="${empty students}">
            <p class="empty">Không có dữ liệu sinh viên.</p>
        </c:when>

        <c:otherwise>
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
                    <c:forEach var="student" items="${students}" varStatus="loop">
                        <tr>
                            <td>${loop.count}</td>
                            <td><c:out value="${student.studentCode}" /></td>
                            <td><c:out value="${student.fullName}" /></td>
                            <td><c:out value="${student.className}" /></td>
                            <td><c:out value="${student.score}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${student.score >= 8}">
                                        <span class="excellent">Giỏi</span>
                                    </c:when>
                                    <c:when test="${student.score >= 6.5}">
                                        <span>Khá</span>
                                    </c:when>
                                    <c:when test="${student.score >= 5}">
                                        <span>Trung bình</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="warning">Yếu</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>