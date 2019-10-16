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
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
</head>
<style type="text/css">
	
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
	String path = "C:\\img\\admin\\";
%>

<!-- Nav -->
<jsp:include page="nav.jsp" />
<!-- End Nav -->

<!-- Container -->
<div class="container">
	
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
	
	<footer>
		<table class="table">
			<tr>
				<td valign="top">
					<img src="/resources/icon/icon.png" style="width:40px; height:40px"><br>
					<span style="font-size: 25px; font-family: cursive; font-weight: bold;">오늘 뭐 입지 ?</span><br>
					<span style="font-size: 13px; font-weight: bold;">실제 옷장의 옷을 담다</span><br>
					<span style="font-size: 8px;">
						기계학습 된 모델이 실제 사진의 색상을 분석합니다.<br>
						모든 패션 사진은 협력 쇼핑몰에서 제공되는 사진입니다.<br>
						여러분에 옷장에 있는 다양한 사진을 등록하여 체험해보세요.<br>
					</span>
				</td>
				<td valign="top">
					<br>
					<br>
					<span style="font-size: 25px; font-family: cursive; font-weight: bold;">CS CENTER</span><br>
					<span style="font-size: 13px; font-weight: bold;">010-9935-7482</span><br>
					<span style="font-size: 8px;">
						월-금 10:00AM ~ 18:00PM<br>
						Lunch 13:00PM ~ 14:00PM
					</span>
				</td>
				<td valign="top">
					<br>
					<br>
					<span style="font-size: 25px; font-family: cursive; font-weight: bold;">FOLLOW AS</span><br>
					<a href="http://www.facebook.com">
						<img src="/resources/icon/facebook.png" style="width:25px; height:25px">
					</a>
					<a href="http://www.instagram.com">
						<img src="/resources/icon/instagram.png" style="width:25px; height:25px">
					</a>
				</td>
			</tr>
		</table>
	</footer>
</div>
</body>
</html>