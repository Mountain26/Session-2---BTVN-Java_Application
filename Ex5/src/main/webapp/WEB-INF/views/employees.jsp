<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head><title>Danh sách Nhân viên</title></head>
<body style="font-family:Arial;">
<%@ include file="header.jsp" %>
<div style="padding:20px;">
    <h2>Danh sách Nhân viên</h2>
    <table border="1" cellpadding="8" style="width:100%; border-collapse:collapse;">
        <tr style="background:#f2f2f2;">
            <th>STT</th><th>Mã NV</th><th>Họ tên</th><th>Phòng ban</th><th>Lương</th><th>Ngày vào làm</th><th>Trạng thái</th><th>Thao tác</th>
        </tr>
        <c:forEach items="${employees}" var="emp" varStatus="status">
            <tr>
                <td align="center">${status.count}</td>
                <td><c:out value="${emp.code}"/></td>
                <td><b><c:out value="${emp.name}"/></b></td>
                <td><c:out value="${emp.department}"/></td>
                <td><fmt:formatNumber value="${emp.salary}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/></td>
                <td><fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy"/></td>
                <td align="center">
                    <c:choose>
                        <c:when test="${emp.status == 'Đang làm'}"><span style="background:green; color:white; padding:3px 8px; border-radius:10px;">${emp.status}</span></c:when>
                        <c:when test="${emp.status == 'Nghỉ phép'}"><span style="background:orange; color:white; padding:3px 8px; border-radius:10px;">${emp.status}</span></c:when>
                        <c:otherwise><span style="background:blue; color:white; padding:3px 8px; border-radius:10px;">${emp.status}</span></c:otherwise>
                    </c:choose>
                </td>
                <td align="center"><a href="<c:url value='/employees/${emp.code}'/>">Xem chi tiết</a></td>
            </tr>
        </c:forEach>
    </table>
    <p style="text-align:right; font-size:18px;">
        Tổng lương phòng Kỹ thuật: <b style="color:red;"><fmt:formatNumber value="${totalTechSalary}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/></b>
    </p>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>