<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");%> 
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="/resources/icon/user/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/user/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/user/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/user/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/user/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<!-- End favicon -->

<!-- CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/animate.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/signup/css/main.css">
<title>SignUp</title>
<script src="/resources/signup/js/jquery-3.2.1.min.js"></script>
<script src="/resources/signup/js/animsition.min.js"></script>
<script src="/resources/signup/js/popper.js"></script>
<script src="/resources/signup/js/bootstrap.min.js"></script>
<script src="/resources/signup/js/select2.min.js"></script>
<script src="/resources/signup/js/moment.min.js"></script>
<script src="/resources/signup/js/daterangepicker.js"></script>
<script src="/resources/signup/js/countdowntime.js"></script>
<script src="/resources/signup/js/main.js"></script>
</head>
<body>

<div class="limiter">
	<div class="container-login100">
		<div class="login100-more"></div>
	
		<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
			<form id="frm" class="login100-form validate-form" action="insertMember" method="POST" onsubmit="return signUp();">
			<span class="login100-form-title p-b-59">
				Sign UP
			</span>
			
			<!-- ID -->
			<div class="wrap-input100 validate-input" data-validate="Id is required">
				<span class="label-input100">ID</span>
				<input class="input100" type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
				<span class="focus-input100"></span>
			</div>
	
			<!-- PASSWORD -->
			<div class="wrap-input100 validate-input" data-validate="Password is required">
				<span class="label-input100">Password</span>
				<input class="input100" type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
				<span class="focus-input100"></span>
			</div>
	
			<!-- NAME -->
			<div class="wrap-input100 validate-input" data-validate="Name is required">
				<span class="label-input100">Name</span>
				<input class="input100" type="text" name="name" id="name" placeholder="이름을 입력해주세요.">
				<span class="focus-input100"></span>
			</div>
			
			<!-- PHONE -->
			<div class="wrap-input100 validate-input" data-validate="Phone is required">
				<span class="label-input100">Phone</span>
				<input class="input100" type="text" name="phone" id="phone" placeholder="전화번호 '-'를 제외하고 입력해주세요.">
				<span class="focus-input100"></span>
			</div>
	
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn">
					</div>
					<button class="login100-form-btn" style="text-align: center;">
						회원가입
					</button>
				</div>
	
				<a href="/" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
					돌아가기
					<i class="fa fa-long-arrow-right m-l-5"></i>
				</a>
			</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function signUp(){
			
			if(document.getElementById("id").value == '' ||
				document.getElementById("password").value == '' ||
				document.getElementById("name").value == '' ||
				document.getElementById("phone").value == '')
			{
				alert("회원정보를 입력해주세요.!");
				return false;
			}
		}
	</script>
</div>
</body>
</html>