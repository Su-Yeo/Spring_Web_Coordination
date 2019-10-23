<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/admin/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/admin/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/admin/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/admin/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/admin/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/admin/main.css">
<meta charset="UTF-8">
<title>관리자 - MainPage</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	.btnStyle{
		width: 200px;
		height: 200px;
	}
	.fontStyle{
		font-size: 20px;
		color: white;
		font-weight: bold;
		text-align: center;
	}
</style>
<body>

<div>
	<div class="item button-jittery" style="background: #f1c40f; width: 300px; height: 300px; text-align: center;
	padding-top: 50px; border-radius: 10px; display: inline-block;">
		<button class="btnStyle" onClick="location.href='adminParsingList'">
			<p class="fontStyle">관리자<br>데이터 등록</p>
		</button>
	</div>
	
	<div class="item button-jittery" style="background: #e67e22; width: 300px; height: 300px; text-align: center;
	padding-top: 50px; border-radius: 10px; display: inline-block;">
		<button class="btnStyle" onClick="location.href='adminIdentify'">
			<p class="fontStyle">관리자<br>파싱 데이터 <br>검증</p>
		</button>
	</div>
	
	<div class="item button-jittery" style="background: #9b59b6; width: 300px; height: 300px; text-align: center;
	padding-top: 50px; border-radius: 10px; display: inline-block;">
		<button class="btnStyle" onClick="location.href='adminStyleList'">
			<p class="fontStyle">관리자<br>데이터<br>수정/삭제</p>
		</button>
	</div>
</div> 
 
</body>
</html>