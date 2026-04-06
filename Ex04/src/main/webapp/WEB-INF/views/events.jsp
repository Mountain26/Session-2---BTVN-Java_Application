<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Tìm kiếm sự kiện</title>
</head>
<body style="font-family: Arial, sans-serif; padding: 30px;">

<%-- Form tìm kiếm --%>
<form action="${pageContext.request.contextPath}/events/search" method="get">
    <input type="text" name="keyword" value="<c:out value='${keyword}'/>" placeholder="Nhập tên sự kiện...">
    <button type="submit">Tìm kiếm</button>
</form>

<%-- Header kết quả dùng c:out chống XSS --%>
<h2>Kết quả tìm kiếm cho: <span style="color: blue;"><c:out value="${keyword}" default=""/></span></h2>
<p>Tìm thấy <strong>${fn:length(events)}</strong> sự kiện.</p>

<%-- Xử lý nếu list rỗng --%>
<c:if test="${empty events}">
    <p style="color: red; font-style: italic;">Không tìm thấy sự kiện nào phù hợp.</p>
</c:if>

<%-- Bảng kết quả nếu có data --%>
<c:if test="${not empty events}">
    <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
        <thead style="background-color: #f2f2f2;">
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
        <c:forEach items="${events}" var="event" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.count}</td>

                    <%-- Chống XSS bằng c:out --%>
                <td><strong><c:out value="${event.name}" /></strong></td>

                <td>${event.date}</td>

                    <%-- Xử lý Giá vé bằng c:choose --%>
                <td>
                    <c:choose>
                        <c:when test="${event.price == 0}">
                            <span style="color: white; background-color: green; padding: 3px 6px;">MIỄN PHÍ</span>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatNumber value="${event.price}" pattern="#,##0" /> VNĐ
                        </c:otherwise>
                    </c:choose>
                </td>

                    <%-- Xử lý Vé còn lại bằng c:choose --%>
                <td>
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            <strong style="color: red;">HẾT VÉ</strong>
                        </c:when>
                        <c:when test="${event.remainingTickets < 10}">
                            <span style="color: orange; font-weight: bold;">Sắp hết (còn ${event.remainingTickets} vé)</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: green;">${event.remainingTickets}</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                    <%-- Thao tác đặt vé: dùng c:url và kiểm tra trạng thái vé --%>
                <td style="text-align: center;">
                    <c:url value="/events/${event.id}/book" var="bookUrl" />
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            <button disabled style="background-color: #ccc; cursor: not-allowed;">Đặt vé</button>
                        </c:when>
                        <c:otherwise>
                            <a href="${bookUrl}" style="padding: 3px 10px; background-color: #007bff; color: white; text-decoration: none;">Đặt vé</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<hr>

<%-- Footer dùng JSTL Functions (fn) --%>
<div style="background-color: #f9f9f9; padding: 15px;">
    <c:if test="${not empty events}">
        <p><strong>Sự kiện nổi bật nhất (Top 1):</strong> <c:out value="${fn:toUpperCase(events[0].name)}" /></p>
    </c:if>
    <p><em>Độ dài từ khóa tìm kiếm: <strong>${fn:length(keyword)}</strong> ký tự.</em></p>
</div>

</body>
</html>