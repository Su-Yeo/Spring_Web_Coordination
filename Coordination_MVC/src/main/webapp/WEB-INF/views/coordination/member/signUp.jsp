<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="icon" type="image/png" href="/resources/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/animate.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/signUp/css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>

<div class="container-fluid">

	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('/resources/signUp/signup.png');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form class="login100-form validate-form" method="post" action="insertMember" id="frm">
					<span class="login100-form-title p-b-59">
						회원가입
					</span>
					<!-- ID -->
					<div class="wrap-input100 validate-input" data-validate="Id is required">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" id="id" name="id" pattern="[A-Za-z0-9]{4,}" maxlength="30" placeholder="아이디를 입력해주세요." autofocust required>
						<span class="focus-input100"></span>
					</div>
					 
					<!-- PASSWORD -->
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">PASSWORD</span>
						<input class="input100" type="password" id="password" name="password" pattern="[A-Za-z0-9]{4,}" maxlength="50" placeholder="비밀번호를 입력해주세요." required>
						<span class="focus-input100"></span>
					</div>
					
					
					<!-- 이름 -->
					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">이름</span>
						<input class="input100" type="text" id="name" name="name" maxlength="30" placeholder="이름을 입력해주세요." required>
						<span class="focus-input100"></span>
					</div>
					
					<!-- 전화번호 -->
					<div class="wrap-input100 validate-input" data-validate="Phone is required">
						<span class="label-input100">전화번호</span>
						<input class="input100" type="text" id="phone" name="phone" pattern="(010)\d{3,4}\d{4}" maxlength="11" placeholder="'-'제외 입력해주세요." required>
						<span class="focus-input100"></span>
					</div>
					
					<!-- 등록하기 -->
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<!-- <button class="login100-form-btn" onclick="document.getElementById('frm').submit();">
								등록하기
							</button> -->
							<input type="submit" class = "login100-form-btn" value="등록하기">
						</div>
						<a href="<c:url value='/'/>" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
							홈으로
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>