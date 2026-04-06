<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Đăng nhập HR Portal</title></head>
<body style="font-family:Arial; text-align:center; margin-top:50px;">
<h2>Đăng nhập Hệ thống Nhân sự</h2>
<c:if test="${not empty requestScope.errorMessage}">
  <p style="color:red;"><c:out value="${errorMessage}"/></p>
</c:if>
<form action="<c:url value='/login'/>" method="post">
  Tài khoản: <input type="text" name="username"><br><br>
  Mật khẩu: <input type="password" name="password"><br><br>
  <button type="submit">Đăng nhập</button>
</form>

<div >
  <strong>Tài khoản</strong><br>
  - hr_manager / hr123<br>
  - hr_staff / staff456<br>
</div>
</body>
</html>