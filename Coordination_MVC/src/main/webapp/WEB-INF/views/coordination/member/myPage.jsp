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
    *{
	  margin:0; padding:0;
	  font-size:15px; 
	  line-height:1.3;
	}
	ul{list-style:none;}
	
	.tabmenu{ 
	  margin: 0 auto; 
	  position:relative; 
	}
	.tabmenu ul li{
	  display:  inline-block;
	  width:15%;
	  float:left;  
	  text-align:center; 
	  background :#f9f9f9;
	  line-height:40px;
	}
	.swiper-img{
		width:270px;
		height:330px;
	}
	
	/*----------------------------태블릿----------------------------*/
	@media all and (min-width: 600px) and (max-width: 1279px) {
		
		.swiper-img{
			width:270px;
			height:320px;
		}
		
		.swiper-button-next,.swiper-button-prev{
			margin-top:2px;
			height:20px;
		}
	}
	/*----------------------------태블릿끝----------------------------*/
	
	/*----------------------------모바일----------------------------*/
	@media all and (max-width: 600px){
		.tabmenu ul li{
		  width:50%;
		}
		.swiper-button-next,.swiper-button-prev{
			height:20px;
		}
		.swiper-img{
			width:240px;
			height:300px;
		}
	}
	/*------------------------------------------------------------*/
	
	.tabmenu label{
	  display:block;
	  width:100%; 
	  height:40px;
	  line-height:40px;
	}
	.tabmenu input{display:none;}
	.tabCon{
	  width:100%;
	  display:none; 
	  text-align:center; 
	  padding: 20px;
	  position:absolute; 
	  left:0; top:40px;
	}
	.tabmenu input:checked ~ label{
	  background:#ccc;
	}
	.tabmenu input:checked ~ .tabCon{
	  display:block;
	}
	
	/*----------------------------img upload button----------------------------*/
	.button-7{
	  width:140px;
	  height:40px;
	  border:2px solid #777;
	  text-align:center;
	  cursor:pointer;
	  position:relative;
	  box-sizing:border-box;
	  overflow:hidden;
	}
	.button-7 a{
	  text-decoration:none;
	  color:#777;
	  text-decoration:none;
	  line-height:40px;
	  transition:all .5s ease;
	  z-index:2;
	  position:relative;
	}
	.eff-7{
	  width:100%;
	  height:40px;
	  border:0px solid #777;
	  position:absolute;
	  transition:all .5s ease;
	  z-index:1;
	  box-sizing:border-box;
	}
	.button-7:hover .eff-7{
	  border:70px solid #777;
	}
	.button-7:hover a{
	  color:#f9f9f9;
	  text-decoration:none
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
	<div class="container" style="text-align:center;">
	<c:if test="${!empty ClosetList}">
		<div class="button-7" style="float:right;cursor: pointer;" onclick="location.href='imgUpload'">
			<div class="eff-7"></div>
			<a href="imgUpload">옷 등록</a>
		</div>
	</c:if>
		<div class="tabmenu" style="clear:both;">
		  <ul>
		    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
		      <label for="tabmenu1">옷장</label>
		      <div class="tabCon">
	      		<c:if test="${empty ClosetList}">
					<img src="/resources/icon/closetIcon.jpg">
					<div class="button-7" style="margin:0 auto;cursor: pointer;" onclick="location.href='imgUpload'">
						<div class="eff-7"></div>
						<a href="imgUpload">옷 등록</a>
					</div>
				</c:if>
	      			<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:forEach items="${ClosetList}" var="closet">
								<c:if test="${closet.category=='pants'}">
								<div class="swiper-slide">
									<div class="swiper-countA">
									<a href="Recommendation?category=${closet.category}&color=${closet.color}">										
										<img class="swiper-img" style="border: 1px solid gray;" src="/displayImg?name=${closet.img}&folder=user"/>
									</a>
									</div>
								</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev swiper-button-black" style="opacity:0.5;"></div>
					</div><br/>
					<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:forEach items="${ClosetList}" var="closet">
								<div class="swiper-slide">
									<div class="swiper-countB">
									<a href="updateClosetForm?num=${closet.num}">
										<img class="swiper-img" style="border: 1px solid gray;" src="/displayImg?name=${closet.img}&folder=user"/>
									</a>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev swiper-button-black" style="opacity:0.5;"></div>
					</div>
		      </div>
		    </li>
		    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
		      <label for="tabmenu2">코디</label>
		      <div class="tabCon" >코디코디코디코디코디코디</div>
		    </li>
		  </ul>
		</div>
	</div>
	
	<!-- Swiper JS -->
	<script src="/resources/js/swiper.min.js"></script>
	
	<!-- Initialize Swiper -->
	<script>
	var n = 0;
	var a = true;
	if($('.swiper-countA').length==1){
		n = 1;
		a = false;
	}
	else if($('.swiper-countA').length==2){
		n = 2;
		a = false;
	}
	else if($('.swiper-countA').length==3){
		n = 3;
		a = false;
	}
	else{
		n = 3;
		a = true;
	}
	  var swiper = new Swiper('.swiper-container', {
		    slidesPerView: n,
		    spaceBetween: 0,
		    loop: a,
		    loopFillGroupWithBlank: true,
		    autoplay: {
		        delay: 10000,
		        disableOnInteraction: false,
		      },
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
					spaceBetween: 0
				},
				780: {
					slidesPerView: 2,
					spaceBetween: 30
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0
				}
		   }
	  });
	  
	var n = 0;
	var a = true;
	if($('.swiper-countB').length==1){
		n = 1;
		a = false;
	}
	else if($('.swiper-countB').length==2){
		n = 2;
		a = false;
	}
	else if($('.swiper-countB').length==3){
		n = 3;
		a = false;
	}
	else{
		n = 3;
	}
	  var swiper = new Swiper('.swiper-container', {
		    slidesPerView: n,
		    spaceBetween: 0,
		    loop: a,
		    loopFillGroupWithBlank: true,
		    autoplay: {
		        delay: 10000,
		        disableOnInteraction: false,
		      },
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
					spaceBetween: 0
				},
				780: {
					slidesPerView: 2,
					spaceBetween: 30
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0
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