<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/admin/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/admin/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/admin/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/admin/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/admin/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->
<meta charset="UTF-8">
<title>관리자 - 수정．삭제Page</title>
</head>
<style>
	img{
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
/* 	table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  } */
</style>
<body>
<%
	String path = "C:\\img\\admin\\";
%>

<!-- 수정, 삭제 -->
<div class="container" align="center">
<!-- 데이터베이스에 정보가 없을 경우 -->
<c:if test="${empty StyleList}">
		<h2>관리자의 승인이 완료된 이미지 정보가 존재하지 않습니다.</h2>
</c:if>


<table>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<c:forEach items="${StyleList}" var="style">
	<c:if test="${i%j == 0 }">
		<tr>
	</c:if>
			<td align="center">
				<img src="<%= path %>${style.img}" /> <br/>
				<button class="btn btn-success" onClick="location.href='adminUpdateForm?num=${style.num}'">수정</button>
				&nbsp;
				<button class="btn btn-danger" onClick="location.href='deleteStyle?num=${style.num}&img=${style.img}'">삭제</button>
			</td>
	<c:if test="${i%j == j-1 }">
		</tr>
	</c:if> 
	<c:set var="i" value="${i+1 }" />
	</c:forEach>
</table>
</div>
</body>
</html>