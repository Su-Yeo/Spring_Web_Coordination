<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 수정할 Style선택</title>
</head>
<style>
img{
	width: 250px;
	height : 300px;
}
</style>
<body>

<!-- 데이터베이스에 정보가 없을 경우 -->
<c:if test="${empty StyleList}">
		<h2>데이터베이스에 등록된 정보가 없습니다.</h2>
</c:if>

<c:forEach items="${StyleList}" var="style">
	<a href="<c:url value='adminUpdate'/>?num=${style.num}">
		<img src="/resources/admin/${style.img}" />
	</a>
</c:forEach>
</body>
</html>