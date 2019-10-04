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
<title>관리자 - MainPage</title>
</head>
<style>
	button{
		width: 200px;
		height: 120px;
	}
</style>
<body>
<h3>협력 쇼핑몰 : 언더70, 바이슬림, 조군샵, 무신사 스토어</h3>

<div class="container" align="center">
	<button class="btn btn-outline-info" onClick="InsertData();">
		관리자<br>데이터 등록
	</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="btn btn-outline-warning" onClick="IdentifyData();">
		관리자<br>데이터 등록
	</button>	
		&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="btn btn-outline-success" onClick="UpdateData();">
		관리자<br>데이터 수정．삭제
	</button>
</div>
<script>
	function InsertData(){
		
		var password = "";
		
		password = prompt("비밀번호 8자리를 입력해주세요.");
		location.href="<c:url value="adminParsingList"/>?password=" + password;
	}
	
	function IdentifyData(){
		
		var password = "";
		
		password = prompt("비밀번호 8자리를 입력해주세요.");
		location.href="<c:url value="adminIdentify"/>?password=" + password;
	}
	
	function UpdateData(){
		
		var password = "";
		
		password = prompt("비밀번호 8자리를 입력해주세요.");
		location.href="<c:url value="adminStyleList"/>?password=" + password;
	}
</script>
</body>
</html>