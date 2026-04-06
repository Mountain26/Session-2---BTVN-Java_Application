<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Thẻ Sinh Viên Điện Tử</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .card {
            border: 2px solid #0056b3;
            padding: 20px;
            width: 350px;
            border-radius: 10px;
            background-color: #f8fbff;
            box-shadow: 3px 3px 10px rgba(0,0,0,0.1);
        }
        .error-box {
            color: red;
            font-weight: bold;
            border: 1px dashed red;
            padding: 15px;
            display: inline-block;
            background-color: #fff0f0;
        }
        /* CSS màu sắc cho GPA */
        .color-green { color: green; font-weight: bold; }
        .color-blue { color: blue; font-weight: bold; }
        .color-orange { color: orange; font-weight: bold; }
        .color-red { color: red; font-weight: bold; }
    </style>
</head>
<body>

<h2>Hệ thống Tra cứu Thẻ Sinh viên PTIT</h2>

<c:choose>
    <%-- TRƯỜNG HỢP 1: BÁO LỖI (Mã sai hoặc để trống) --%>
    <c:when test="${not empty errorMessage}">
        <div class="error-box">
            <c:out value="${errorMessage}"/>
        </div>
    </c:when>

    <%-- TRƯỜNG HỢP 2: HIỂN THỊ THẺ SINH VIÊN --%>
    <c:otherwise>
        <div class="card">
            <h3 style="text-align: center; margin-top: 0; color: #0056b3;">THẺ SINH VIÊN</h3>
            <hr>
            <p><strong>Mã SV:</strong> <c:out value="${msv}"/></p>
            <p><strong>Họ và tên:</strong> <c:out value="${studentName}"/></p>
            <p><strong>Khoa:</strong> <c:out value="${faculty}"/></p>
            <p><strong>Năm học:</strong> <c:out value="${year}"/></p>
            <p><strong>Điểm trung bình:</strong> <c:out value="${gpa}"/></p>

            <p><strong>Xếp loại:</strong>
                    <%-- Xử lý màu sắc xếp loại học lực --%>
                <c:choose>
                    <c:when test="${gpa >= 8.0}">
                        <span class="color-green">Giỏi</span>
                    </c:when>
                    <c:when test="${gpa >= 6.5}">
                        <span class="color-blue">Khá</span>
                    </c:when>
                    <c:when test="${gpa >= 5.0}">
                        <span class="color-orange">Trung bình</span>
                    </c:when>
                    <c:otherwise>
                        <span class="color-red">Cảnh báo học vụ</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </c:otherwise>
</c:choose>

<br><br>
<%-- Nút điều hướng --%>
<a href="${pageContext.request.contextPath}/student-card" style="text-decoration: none; padding: 8px 15px; background: #007bff; color: white; border-radius: 5px;">Tra cứu sinh viên khác</a>

</body>
</html>