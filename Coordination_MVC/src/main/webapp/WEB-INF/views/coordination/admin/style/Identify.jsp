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
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->
<meta charset="UTF-8">
<title>관리자 - 이미지 등록 검증Page</title>
</head>
<style>
	img{
		width: 240px;
		height: 240px;
	}
</style>
<body>
<!-- 데이터 파싱 → 다운로드 → 이미지 분석 → DB등록 후 관리자 최종 인증 단계  -->
<div class="container">
<c:if test="${empty StyleListIdentify}">
		<h2>관리자의 승인이 필요한 이미지 정보가 존재하지 않습니다.</h2>
</c:if>


<c:if test="${not empty StyleListIdentify}">
		<h2>이미지를 클릭하면 이미지의 정보를 호출합니다.</h2>
</c:if>
<table>
	<tr>
		<c:forEach items="${StyleListIdentify}" var="style">
			<td>
				<div onClick="location.href='IdentifyUpdateForm'?num=${style.num}">
					<img src="/resources/admin/${style.img}">
				</div>
			</td>
		</c:forEach>
	</tr>
</table>
	

</div>
</body>
</html>