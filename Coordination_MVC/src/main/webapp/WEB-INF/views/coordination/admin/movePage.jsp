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
<!-- Update -->
<c:if test="${url eq 'update'}">
	<meta charset="UTF-8" http-equiv="refresh" content="0;url=<c:url value='adminStyleList'/>">
</c:if>

<!-- Delete -->
<c:if test="${url eq 'delete'}">
	<meta charset="UTF-8" http-equiv="refresh" content="0;url=<c:url value='adminStyleList'/>">
</c:if>

</body>
</html>