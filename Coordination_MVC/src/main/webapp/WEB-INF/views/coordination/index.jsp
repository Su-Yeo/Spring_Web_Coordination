<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");%> 
<%@ page session="true" %>   
<!DOCTYPE html>
<html>
<head>

<!-- Script&CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="/resources/js/app.js"></script> -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js" async></script>
<link rel="stylesheet" type="text/css" href="/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jua">

<!-- favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="/resources/icon/user/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/user/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/user/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/user/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/user/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<!-- End favicon -->

<meta charset="UTF-8">
<title>오늘 뭐 입지??</title>
</head>
<style>
        h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
        body,a {font-family: 'Nanum Gothic', sans-serif;}
        
        .menuFont {font-family: 'Nanum Gothic', sans-serif; font-size: 13px;}
        .categoryFont {font-family: 'Jua', sans-serif;}
        .dynamicFont {font-family: 'Permanent Marker', cursive;}
        .optionFont {background-color: darkgrey; color: white; font-size: 11px; font-family: "돋움", sans-serif; padding: 2px;}
        
        .stringHidden {white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
    </style>
<body>
<div class="w3-top">
	<!-- 상단바 왼쪽 메뉴 -->
	<div class="w3-bar w3-white w3-card w3-large" style='padding-left:15px; padding-right:15px;'>
		<div class="w3-dropdown-click w3-left">
			<a onclick="show_category()" class="w3-button">
				<i class="fa fa-bars"></i>
			</a>
			<div class="w3-dropdown-content w3-bar-block w3-card-category w3-border" style="width:250px; padding-bottom:10px; padding-top:10px;" id="category">
				<a class="w3-bar-item w3-button">패션의류/잡화</a>
                <a class="w3-bar-item w3-button">문구/오피스</a>
                
                <div id="myAccFunc">
                	 <a class="w3-bar-item w3-button" id="myBtn">마이페이지</a>
                	 <div id="demoAcc" class="w3-bar-block w3-hide w3-padding w3-medium">
                	 	<c:if test="${empty sessionScope.userId}"> 
                	 		<a onclick="document.getElementById('login_modal').style.display='block'" class="w3-bar-item w3-button">로그인</a>
                	 	</c:if>
                	 	<c:if test="${not empty sessionScope.userId}"> 
                	 		<a href="logout" class="w3-bar-item w3-button">로그아웃</a>
                	 	</c:if>
                	 </div>
                </div>
                
                <div class="w3-hide-large w3-hide-medium w3-small">
                	<p style='margin-left:10px; margin-right:10px;' class="w3-border-bottom w3-border-light-grey"></p>
                    <c:if test="${empty sessionScope.userId}"> 
                    	<a onclick="document.getElementById('login_modal').style.display='block'" class="w3-bar-item w3-button">로그인</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.userId}"> 
                    	<a href="logout" class="w3-bar-item w3-button">로그아웃</a>
                    </c:if>
                    <c:if test="${empty sessionScope.userId}"> 
                    	<a href="signup" class="w3-bar-item w3-button">회원가입</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.userId}"> 
                    	<a href="isMyPage" class="w3-bar-item w3-button">마이페이지</a>
                    </c:if>
               </div>
			</div>
		</div>     
		
		<a href="/" class="w3-wide w3-bar-item" style="text-decoration:none;">
			<b>LOGO</b>
		</a>
		
		<!-- 상단바 오른쪽 메뉴, 사이즈 작아지면 사라짐 -->
		<div class="w3-right w3-hide-small" style="margin-bottom:-1px;">
			<c:if test="${empty sessionScope.userId}">
				<a onclick="document.getElementById('login_modal').style.display='block'" class='w3-button w3-padding-large menuFont'>로그인</a>
			</c:if>
			<c:if test="${not empty sessionScope.userId}">
				<a href='logout' class='w3-button w3-padding-large menuFont' style='text-decoration:none'>로그아웃</a>
			</c:if>
			<c:if test="${empty sessionScope.userId}">
				<a href='signup' class='w3-button w3-padding-large menuFont'>회원가입</a>
			</c:if>
			<c:if test="${not empty sessionScope.userId}">
				<a href='isMyPage' class='w3-button w3-padding-large menuFont'>회원정보</a>
			</c:if>
		</div>
	</div>
</div>
<!-- End 상단바 -->  

<!-- 로그인 모달 -->
<div id="login_modal" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
		<div class="w3-center">  
			<br>
			<span onclick="document.getElementById('login_modal').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">
			×
			</span>
			<h1 class="dynamicFont" style="font-size:50px;">
				<b>오늘 뭐 입지??</b>
			</h1>
		</div>
		
		<form class="w3-container" action="loginCheck" method="post" name="login_form" id="login_form" autocomplete="off">
			<div class="w3-section">
				<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요." name="id" id="id" required>
				<input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요." name="password" id="password" required>
				
				<c:if test="${data eq 'ghost'}">
					<div id="display_error" style="color:red;">탈퇴한 회원입니다.</div>
				</c:if>
				<c:if test="${data eq 'error'}">
					<div id="display_error" style="color:red;">아이디 또는 비밀번호가 틀렸습니다.</div>
				</c:if>
				
				<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">
					로그인
				</button>
			</div>
		</form>
	</div>
</div>
<!-- End 로그인 모달 -->


<script>
	// 카테고리 항목 → 하위 항목 호버효과로 펼쳐 줌
	$('#myAccFunc').hover(function() {
		var menu_select_icon = document.createElement("i");
        menu_select_icon.className = "w3-margin-left fa fa-caret-down";
        
        var x = document.getElementById("demoAcc");
        var y = document.getElementById("myBtn");
        
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            y.append(menu_select_icon);
        } else {
            x.className = x.className.replace(" w3-show", "");
            $('i.fa-caret-down').remove();
        }
	});
	
	// 상단바에 있는 카데고리 펼쳐주는 효과
	function show_category() {
		var x = document.getElementById("category");
		
		if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
	}
</script>   	
</body>
</html>