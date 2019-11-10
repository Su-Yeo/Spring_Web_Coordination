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
<link rel="stylesheet" href="/resources/css/swiper.min2.css">
<link rel="stylesheet" href="/resources/css/swiper.min3.css">
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
	.swiper-img2{
		width:270px;
		height:330px;
	}	
	.swiper-img3{
		width:270px;
		height:330px;
	}	
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
	.button-7-margin{
		margin:-55px 10px 20px 10px;
		float:right;
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
	
	
	/*----------------------------태블릿----------------------------*/
	@media all and (min-width: 600px) and (max-width: 1279px) {
		
		.swiper-img{
			width:270px;
			height:320px;
		}
		.swiper-img2{
			width:270px;
			height:320px;
		}
		.swiper-img3{
			width:270px;
			height:320px;
		}
		
		.swiper-button-next,.swiper-button-prev{
			margin-top:2px;
			height:20px;
		}
		
		.swiper-button-next2,.swiper-button-prev2{
			margin-top:2px;
			height:20px;
		}
		
		.swiper-button-next3,.swiper-button-prev3{
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
		
		.swiper-button-next2,.swiper-button-prev2{
			height:20px;
		}
		
		.swiper-button-next3,.swiper-button-prev3{
			height:20px;
		}
		
		.swiper-img{
			width:240px;
			height:300px;
		}
		.swiper-img2{
			width:240px;
			height:300px;
		}
		.swiper-img3{
			width:240px;
			height:300px;
		}
		.button-group{
			width:95%;
			align:center;
		}
		.button-7-margin{
			margin:5px;
			width:45%;
		}
	}
	/*------------------------------------------------------------*/
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
		<div class="tabmenu" style="clear:both;">
		  <ul>
		    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
		      <label for="tabmenu1">옷장</label>
		      <div class="tabCon">
		      <!-- 옷장에 옷이 하나 이상 있을 때 -->
				<c:if test="${!empty ClosetListTop || !empty ClosetListBottom}">
					<div class="button-group">
						<div class="button-7 button-7-margin" style="cursor: pointer;" onclick="location.href='imgUpload'">
							<div class="eff-7"></div>
							<a href="imgUpload">옷 등록</a>
						</div>
						<div class="button-7 button-7-margin" style="cursor: pointer;" onclick="category_submit()">
							<div class="eff-7"></div>
							<a href="#">코디보기</a>
						</div>
					</div>
				</c:if>
		      <!-- 옷장이 텅 비었을 때 -->
	      		<c:if test="${empty ClosetListTop && empty ClosetListBottom}">
					<img src="/resources/icon/closetIcon.jpg">
					<div class="button-7" style="margin:0 auto;cursor: pointer;" onclick="location.href='imgUpload'">
						<div class="eff-7"></div>
						<a href="imgUpload">옷 등록</a>
					</div>
				</c:if>
				<!-- 상의가 비었을 때 이미지 -->
					<c:if test="${empty ClosetListTop && !empty ClosetListBottom}">
						<img src="/resources/icon/closettopIcon.jpg">
					</c:if>
	      			<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:forEach items="${ClosetListTop}" var="closet">
								<div class="swiper-slide">
									<div class="swiper-countA">
									<img class="swiper-img" style="border: 1px solid gray;" src="/displayImg?name=${closet.img}&folder=user" onclick="category_top('${closet.category}','${closet.color}')"/>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev swiper-button-black" style="opacity:0.5;"></div>
					</div><br/>
					<!-- 하의가 비었을 때 이미지 -->
					<c:if test="${!empty ClosetListTop && empty ClosetListBottom}">
						<img src="/resources/icon/closetbottomIcon.jpg">
					</c:if>
					<!-- Swiper -->
					<div class="swiper-container2">
						<div class="swiper-wrapper">
							<c:forEach items="${ClosetListBottom}" var="closet2">
								<div class="swiper-slide">
									<div class="swiper-countB">
										<img class="swiper-img2" style="border: 1px solid gray;" src="/displayImg?name=${closet2.img}&folder=user" onclick="category_bottom('${closet2.category}','${closet2.color}')"/>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next2 swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev2 swiper-button-black" style="opacity:0.5;"></div>
					</div>
		      </div>
		    </li>
		    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
		      <label for="tabmenu2">코디</label>
		      <div class="tabCon" >
		      <!-- 드레스룸이 텅 비었을 때 -->
	      		<c:if test="${empty dressroomList}">
					<img src="/resources/icon/dressroomIcon.jpg">
				</c:if>
		      <!-- Swiper -->
					<div class="swiper-container3">
						<div class="swiper-wrapper">
		      				<c:forEach items="${dressroomList}" var="dressroom">
								<div class="swiper-slide">
									<div class="swiper-countC">
										<img class="swiper-img3" style="border: 1px solid gray;" src="/displayImg?name=${dressroom.img}&folder=admin"/>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next3 swiper-button-black" style="opacity:0.5;"></div>
						<div class="swiper-button-prev3 swiper-button-black" style="opacity:0.5;"></div>
					</div>
		      </div>
		    </li>
		  </ul>
		</div>
	</div>
	<script>
		var top2='';
		var bottom='';
		var topColor='';
		var bottomColor='';
		
		$('.swiper-img').click(function() {
			$('.swiper-img').css("border", "1px solid gray");
		    $(this).css("border", "2px solid red");
	   	});
		$('.swiper-img2').click(function() {
			$('.swiper-img2').css("border", "1px solid gray");
			$(this).css("border", "2px solid red");
	   	});
		
		function category_top(top2,topColor){
			
			this.top2=top2;
			this.topColor=topColor;
		}
		
		function category_bottom(bottom,bottomColor){
			
			this.bottom=bottom;
			this.bottomColor=bottomColor;
		}
		
		function category_submit(){
			if(top2=="" && bottom==""){
				alert("옷을 선택해주세요");	
			}else{
				location.href=encodeURI("Recommendation?top="+top2+"&bottom="+bottom+"&topColor="+topColor+"&bottomColor="+bottomColor);
			}
		}
	</script>
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
	else if($('.swiper-countA').length>=4){
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
	  
		var m = 0;
		var b = true;
		if($('.swiper-countB').length==1){
			m = 1;
			b = false;
		}
		else if($('.swiper-countB').length==2){
			m = 2;
			b = false;
		}
		else if($('.swiper-countB').length==3){
			m = 3;
			b = false;
		}
		else if($('.swiper-countB').length>=4){
			m = 3;
			b = true;
		}
		  var swiper = new Swiper('.swiper-container2', {
			    slidesPerView: m,
			    spaceBetween: 0,
			    loop: b,
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
			      nextEl: '.swiper-button-next2',
			      prevEl: '.swiper-button-prev2',
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
		  
		var p = 0;
		var q = true;
		if($('.swiper-countC').length==1){
			p = 1;
			q = false;
		}
		else if($('.swiper-countC').length==2){
			p = 2;
			q = false;
		}
		else if($('.swiper-countC').length==3){
			p = 3;
			q = false;
		}
		else if($('.swiper-countC').length>=4){
			p = 3;
			q = true;
		}
		  var swiper = new Swiper('.swiper-container3', {
			    slidesPerView: p,
			    spaceBetween: 0,
			    loop: q,
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
			      nextEl: '.swiper-button-next3',
			      prevEl: '.swiper-button-prev3',
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