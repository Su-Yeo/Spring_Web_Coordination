<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<title>관리자 - 이미지 등록 검증Page</title>
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
	String path = "C:\\img\\admin\\";
%>
<!-- 데이터 파싱 → 다운로드 → 이미지 분석 → DB등록 후 관리자 최종 인증 단계  -->
<div class="container">

<!-- 데이터가 존재하지 않을 경우 -->
<c:if test="${empty StyleListIdentify}">
		<h2>관리자의 승인이 필요한 이미지 정보가 존재하지 않습니다.<br/> 3초 뒤 관리자 메인 페이지로 이동합니다.</h2>
		<meta charset="UTF-8" http-equiv="refresh" content="3;url=<c:url value='adminPage'/>">
</c:if>

<!-- 데이터가 존재할 경우 -->
<c:if test="${not empty StyleListIdentify}">
		<h2>이미지를 클릭하면 이미지의 정보를 호출합니다.</h2>
<table>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<c:forEach items="${StyleListIdentify}" var="style">
	<c:if test="${i%j == 0 }">
		<tr>
	</c:if>
			<td align="center">
				<a href="IdentifyUpdateForm?num=${style.num}">
					<img src="<%= path %>${style.img}" />
				</a>
			</td>
	<c:if test="${i%j == j-1 }">
		</tr>
	</c:if> 
	<c:set var="i" value="${i+1 }" />
	</c:forEach>
</table>
</c:if>

</div>
</body>
</html>