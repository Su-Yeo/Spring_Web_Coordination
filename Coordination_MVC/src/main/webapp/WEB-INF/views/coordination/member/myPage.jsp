<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
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