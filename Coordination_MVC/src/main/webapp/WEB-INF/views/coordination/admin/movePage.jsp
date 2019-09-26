<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovePage</title>
</head>
<body>
<!-- Update가 완료되면 adminStyleList를 호출 -->
<c:if test="${url eq 'update'}">
	<meta charset="UTF-8" http-equiv="refresh" content="0;url=<c:url value='adminStyleList'/>">
</c:if>
<!-- 추후 늘어날 예정 -->

</body>
</html>