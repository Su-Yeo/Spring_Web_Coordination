<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div.polaroid {
		width: 275px;
		background-color: white;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		margin-bottom: 25px;
		float : left;
		margin : 20px;
	}
	img {
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
	
	div.container {
		text-align: center;
		padding: 10px 20px;
	}
	
	a {
		color: black; 
		text-decoration: none; 
	}
	a:visited{
		color: black;
	}
</style>
<title></title>
</head>
<body style="text-align:center">
	<div style="clear:left">
		<p class="p2" style="font-size:24px">Today's Coordination</p>
	</div>
	
	<div style="display: table; margin: 0 auto;">
		<%-- <c:forEach items="${selectStyle}" var="style">
			<div class="polaroid">
				<a href="${style.url}" target="_blank">
					<img src="/resources/style/${style.img_name}" alt="이미지 링크">
					<p></p>
				</a>
			</div>
		</c:forEach> --%>	
	</div>
</body>
</html>