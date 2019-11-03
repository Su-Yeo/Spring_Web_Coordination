<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
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
  <meta charset="utf-8">
	<title>myPage</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<link rel="stylesheet" href="/resources/css/import.css" />
  <!-- Demo styles -->
  <style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
  </style>
</head>
<body>
	<%
		String path = "C:\\img\\user\\";
	%>
	<!-- Nav -->
	<jsp:include page="../nav.jsp"></jsp:include>
	<!-- End Nav -->
	
	<a href="imgUpload">나만의 옷장 등록</a>
	${sessionScope.userName}님의 옷장
	<div class="container" style="text-align:center;">
		<section id="all">
			<div id="tabs" class="tabs">
				<ul class="menu">
					<li><a href=".mycloth">옷장</a></li>
					<li><a href=".coordi">코디</a></li>
				</ul>
				<div class="content"><!--content전체-->
				<section class="mycloth"><!--//옷장 섹션-->
				<c:if test="${empty ClosetList}">
					<h2>나만의 옷장이 비어있습니다.</h2>
				</c:if>
					<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
						<c:if test="${!empty ClosetList}">
							<c:forEach items="${ClosetList}" var="closet">
								<div class="swiper-slide">
									<a href="Recommendation?category=${closet.category}&color=${closet.color}">
										<img style="border: 1px solid gray;width:300px;height:350px;" src="/displayImg?name=${closet.img}&folder=user"/>
									</a>
								</div>
							</c:forEach>
						</c:if>
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
						<!-- Add Arrows -->
						<div class="swiper-button-next swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev swiper-button-black" style="opacity:0.5;"></div>
					</div>
				</section><!--//코디 섹션-->
				<section class="coordi">
					
				</section>
				</div><!-- /content -->
			</div><!--//tabs-->
		</section>
	</div>	
	<script src="/resources/js/cbpFWTabs.js"></script>
	<script>
		new CBPFWTabs( document.getElementById( 'tabs' ) );
	</script>

	<!-- Swiper JS -->
	<script src="/resources/js/swiper.min.js"></script>
	
	<!-- Initialize Swiper -->
	<script>
	  var swiper = new Swiper('.swiper-container', {
		    slidesPerView: 3,
		    spaceBetween: 20,
		    loop: true,
		    loopFillGroupWithBlank: true,
		    pagination: {
		      el: '.swiper-pagination',
		      clickable: true,
		    },
		    navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		    breakpoints: {
				1024: {
					slidesPerView: 3,
					spaceBetween: 20
				},
				780: {
					slidesPerView: 2,
					spaceBetween: 18
				},
				640: {
					slidesPerView: 2,
					spaceBetween: 25
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0
				}
		   }
	  });
	</script>
</body>
</html>