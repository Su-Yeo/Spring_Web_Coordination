<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Update</title>
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
<div class="container">
	<form action="updateCloset" method="POST">
	<table>
	<c:forEach items="${closetList}" var="closet">
	<input type="hidden" name="num" value="${closet.num}" />
		<tr>
			<td colspan="2" align="center">
				<img src="<%= path %>${closet.img}" />
			</td>
		</tr>
		<tr>
			<td>
				옷의 종류
			</td>
			<td>
				<input type="text" name="category" value="${closet.category}" />
			</td>
		</tr>
		<tr>
			<td>
				옷의 색상
			</td>
			<td>
				<input type="text" name="color" value="${closet.color}" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="이미지 수정하기" />
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="이미지 삭제" onClick="location.href='deleteCloset?num=${closet.num}&img=${closet.img}'" />
			</td>
		</tr>
	</c:forEach>
	</table>
	</form>
</div>
</body>
</html>