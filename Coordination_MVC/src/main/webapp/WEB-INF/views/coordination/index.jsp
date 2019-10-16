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
	<!-- weather select start -->
   	<div style="width:100%;margin-top:30px;text-align:center;">
	    <div id="div_include3">
	    	<jsp:include page="weather.jsp" flush="true"></jsp:include>
	    </div>
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
</body>
</html>