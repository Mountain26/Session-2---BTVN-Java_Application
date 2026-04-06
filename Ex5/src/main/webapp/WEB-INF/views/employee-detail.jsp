<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head><title>Hồ sơ Nhân viên</title></head>
<body style="font-family:Arial;">
<%@ include file="header.jsp" %>
<div style="padding:20px;">
  <h2>Hồ sơ nhân viên: <c:out value="${emp.name}"/></h2>
  <ul>
    <li>Mã NV: <c:out value="${emp.code}"/></li>
    <li>Phòng ban: <c:out value="${emp.department}"/></li>
    <li>Trạng thái: <c:out value="${emp.status}"/></li>
    <li>Mức lương:
      <c:choose>
        <c:when test="${sessionScope.role == 'hr_manager'}">
          <b style="color:green;"><fmt:formatNumber value="${emp.salary}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/></b>
        </c:when>
        <c:otherwise>
          <b>*** (Bạn không có quyền xem)</b>
        </c:otherwise>
      </c:choose>
    </li>
  </ul>
  <a href="<c:url value='/employees'/>">Quay lại danh sách</a>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>