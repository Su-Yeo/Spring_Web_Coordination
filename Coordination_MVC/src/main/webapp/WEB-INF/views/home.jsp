<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<!-- weather select start -->
<div style="width:70%;text-align:center;">
	<div id="div_include3" style="margin-top:20px;text-align:right;">
		<jsp:include page="coordination/weather.jsp" flush="true"></jsp:include>
	</div>
</div>
<!-- weather select end --> 
</body>
</html>
