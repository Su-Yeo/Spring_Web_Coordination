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
<!-- favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="/resources/icon/user/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/user/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/user/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/user/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/user/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<!-- End favicon -->

<!-- 상단메뉴바 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 메일 Modal 개발자 Modal-->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- CSS -->
<link href="/resources/index/base.css" rel="stylesheet">
<link href="/resources/index/font_noto_sans_cjk.css" rel="stylesheet">
<link href="/resources/index/index.css" rel="stylesheet">
<link href="/resources/index/nice-select.css" rel="stylesheet">
<link href="/resources/index/slick-theme.css" rel="stylesheet">
<link href="/resources/index/slick.css" rel="stylesheet">
<link href="/resources/index/slick.css" rel="stylesheet">
<link href="/resources/index/style_lazy.css" rel="stylesheet">
<link href="/resources/index/style.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
</head>
<!-- Javascript -->
<script src="/resources/index/en.js"></script>
<script src="/resources/index/jquery.autocomplete.min.js"></script>
<script src="/resources/index/slick.min.js"></script>

<!-- 상단 메뉴바 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

	/* 상단 메뉴바 */
    .form-inline {
        display: inline-block;
    }
	.navbar-header.col {
		padding: 0 !important;
	}	
	.navbar {		
		background: #fff;
		padding-left: 16px;
		padding-right: 16px;
		border-bottom: 1px solid #d6d6d6;
		box-shadow: 0 0 4px rgba(0,0,0,.1);
	}
	.nav-link img {
		border-radius: 50%;
		width: 36px;
		height: 36px;
		margin: -8px 0;
		float: left;
		margin-right: 10px;
	}
	.navbar .navbar-brand {
		color: #555;
		padding-left: 0;
		padding-right: 50px;
		font-family: 'Merienda One', sans-serif;
	}
	.navbar .navbar-brand i {
		font-size: 20px;
		margin-right: 5px;
	}
	.search-box {
        position: relative;
    }	
    .search-box input {
		box-shadow: none;
        padding-right: 35px;
        border-radius: 3px !important;
    }
	.search-box .input-group-addon {
        min-width: 35px;
        border: none;
        background: transparent;
        position: absolute;
        right: 0;
        z-index: 9;
        padding: 7px;
		height: 100%;
    }
    .search-box i {
        color: #a0a5b1;
		font-size: 19px;
    }
	.navbar .nav-item i {
		font-size: 18px;
	}
	.navbar .dropdown-item i {
		font-size: 16px;
		min-width: 22px;
	}
	.navbar .nav-item.open > a {
		background: none !important;
	}
	.navbar .dropdown-menu {
		border-radius: 1px;
		border-color: #e5e5e5;
		box-shadow: 0 2px 8px rgba(0,0,0,.05);
	}
	.navbar .dropdown-menu li a {
		color: #777;
		padding: 8px 20px;
		line-height: normal;
	}
	.navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
		color: #333;
	}	
	.navbar .dropdown-item .material-icons {
		font-size: 21px;
		line-height: 16px;
		vertical-align: middle;
		margin-top: -2px;
	}
	.navbar .badge {
		background: #f44336;
		font-size: 11px;
		border-radius: 20px;
		position: absolute;
		min-width: 10px;
		padding: 4px 6px 0;
		min-height: 18px;
		top: 5px;
	}
	.navbar ul.nav li a.notifications, .navbar ul.nav li a.messages {
		position: relative;
		margin-right: 10px;
	}
	.navbar ul.nav li a.messages {
		margin-right: 20px;
	}
	.navbar a.notifications .badge {
		margin-left: -8px;
	}
	.navbar a.messages .badge {
		margin-left: -4px;
	}	
	.navbar .active a, .navbar .active a:hover, .navbar .active a:focus {
		background: transparent !important;
	}
	@media (min-width: 1200px){
		.form-inline .input-group {
			width: 300px;
			margin-left: 30px;
		}
	}
	@media (max-width: 1199px){
		.form-inline {
			display: block;
			margin-bottom: 10px;
		}
		.input-group {
			width: 100%;
		}
	}
	/* End 상단 메뉴바 */
	/* 메일 Modal */
	.modal-newsletter {	
		color: #999;
		font-size: 15px;
	}
	.modal-newsletter .modal-content {
		padding: 40px;
		border-radius: 0;		
		border: none;
	}
	.modal-newsletter .modal-header {
		border-bottom: none;   
        position: relative;
		text-align: center;
		border-radius: 5px 5px 0 0;
	}
	.modal-newsletter h4 {
		color: #000;
		text-align: center;
		font-size: 30px;
		margin: 0 0 25px;
		font-weight: bold;
		text-transform: capitalize;
	}
	.modal-newsletter .close {
		background: #c0c3c8;
		position: absolute;
		top: -15px;
		right: -15px;
		color: #fff;
		text-shadow: none;
		opacity: 0.5;
		width: 22px;
		height: 22px;
		border-radius: 20px;
		font-size: 16px;
	}
	.modal-newsletter .close span {
		position: relative;
		top: -1px;
	}
	.modal-newsletter .close:hover {
		opacity: 0.8;
	}
	.modal-newsletter .icon-box {
		color: #7265ea;		
		display: inline-block;
		z-index: 9;
		text-align: center;
		position: relative;
		margin-bottom: 10px;
	}
	.modal-newsletter .icon-box i {
		font-size: 110px;
	}
	.modal-newsletter .form-control, .modal-newsletter .btn {
		min-height: 46px;
		border-radius: 3px; 
	}
	.modal-newsletter .form-control {
		box-shadow: none;
		border-color: #dbdbdb;
	}
	.modal-newsletter .form-control:focus {
		border-color: #7265ea;
		box-shadow: 0 0 8px rgba(114, 101, 234, 0.5);
	}
    .modal-newsletter .btn {
        color: #fff;
        border-radius: 4px;
		background: #7265ea;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
		padding: 6px 20px;
		min-width: 150px;
        border: none;
    }
	.modal-newsletter .btn:hover, .modal-newsletter .btn:focus {
		background: #4e3de4;
		outline: none;
	}
	.modal-newsletter .input-group {
		margin: 30px 0 15px;
	}
	/* End 메일 Modal */
	/* 개발자 Modal */
	.modal-confirm {		
		color: #636363;
		width: 400px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
        text-align: center;
		font-size: 14px;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -10px;
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -2px;
	}
	.modal-confirm .modal-body {
		color: #999;
	}
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;		
		border-radius: 5px;
		font-size: 13px;
		padding: 10px 15px 25px;
	}
	.modal-confirm .modal-footer a {
		color: #999;
	}		
	.modal-confirm .icon-box {
		width: 80px;
		height: 80px;
		margin: 0 auto;
		border-radius: 50%;
		z-index: 9;
		text-align: center;
		border: 3px solid #f15e5e;
	}
	.modal-confirm .icon-box i {
		color: #f15e5e;
		font-size: 46px;
		display: inline-block;
		margin-top: 13px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
		min-width: 120px;
        border: none;
		min-height: 40px;
		border-radius: 3px;
		margin: 0 5px;
		outline: none !important;
    }
	.modal-confirm .btn-info {
        background: #c1c1c1;
    }
    .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
        background: #a8a8a8;
    }
    .modal-confirm .btn-danger {
        background: #f15e5e;
    }
    .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
        background: #ee3535;
    }
    /* End 개발자 Modal */
	/* Notice Modal */
	.modal-login {
        color: #434343;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 1px;
		border: none;
        position: relative;
	}
	.modal-login .modal-header {
		border-bottom: none;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 22px;
        margin-bottom: -10px;
	}
    .modal-login .avatar {
        color: #fff;
		margin: 0 auto;
        text-align: center;
		width: 100px;
		height: 100px;
		border-radius: 50%;
		z-index: 9;
		background: #FB6E9D;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
    .modal-login .avatar i {
        font-size: 62px;
    }
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 1px; 
        transition: all 0.5s;
	}    
	.modal-login .hint-text {
		text-align: center;
		padding-top: 10px;
	}
	.modal-login .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
	.modal-login .btn {
		background: #FB6E9D;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #fb3c7a;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	/* End Notice Modal */
	img{
		margin: 1px;
    	overflow: hidden;
	}
	
	/* Image Polaroid */
	div.img_polaroid {
		display: inline-block;
		background-color: white;
		margin: 10px 15px;
		border: 1px solid gray;
	}
	div.img_polaroid:hover {
		border: 1px solid red;
	}
	
	div.img_container {
		text-align: left;
		padding: 10px 20px;
	}
	div.img_container div {
		margin-top: 5px;
	}
</style>
<body>
<%
	//이미지가 보여질 Path명
	String path = "C:\\img\\user\\";
%>

<nav class="navbar navbar-default navbar-expand-xl navbar-light">
	<div class="navbar-header d-flex col">
	<div style="float:left;"><img src="/resources/icon/icon.png" style="width: 50px;"></div><a class="navbar-brand">오늘 뭐 입지 <b>?</b></a>
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<!-- End Logo -->
	
	<!-- 모바일 화면 : 펼쳤을 때 나올 목록들 -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<ul class="nav navbar-nav">
			<li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
			<c:if test="${empty sessionScope.userId}">
				<li class="nav-item"><a href="login" class="nav-link">Login</a></li>
				<li class="nav-item"><a href="signup" class="nav-link">SignUp</a></li>
			</c:if>
			<!-- <li class="nav-item dropdown">
				<a data-toggle="dropdown" class="nav-link dropdown-toggle" href="#">Services <b class="caret"></b></a>
				<ul class="dropdown-menu">					
					<li><a href="#" class="dropdown-item">Web Design</a></li>
					<li><a href="#" class="dropdown-item">Web Development</a></li>
					<li><a href="#" class="dropdown-item">Graphic Design</a></li>
					<li><a href="#" class="dropdown-item">Digital Marketing</a></li>
				</ul>
			</li> -->
			<li class="nav-item"><a href="#developerModal" data-toggle="modal" class="nav-link">Developer</a></li>
			<li class="nav-item"><a href="#infomationModal" data-toggle="modal" class="nav-link">Infomation</a></li>
		</ul>
		
		<!-- 로그인하면 보여질 화면 -->
		<c:if test="${not empty sessionScope.userId}">
		<ul class="nav navbar-nav navbar-right ml-auto">
			<li class="nav-item"><a href="#noticeModal" data-toggle="modal" class="nav-link notifications"><i class="fa fa-bell-o"></i><span class="badge"></span></a></li>
			<li class="nav-item"><a href="#MailModal" data-toggle="modal" class="nav-link messages"><i class="fa fa-envelope-o"></i><span class="badge"></span></a></li>
			<li class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle user-action">
					<img src="/resources/icon/icon2.png" class="avatar" alt="프로필 사진"> ${sessionScope.userName} <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="isMyPage" class="dropdown-item"><i class="fa fa-user-o"></i> 나만의 옷장</a></li>
					<li><a href="isMyPage" class="dropdown-item"><i class="fa fa-sliders"></i> 회원정보 수정</a></li>
					<!-- <li><a href="#" class="dropdown-item"><i class="fa fa-calendar-o"></i></a></li> -->
					<li class="divider dropdown-divider"></li>
					<li><a href="logout" class="dropdown-item"><i class="material-icons">&#xE8AC;</i> Logout</a></li>
				</ul>
			</li>
		</ul>
		</c:if>
	</div>
</nav>

<!-- Mail Modal -->
<div id="MailModal" class="modal fade">
	<div class="modal-dialog modal-newsletter">
		<div class="modal-content">
			<form action="mail" method="post">
				<div class="modal-header">
					<div class="icon-box">						
						<i class="fa fa-envelope-open-o"></i>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span>&times;</span></button>
				</div>
				<div class="modal-body text-center">
					<h4>고객의 소리</h4>	
					<p>
						저희 웹 사이트와 관련된 궁금한 사항이 있으시면 문의를 남겨주세요.<br/>
						가능한 빨리 답변을 드리겠습니다.
					</p>
					<div class="input-group">
						<div style="padding-bottom: 70px;">
						<textarea name="mail" rows="3" cols="100" class="form-control" required></textarea>
						</div>
						<!--<input type="email" class="form-control" placeholder="Enter your email" required>-->
						<footer>
						<span class="input-group-btn">
							<input type="submit" class="btn btn-primary" value="보내기">
						</span>
						</footer>
					</div>
				</div>
			</form>			
		</div>
	</div>
</div>
<!-- End Mail Modal -->

<!-- Developer Model -->
<div id="developerModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">				
				<h2 class="modal-title">개발자 소개</h2>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<table>
					<tr>
						<td>
							<img src="/resources/developer.jpg" style="width:100px; height:130px;"/>
						</td>
						<td valign="middle">
							&nbsp;이름 : 선상원 <br/>
							&nbsp;학번 : 201507046
						</td>
					</tr>
					<tr>
						<td>
							<img src="/resources/icon/icon.png" style="width:100px; height:130px;"/>
						</td>
						<td valign="middle">
							&nbsp;이름 : 박관용 <br/>
							&nbsp;학번 : 201507042
						</td>
					</tr>
					<tr>
						<td>
							<img src="/resources/icon/icon.png" style="width:100px; height:130px;"/>
						</td>
						<td valign="middle">
							&nbsp;이름 : 설 훈 <br/>
							&nbsp;학번 : 201507078
						</td>
					</tr>
					<tr>
						<td>
							<img src="/resources/icon/icon.png" style="width:100px; height:130px;"/>
						</td>
						<td valign="middle">
							&nbsp;이름 : 여수향 <br/>
							&nbsp;학번 : 201707056
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End Developer Model -->

<!-- Infomation Model -->
<div id="infomationModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">				
				<h2 class="modal-title">옷 골라주는 사람들</h2>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<p>
					안녕하세요? <br/>
					'옷 골라주는 사람들'입니다. <br/>
					저희가 개발한  '오늘 뭐 입지?' 웹 사이트는 다양한 패션 코디룩을 제공하는 코디북 웹 사이트입니다. <br/>
				</p>
				<p align="left">
					1. 사용자가 지정한 지역의 온도에 맞는 다양한 코디룩을 제공! <br/>
					2. 회원분들에게는 나만의 옷장 서비스 도입! <br/>
					3. 실제 옷장에 있는 옷들을 촬영하여 업로드하면 해당 옷의 종류와 색상을 컴퓨터가 자동 분석하여 다양한 코디룩을 제공합니다.
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End Infomation Model -->

<!-- Notice Model -->
<div id="noticeModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<div align="center">
                	<img src="/resources/notice.png">
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>
				</p>
				<div class="form-group">
					<button type="button" class="btn btn-primary btn-block btn-lg" data-dismiss="modal">돌아가기</button>
				</div>			
			</div>
		</div>
	</div>
</div>
<!-- End Notice Model -->

<div class="container" align="center">
	<!-- weather -->
	<div>
		
	</div>
	
	<!-- Image -->
	<div>
		<c:forEach items="${StyleList}" var="style" begin="1" end="12" step="1">   
			<div class="img_polaroid">
				<img class="w3-border w3-hover-border-red" src="${style}" >
				<div class="img_container">
					<div><b>Image NickName</b></div>
					<div>Example Title</div>
					<div>좋아요 : #명 <span style="margin: 0 0 0 60%;">버튼</span></div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- Footer -->
<div id="footer" align="center">
    <div id="footer_notice_wide">
        패션에 관심이 없던 여러분도 오늘 뭐 입지?? 를 통해 패셔니스타가 되실 수 있습니다.!<br>
    </div>
    <div id="footer_content">
        <div class="table">
            <div class="footer_about">
                <img alt="오늘 뭐 입지??" src="/resources/icon/icon.png" style="width:70px; height: 70px;">
                <font style="font-size: 30px;">오늘 뭐 입지??</font>
                <br>
                <h1>실제 옷장의 옷들을 저장해보세요.</h1>
                <p>여러 협력 쇼핑몰 제품의 사진을 사용하고 있습니다.<br>
                    간혹! 원하는 코디룩의 사진이 나오지 않을 수 있습니다! ㅠㅠ<br>
                    그럴 때는 상단에 '<고객의 소리>'를 통해 문의해주세요.<br>
                </p>
            </div>
            <div class="col0">
                <div class="row0">
                    <span class="footer_title">
                        CS CENTER</span>
                    <br>
                    <br>
                    <span class="call">010-9935-7482</span>
                    월 - 금 10:00AM ~ 17:00PM
                    <br>
                    Lunch 13:00PM ~ 14:00PM
                </div>
            </div>
            <div class="col1 account">
                <span class="footer_title">KAKAO</span>
                <br>
                <br>
                Man&Coordination
                <br>
                유한대학교 IT소프트웨어공학과
                <br>
                개발자 팀명 : 옷 골라주는 사람들
            </div>
            <div class="col3">
                <span class="footer_title">FOLLOW US</span>
                <br>
                <br>
                <div class="social">
                    <a class="facebook" href="http://www.facebook.com" target="_blank">
                        <img src="/resources/icon/facebook.png" alt="Facebook">
                    </a>
                    <a class="instagram" href="http://instagram.com" target="_blank">
                        <img src="/resources/icon/instagram.png" alt="Instagram">
                    </a>
                </div>
            </div>
            <div class="col4">
                옷 골라주는 사람들 팀장 : 선상원<br>
                팀원 : 박관용, 설 훈, 여수향<br>
                유한대학교 IT소프트웨어공학과<br>
                2019년도 학술제 발표작품<br>
                대표전화 010-9935-7482<br>
                Email : sangwon7482@naver.com
           </div>
           <div class="col5">
           <img src="/resources/developer.jpg" style="width: 170px; height: 170px; border: 1px solid #000000;">
           </div>
        </div>
    </div>
</div>
<!-- End Footer -->
</body>
</html>