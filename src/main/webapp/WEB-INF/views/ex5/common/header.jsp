<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div style="background:#f4f4f4;padding:12px 16px;margin-bottom:20px;border-bottom:1px solid #ddd;">
    <div style="display:flex;justify-content:space-between;align-items:center;">
        <div>
            <a href="<c:url value='/employees' />">Danh sách nhân viên</a>

            <c:if test="${sessionScope.role == 'hr_manager'}">
                <span style="margin-left:12px;color:#2e7d32;font-weight:bold;">Manager Menu</span>
            </c:if>

            <c:if test="${sessionScope.role == 'hr_staff'}">
                <span style="margin-left:12px;color:#1565c0;font-weight:bold;">Staff Menu</span>
            </c:if>
        </div>

        <div>
            <c:if test="${not empty sessionScope.loggedUser}">
                Xin chào,
                <strong><c:out value="${sessionScope.loggedUser}" /></strong>
                |
                <a href="<c:url value='/logout' />">Đăng xuất</a>
            </c:if>
        </div>
    </div>
</div>