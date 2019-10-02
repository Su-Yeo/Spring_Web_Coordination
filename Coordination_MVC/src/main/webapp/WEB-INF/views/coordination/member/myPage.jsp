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
<body>
회원 ID : ${sessionScope.userId} <br/>
회원 이름 : ${sessionScope.userName}
<br/><br/>

<div>
------------나만의 옷장------------<br/>
<c:if test="${empty ClosetList}">
	<h2>나만의 옷장이 비어있습니다.</h2>
</c:if>
<c:forEach items="${ClosetList}" var="closet">
	<img src="/resources/closet/${closet.img}" />
</c:forEach>
</div>
</body>
</html>