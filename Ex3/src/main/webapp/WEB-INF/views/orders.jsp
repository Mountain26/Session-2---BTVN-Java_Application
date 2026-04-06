<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>
<head>
    <title>Danh sách Đơn hàng</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 30px;">

<div style="background-color: #f4f4f4; padding: 10px; margin-bottom: 20px;">
    <h2>Xin chào, <c:out value="${sessionScope.loggedUser}"/>!</h2>
    <p>
        Vai trò: <strong>${sessionScope.role}</strong> |
        <a href="${pageContext.request.contextPath}/logout" style="color: red;">Đăng xuất</a>
    </p>
</div>

<h3>Danh sách đơn hàng của bạn:</h3>
<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
    <thead style="background-color: #007bff; color: white;">
    <tr>
        <th>Mã ĐH</th>
        <th>Tên sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.orders}" var="o">
        <tr>
            <td>${o.id}</td>
            <td><c:out value="${o.productName}" /></td>
            <td>
                <fmt:formatNumber value="${o.totalPrice}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0" />
            </td>
            <td>
                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm" />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br><hr><br>

<div style="text-align: center; font-size: 18px; color: #555;">
    Tổng lượt xem đơn hàng toàn hệ thống:
    <b style="color: green; font-size: 24px;">${applicationScope.totalViewCount}</b> lượt.
</div>

</body>
</html>