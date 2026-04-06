<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Lỗi hệ thống</title></head>
<body style="font-family:Arial; text-align:center; margin-top:50px;">
<h1 style="color:red;">Đã xảy ra lỗi!</h1>
<p style="font-size:18px;"><c:out value="${errorMessage}"/></p>
<a href="<c:url value='/employees'/>">Trở về Trang chủ</a>
</body>
</html>