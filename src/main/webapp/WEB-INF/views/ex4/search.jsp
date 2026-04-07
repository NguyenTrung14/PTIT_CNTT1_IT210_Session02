<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm sự kiện</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 32px;
            color: #222;
        }

        h2, h3 {
            margin-bottom: 8px;
        }

        .meta {
            margin-bottom: 20px;
            color: #555;
        }

        .empty-box {
            padding: 14px;
            border: 1px solid #ddd;
            background: #fafafa;
            border-radius: 6px;
            margin-top: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 18px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px 12px;
            text-align: left;
            vertical-align: middle;
        }

        th {
            background: #f3f3f3;
        }

        .badge-free {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            background: #e8f7e8;
            font-weight: bold;
        }

        .sold-out {
            color: #c62828;
            font-weight: bold;
        }

        .low-stock {
            color: #ef6c00;
            font-weight: bold;
        }

        .available {
            color: #2e7d32;
            font-weight: bold;
        }

        .btn-book {
            display: inline-block;
            padding: 6px 10px;
            text-decoration: none;
            border: 1px solid #1976d2;
            border-radius: 4px;
        }

        .btn-disabled {
            display: inline-block;
            padding: 6px 10px;
            border: 1px solid #999;
            border-radius: 4px;
            color: #777;
            background: #f2f2f2;
            cursor: not-allowed;
            pointer-events: none;
        }

        .footer-box {
            margin-top: 22px;
            padding-top: 12px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>

<h2>
    Kết quả tìm kiếm cho:
    <c:out value="${keyword}" />
</h2>

<div class="meta">
    Tìm thấy ${empty events ? 0 : fn:length(events)} sự kiện
</div>

<c:if test="${empty events}">
    <div class="empty-box">
        Không tìm thấy sự kiện nào phù hợp.
    </div>
</c:if>

<c:if test="${not empty events}">
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên sự kiện</th>
            <th>Ngày tổ chức</th>
            <th>Giá vé</th>
            <th>Vé còn lại</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="event" items="${events}" varStatus="status">
            <tr>
                <td>${status.count}</td>

                <td>
                    <c:out value="${event.name}" />
                </td>

                <td>${event.eventDate}</td>

                <td>
                    <c:choose>
                        <c:when test="${event.price == 0}">
                            <span class="badge-free">MIỄN PHÍ</span>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatNumber value="${event.price}" type="number" groupingUsed="true" /> VNĐ
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            <span class="sold-out">HẾT VÉ</span>
                        </c:when>
                        <c:when test="${event.remainingTickets < 10}">
                            <span class="low-stock">
                                Sắp hết (còn ${event.remainingTickets} vé)
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="available">${event.remainingTickets}</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            <span class="btn-disabled">Đặt vé</span>
                        </c:when>
                        <c:otherwise>
                            <a class="btn-book" href="<c:url value='/events/${event.id}/book' />">Đặt vé</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<div class="footer-box">
    <c:if test="${not empty events}">
        <div>
            Tên sự kiện đầu tiên:
            ${fn:toUpperCase(events[0].name)}
        </div>
    </c:if>

    <div>
        Số ký tự của từ khóa tìm kiếm: ${fn:length(keyword)} ký tự
    </div>
</div>

</body>
</html>