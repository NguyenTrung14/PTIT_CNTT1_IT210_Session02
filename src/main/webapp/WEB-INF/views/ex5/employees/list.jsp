<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhân viên</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #f2f2f2; }
        .badge-green { color: white; background: #2e7d32; padding: 4px 8px; border-radius: 10px; }
        .badge-orange { color: white; background: #ef6c00; padding: 4px 8px; border-radius: 10px; }
        .badge-blue { color: white; background: #1565c0; padding: 4px 8px; border-radius: 10px; }
        .summary { margin-top: 16px; font-weight: bold; }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<h2>Danh sách nhân viên</h2>

<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã NV</th>
        <th>Họ tên</th>
        <th>Phòng ban</th>
        <th>Lương</th>
        <th>Ngày vào làm</th>
        <th>Trạng thái</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${employees}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td><c:out value="${emp.code}" /></td>
            <td><c:out value="${emp.fullName}" /></td>
            <td><c:out value="${emp.department}" /></td>
            <td>
                <fmt:formatNumber value="${emp.salary}" type="number" groupingUsed="true" /> VNĐ
            </td>
            <td>
                <fmt:formatDate value="${emp.startDate}" pattern="dd/MM/yyyy" />
            </td>
            <td>
                <c:if test="${emp.status == 'Đang làm'}">
                    <span class="badge-green"><c:out value="${emp.status}" /></span>
                </c:if>
                <c:if test="${emp.status == 'Nghỉ phép'}">
                    <span class="badge-orange"><c:out value="${emp.status}" /></span>
                </c:if>
                <c:if test="${emp.status == 'Thử việc'}">
                    <span class="badge-blue"><c:out value="${emp.status}" /></span>
                </c:if>
            </td>
            <td>
                <a href="<c:url value='/employees/${emp.code}' />">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="summary">
    Tổng lương phòng ban Kỹ thuật:
    <fmt:formatNumber value="${technicalTotalSalary}" type="number" groupingUsed="true" /> VNĐ
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>