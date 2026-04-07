<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết nhân viên</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .card { border: 1px solid #ccc; border-radius: 8px; padding: 20px; max-width: 700px; }
        .row { margin-bottom: 12px; }
        .label { font-weight: bold; display: inline-block; width: 140px; }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<h2>Chi tiết nhân viên</h2>

<div class="card">
    <div class="row"><span class="label">Mã NV:</span> <c:out value="${employee.code}" /></div>
    <div class="row"><span class="label">Họ tên:</span> <c:out value="${employee.fullName}" /></div>
    <div class="row"><span class="label">Phòng ban:</span> <c:out value="${employee.department}" /></div>

    <div class="row">
        <span class="label">Lương:</span>
        <c:if test="${sessionScope.role == 'hr_manager'}">
            <fmt:formatNumber value="${employee.salary}" type="number" groupingUsed="true" /> VNĐ
        </c:if>
        <c:if test="${sessionScope.role == 'hr_staff'}">
            ***
        </c:if>
    </div>

    <div class="row">
        <span class="label">Ngày vào làm:</span>
        <fmt:formatDate value="${employee.startDate}" pattern="dd/MM/yyyy" />
    </div>

    <div class="row"><span class="label">Trạng thái:</span> <c:out value="${employee.status}" /></div>

    <div class="row" style="margin-top:20px;">
        <a href="<c:url value='/employees' />">Quay lại</a>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>