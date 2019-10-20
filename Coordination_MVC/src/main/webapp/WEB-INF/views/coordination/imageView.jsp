<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- <div style="clear:left">
		<p class="p2" style="font-size:24px">Today's Coordination</p>
	</div> -->
	<div id="div_include">
		<c:forEach items="${TemperatureStyle}" var="style" begin="1" end="12" step="1">   
			<div class="img_polaroid">
				<img class="w3-border w3-hover-border-red" src="/displayImg?name=${style.img}&folder=admin" >
				<div class="img_container">
					<div><b>${style.shopname}</b></div>

					<div>좋아요 : #명 <span style="margin: 0 0 0 60%;">버튼</span></div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>