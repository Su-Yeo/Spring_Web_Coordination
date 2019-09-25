<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
table {
    border: 1px solid #444444;
    border-collapse: collapse;
}
	
th, td {
    border: 1px solid #444444;
    padding: 10px;
}
</style>
<body>
<h1>
	Hello world!  
</h1>

<table>
	<tr>
<c:forEach items="${selectStyle}" var="style">
		<td>
			<img src="/main/resources/style/${style.img_name}" width="200">
		</td>
</c:forEach>
	</tr>
</table>

</body>
</html>
