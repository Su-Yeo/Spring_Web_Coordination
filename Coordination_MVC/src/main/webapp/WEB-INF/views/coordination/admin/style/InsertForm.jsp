<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->

<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>Man & Coordination 관리자</title>
</head>
<body>
<c:set var="msg" value="success" />

<c:choose>
    <c:when test="${msg == 'success'}">
		이미지가 정상적으로 등록되었습니다.
    </c:when>

    <c:when test="${msg == 'fail'}">
		이미지 등록에 실패했습니다.
    </c:when>
</c:choose>

<form method="post" action="tensorflow">
	<input type="text" name="img_name"> <br>
	<input type="submit" value="이미지 등록">
</form>

</body>
</html>