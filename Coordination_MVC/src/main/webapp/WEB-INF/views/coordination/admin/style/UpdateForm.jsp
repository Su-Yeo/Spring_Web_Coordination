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
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>관리자 - 데이터 수정Page</title>
</head>
<style>
img{
	width: 250px;
	height : 300px;
}
</style>
<body>
<div>
<form action="updateStyle" method="POST">
<table>
<c:forEach items="${StyleOne}" var="style">
			<input type="hidden" name="num" value="${style.num}" />
	<tr>
		<td colspan="2" align="center">
			<img src="/resources/admin/${style.img}" />
		</td>
	</tr>		
	<tr>
		<td align="center">
			상의 종류
		</td>
		<td>
			<input type="text" name="top" value="${style.top}" />
		</td>
	</tr>
	<tr>
		<td align="center">
			상의 색상
		</td>
		<td>
			<input type="text" name="top_color" value="${style.top_color}" />
		</td>
	</tr>
	<tr>
		<td align="center">
			하의 종류
		</td>
		<td>
			<input type="text" name="pants" value="${style.pants}" />
		</td>
	</tr>
	<tr>
		<td align="center">
			하의 색상
		</td>
		<td>
			<input type="text" name="pants_color" value="${style.pants_color}" />
		</td>
	</tr>
	<tr>
		<td align="center">
			JPG
		</td>
		<td>
			<input type="text" name="img" value="${style.img}" />
		</td>
	</tr>
<script type="text/javascript">
	function deleteStyle() {
		if(confirm('이미지를 삭제하시겠습니까???'))
		{
			location.href="<c:url value='deleteStyle'/>?num=${style.num}&img=${style.img}";
		}
		else
		{
			
		}
	}
</script>
</c:forEach>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="이미지 수정하기" />
		</td>
	</tr>
</table>
</form>
			<button onClick="deleteStyle();">
				이미지 삭제하기
			</button>
</div>
</body>
</html>