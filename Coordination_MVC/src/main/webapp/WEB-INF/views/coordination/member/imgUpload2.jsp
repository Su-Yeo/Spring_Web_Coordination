<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>이미지 Identify</title>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript">
function sel(str) {
	if(str=="top"){
		$('#select_category').css("display", "none");
		$('#top').css("display", "block");
		$("#top option:eq(0)").prop("selected", true);
		$("select[name=top]").attr("name", "category"); 
	}else{
		$('#select_category').css("display", "none");
		$('#bottom').css("display", "block");
		$("#bottom option:eq(0)").prop("selected", true);
		$("select[name=bottom]").attr("name", "category"); 
	}
}
function selCancel(str) {
	if(str=="back"){
		$('#select_category').css("display", "block");
		$('#top').css("display", "none");
		$('#bottom').css("display", "none");
		$("#select_category option:eq(0)").prop("selected", true);
	}
}
</script>
</head>
<style type="text/css">
	body {
		color: #fff;
		<!-- background: #EBFFEB; -->
		font-family: 'Roboto', sans-serif;
	}
    .form-control {
		min-height: 41px;
		box-shadow: none;
		border-color: #ddd;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 390px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form form {
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 2px 3px 3px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .signup-form hr {
        margin: 0 -30px 20px;
    }
	.signup-form .form-group {
		margin-bottom: 20px;
	}
    .signup-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.signup-form input[type="checkbox"] {
		margin-top: 2px;
	}    
    .signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #3598dc;
		border: none;
		min-width: 140px;
    }
	.signup-form .btn:hover, .signup-form .btn:active {
		background: #2389cd;
		outline: none !important;
	}
	.signup-form a {
		color: #fff;
        text-decoration: underline;
	}
    .signup-form a:hover {
        text-decoration: none;
    }
    .signup-form form a {
		color: #3598dc;
        text-decoration: none;
	}
    .signup-form form a:hover {
		text-decoration: underline;
	}
	div#select_category{
		display:block;
	}
	div#top{
		display:none;
	}
	div#bottom{
		display:none;
	}
</style>
<body>

<!-- Form -->
<c:forEach items="${closetList}" var="closet">
<div class="signup-form">
    <form action="updateCloset" method="post">
		<h2>Image Identify</h2>
		<p>등록하신 정보를 확인합니다. 틀릴 수 있습니다!</p>
		<hr>
        <div class="form-group" align="center">
        	<input type="hidden" name="num" value="${closet.num}" />
			<img style="border: 1px solid gray;width:300px;height:350px;" src="/displayImg?name=${closet.img}&folder=user"/>
        </div>
        <div id="select_category" class="form-group">
			<label>Category</label>
        	<select name="select_category" class="form-control" onchange="sel(this.value)">
        		<option value="null">선택해주세요</option>
				<option value="top">상의</option>
				<option value="bottom">하의</option>
			</select>
        </div>
        <div id="top" class="form-group">
			<label>Category</label>
        	<select name="top" class="form-control" onchange="selCancel(this.value)">
        		<option value="null">상의를 선택해주세요</option>
				<option value="padding">패딩</option>
				<option value="coat">코트</option>
				<option value="trenchcoat">트렌치코트</option>
				<option value="leatherjacket">가죽자켓</option>
				<option value="jacket">자켓/블레이저</option>	
				<option value="cardigan">가디건</option>
				<option value="hood">후드티/후드집업</option>
				<option value="vest">조끼</option>
				<option value="knitwear">니트</option>
				<option value="sweatshirt">긴팔/맨투맨</option>
				<option value="shirt">셔츠</option>
				<option value="halftshrit">반팔</option>
				<option value="halfshirt">반팔셔츠</option>
        		<option value="back">뒤로가기</option>
			</select>
        </div>
        <div id="bottom" class="form-group">
			<label>Category</label>
        	<select name="bottom" class="form-control" onchange="selCancel(this.value)">
        		<option value="null">하의를  선택해주세요</option>
				<option value="pants">바지</option>
				<option value="jeans">청바지</option>
        		<option value="back">뒤로가기</option>
			</select>
        </div>
		<div class="form-group">
			<label>Color</label>
            <select name="color" class="form-control">
				<option value="${closet.color}">${closet.color}</option>
				<option value="black">black</option>
				<option value="blue">blue</option>
				<option value="brown">brown</option>
				<option value="gray">gray</option>
				<option value="green">green</option>
				<option value="orange">orange</option>
				<option value="pink">pink</option>
				<option value="purple">purple</option>
				<option value="red">red</option>
				<option value="white">white</option>
				<option value="yellow">yellow</option>
				<option value="ivory">ivory</option>
				<option value="pattern">pattern</option>
			</select>
        </div>
		<div class="form-group" align="center">
            <button type="submit" class="btn btn-primary btn-lg" style="background: #61C7C1;">등록하기</button>
        </div>
    </form>
</div>
</c:forEach>
<!-- End Form -->

</body>
</html>