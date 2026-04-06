<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Import thu vien JSTL Core (Jakarta) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <%-- Ghi chú nội bộ: Tiêu đề trang báo cáo --%>
    <title>Báo cáo điểm</title>
</head>
<body>

<%-- Sử dụng EL để hiển thị tiêu đề từ Model --%>
<h1>${reportTitle}</h1>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <%-- Dùng JSTL để lặp thay cho vòng lặp Java --%>
    <c:forEach items="${studentList}" var="sv" varStatus="loop">
        <tr>
            <td style="text-align: center;">${loop.count}</td>
            <td>
                    <%-- Dùng c:out để chống lỗi XSS --%>
                <c:out value="${sv.fullName}" />
            </td>
            <td style="text-align: center;">${sv.score}</td>
            <td>
                    <%-- Chuyển logic if-else sang c:choose --%>
                <c:choose>
                    <c:when test="${sv.score >= 90}">Xuất sắc</c:when>
                    <c:when test="${sv.score >= 80}">Giỏi</c:when>
                    <c:when test="${sv.score >= 70}">Khá</c:when>
                    <c:when test="${sv.score >= 60}">Trung bình khá</c:when>
                    <c:when test="${sv.score >= 50}">Trung bình</c:when>
                    <c:otherwise>Yếu</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>