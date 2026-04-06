<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
  <title>Đăng nhập hệ thống</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 50px;">

<h2>Đăng nhập Hệ thống Quản lý</h2>

<%-- Hiển thị thông báo lỗi nếu có --%>
<c:if test="${not empty error}">
  <p style="color: red; font-weight: bold;">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/login" method="post">
  <div>
    <label>Tài khoản:</label><br>
    <input type="text" name="username" required>
  </div>
  <br>
  <div>
    <label>Mật khẩu:</label><br>
    <input type="password" name="password" required>
  </div>
  <br>
  <button type="submit">Đăng nhập</button>
</form>

<p><i>Gợi ý test: admin/admin123 hoặc staff/staff123</i></p>

</body>
</html>