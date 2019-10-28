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

<!-- CSS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>관리자 - 데이터 수정Page</title>
</head>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<style type="text/css">
	body {
		color: #fff;
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
</style>
<body>

<!-- 이미지정보를 수정할 경우 -->
<c:if test="${data eq 'updateStyle'}">
<!-- Form -->
<c:forEach items="${StyleOne}" var="style">
<div class="signup-form">
    <form action="updateStyle" method="POST">
		<h2>ImageData Update</h2>
		<p>등록된 정보 수정</p>
		<hr>
		<!-- Image -->
        <div class="form-group" align="center">
			<!-- num값 hidden전송 -->
        	<input type="hidden" name="num" value="${style.num}" />
			<img style="border: 1px solid gray;width:300px;height:350px;" src="/displayImg?name=${style.img}&folder=admin"/>
        </div>
        
        <!-- ShopName -->
        <div class="form-group">
			<label>ShopName</label>
            <input type="text" class="form-control" name="shopname" value="${style.shopname}" />
        </div>
        
        <!-- Top -->
        <div class="form-group">
			<label>Top</label>
        	<select name="top" class="form-control">
        		<option value="${style.top}">${style.top}</option>
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
			</select>
        </div>
        
        <!-- Top_Color -->
		<div class="form-group">
			<label>Top_Color</label>
            <select name="top_color" class="form-control">
				<option value="${style.top_color}">${style.top_color}</option>
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
        
        <!-- Pants -->
        <div class="form-group">
			<label>Pants</label>
        	<select name="pants" class="form-control">
        		<option value="${style.pants}">${style.pants}</option>
				<option value="pants">바지</option>
				<option value="jeans">청바지</option>
			</select>
        </div>
        
        <!-- Pants_Color -->
		<div class="form-group">
			<label>Pants_Color</label>
            <select name="pants_color" class="form-control">
				<option value="${style.pants_color}">${style.pants_color}</option>
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
        
        <!-- Img -->
        <div class="form-group">
			<label>Img</label>
            <input type="text" class="form-control" name="img" value="${style.img}" />
        </div>
        
        <!-- Submit -->
		<div class="form-group" align="center">
            <button type="submit" class="btn btn-primary btn-lg" style="background: #61C7C1;">수정하기</button>
        </div>
    </form>
</div>
</c:forEach>
<!-- End Form -->
</c:if>

<!-- 관리자 검증 시, 정보를 수정할 경우 -->
<c:if test="${data eq 'IdentifyUpdate'}">
<!-- Form -->
<c:forEach items="${StyleOne}" var="style">
<div class="signup-form">
    <form action="IdentifyUpdate" method="POST">
		<h2>ImageData Identify Update</h2>
		<p>파싱된 정보 검증</p>
		<hr>
		<!-- Image -->
        <div class="form-group" align="center">
			<!-- num값 hidden전송 -->
			<input type="hidden" name="num" value="${style.num}" />
			<img style="border: 1px solid gray;width:300px;height:350px;" src="/displayImg?name=${style.img}&folder=admin"/>
        </div>
        
        <!-- ShopName -->
        <div class="form-group">
			<label>ShopName</label>
            <input type="text" class="form-control" name="shopname" value="${style.shopname}" />
        </div>
        
        <!-- Top -->
        <div class="form-group">
			<label>Top</label>
        	<select name="top" class="form-control">
        		<option value="${style.top}">${style.top}</option>
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
			</select>
        </div>
        
        <!-- Top_Color -->
		<div class="form-group">
			<label>Top_Color</label>
            <select name="top_color" class="form-control">
				<option value="${style.top_color}">${style.top_color}</option>
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
        
        <!-- Pants -->
        <div class="form-group">
			<label>Pants</label>
        	<select name="pants" class="form-control">
        		<option value="${style.pants}">${style.pants}</option>
				<option value="pants">바지</option>
				<option value="jeans">청바지</option>
			</select>
        </div>
        
        <!-- Pants_Color -->
		<div class="form-group">
			<label>Pants_Color</label>
            <select name="pants_color" class="form-control">
				<option value="${style.pants_color}">${style.pants_color}</option>
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
        
        <!-- Img -->
        <div class="form-group">
			<label>Img</label>
            <input type="text" class="form-control" name="img" value="${style.img}" />
        </div>
        
        <!-- Submit -->
		<div class="form-group" align="center">
            <button type="submit" class="btn btn-primary btn-lg" style="background: #61C7C1;">검증완료</button>
            &nbsp;&nbsp;&nbsp;
            <input type="button" value="삭제하기" class="btn btn-primary btn-lg" style="background: #FFB4FF;"
            onClick="location.href='deleteStyle?num=${style.num}&img=${style.img}'" />
        </div>
    </form>
</div>
</c:forEach>
<!-- End Form -->
</c:if>

</body>
</html>