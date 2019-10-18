<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="/resources/icon/user/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/user/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/user/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/user/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/user/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<!-- End favicon -->
<meta charset="UTF-8">
<title>myPage</title>
</head>
<style>
	img{
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
</style>
<body>
<%
	String path = "C:\\img\\user\\";
%>

<!-- Nav -->
<jsp:include page="../nav.jsp"></jsp:include>
<!-- End Nav -->


회원 ID : ${sessionScope.userId} <br/>
회원 이름 : ${sessionScope.userName}
<br/><br/>

<div>
------------나만의 옷장------------<br/>
<c:if test="${empty ClosetList}">
	<h2>나만의 옷장이 비어있습니다.</h2>
</c:if>
<c:forEach items="${ClosetList}" var="closet">
	<a href="updateClosetForm?num=${closet.num}">
		<img src="/displayImg?name=${closet.img}&folder=user"/>
	</a>
</c:forEach>
</div>
</body>
</html>