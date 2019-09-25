<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");%>    
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/style2.css">
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<meta charset="UTF-8">
<title>Man & Coordination</title>
<style>	
	#div_top{
		 <!-- background-color:#000000; -->
	   text-align: center;
	   width: 100%;
	   padding-top:50px;
	}
    #div_right{
       float: left;
       text-align: center;
       width: 100%;
    }
    
    #div_left{
		position: absolute;
		top: 300px;
		right: 50%;
		width: 117px;
		margin-right: -720px;
    }
    
	#div_main{
		background: linear-gradient(180deg, #FFFFFF , #DDDDDD);
		text-align: center;
		float: left;
		width:100%;
		height: auto;
		margin-left: -2%;
		padding-left: 45px;
	}
	
	#div_bottom{
		float: left;
		background-color:#DDDDDD;
		text-align:left;
		      width: 100%;
		border-top:1px solid #C3C3C3;
		padding:30px;
		margin-left:-1%;
	}

  	#div_img{
	    text-align: center;
	    background-color: white;
	    display: inline-block;
	    width: 80%;
	
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
  	
	#div_img:nth-child(2n){
	   	width: 60%;
	}
	
	#div_img:nth-child(3n){
	   	width: 40%;
	}
	
	#div_banner1{
		float: left;
		width:100%;
		margin: 2px 2px;
	}
	
  	.p1{
		margin-top:-5px;
	    position: relative;
	    display: inline-block;
	    background:#ffffff;
	    -webkit-background-clip: text;
	    -webkit-text-fill-color: transparent;
	    white-space: nowrap;
  	}
  	
	.p2{
		clear:left;
		position: relative;
		display: inline-block;
		background: linear-gradient(45deg, #000000 , #888888, #000000);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
		white-space: nowrap;
		margin-top:50px;
	}
	.p3{
		position: relative;
		display: inline-block;
		background: linear-gradient(-45deg, #FFBF00 , #FF00BF , #5858FA);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
		white-space: nowrap;
	}
	#div_button1,#div_button2,#div_button3{
		background: #222222;
		color: #fff;
		border: none;
		position: relative;
		height: 40px;
		width: 100%;
		font-size: 15px;
		cursor: pointer;
		transition: 800ms ease all;
		outline: none;
	}
  
	#div_button1:hover,#div_button2:hover,#div_button3:hover{
		background: #fff;
		color: #222222;
	}
  
  #div_button1:before,#div_button1:after,#div_button2:before,#div_button2:after,#div_button3:before,#div_button3:after{
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    height: 2px;
    width: 0;
    background: #ffffff;
    transition: 600ms ease all;
  }
  
  #div_button1:after,#div_button2:after,#div_button3:after{
    right: inherit;
    top: inherit;
    left: 0;
    bottom: 0;
  }
  
  #div_button1:hover:before,#div_button1:hover:after,#div_button2:hover:before,#div_button2:hover:after,#div_button3:hover:before,#div_button3:hover:after{
    width: 100%;
    transition: 8
  }
  
  
	/* 사이드 메뉴 */
	.sidenav {
		height: 100%;
		width: 0px;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
		background-color: #333333;
		overflow-x: hidden;
		transition: 0.5s;
		padding-top: 60px;
	}
	.sidenav a {
		height:100px;
		padding-left:16px;
		text-decoration: none;
		font-size: 20px;
		color: #919191;
		display: block;
		transition: 0.3s;
	}
	.sidenav a:visited {
	    color: #919191;
	}
	.sidenav a:hover {
		color: #f1f1f1;
	}
	.sidenav .closebtn {
		position: absolute;
		top: 0;
		right: 15px;
		font-size: 36px;
		margin-left: 50px;
	}
	@media screen and (max-height: 450px) {
		.sidenav {padding-top: 15px;}
		.sidenav a {font-size: 18px;}
	}
	.divselect div{
		border-top:1px solid #919191;
		border-bottom:1px solid #919191;
		height:100px;
		line-height:100px;
	}
	/* 사이드메뉴 버튼 */
	#btn1{
            margin-right:-4px;
    }
    #btn2{   
        margin-left:-3px;
    }
    #btn_group{
		align:center;
    }
    #btn_group button{
		font-size: 20px;
    	width: 150px;
        border: 1px solid #919191;
        background-color: #333333;
        color: #919191;
        padding: 30px;
    }
    #btn_group button:hover{
        color:white;
    }
    
    img {
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
</style>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<div>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</div>
		<div style="text-align:center;margin-top:-30px;margin-bottom:30px;">
			<font style="color:#919191;font-size:25px;">Filter</font>
		</div>
		<div class="divselect">
			<div><a href="#">정렬 기준</a></div>
			<div><a href="#">제품 종류</a></div>
			<div><a href="#">스타일</a></div>
			<div><a href="#">사이즈</a></div>
			<div><a href="#">컬러</a></div>
			<div><a href="#">키</a></div>
		</div>
		<div id="btn_group">
       		<button id="btn1">선택</button>
        	<button id="btn2">초기화</button>
    	</div>
	</div>
<script>
	//오른쪽 리모콘 Animation
	$(document).ready(function() {
	
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#div_left").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
	
			/* 애니메이션 없이 바로 따라감
			 $("#div_left").css('top', newPosition);
			 */
	
			$("#div_left").stop().animate({
				"top" : newPosition
			}, 500);
	
		}).scroll();
	
	});

	function openNav() {
			document.getElementById("mySidenav").style.width = "400px";
	}
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0px";
	}
</script>

   <div style="text-align:center;">
      <div id="div_top">
      	<!--
		<p class="p1" style="font-size:50px;weight:bold;"><a href="index.jsp">M & C</a></p>
      	 -->
      	<p class="p1" style="font-size:50px;weight:bold;">
     	<a href="#">
     		<img src="/resources/img/logo.jpg" style="width:700px;height:130px">
		</a></p><hr/>
      </div>
      
      <div id="div_right">
    	<!-- weather select start -->
    	<div style="width:100%;margin-top:30px;text-align:center;">
		    <div id="div_include3">
		    	<jsp:include page="weather.jsp" flush="true"></jsp:include>
		    </div>
	    </div>
    	<!-- weather select end -->
    	<!-- image select start -->
    	<div>
    		<c:forEach items="${image}" var="image">
    			${image}
		    </c:forEach>
    	</div>
    	<!-- image select end -->
      </div>
      
      <div id="div_left">
         <div id="div_banner1">
            <button id="div_button1" onclick="location.href='#div_top'">▲</button>
         </div>
         <div id="div_banner1">
            <button id="div_button2" onclick="openNav()">Style</button>
         </div>
         <div id="div_banner1">
            <button id="div_button3" onclick="location.href='#div_bottom'">▼</button>
         </div>
      </div>
      
      <div id="div_main">
        
                  
    	<!-- include main -->
	    <div id="div_include" style="width:70%;margin:0 auto;">
	    </div>   
    </div>
	<div id="div_bottom">
		<div>
			<table align="center" width="80%">
				<tr>
					<td width="600px">
						<font style="font-size:18px;font-weight:bold">문의</font><br/><br/>
						<font style="font-size:25px;font-weight:bold">010-9935-7482</font><br/>
						<font style="font-size:12px;color:gray">평일 10:00~17:00(점심시간 12:00~13:00/주말&공휴일 휴무)<br>
						업무시간 외 문의는 Q&A게시판을 이용부탁드립니다.</font>
					</td>
					<td width="600px">
						<font style="font-size:18px;font-weight:bold">주소</font><br/><br/><br/>
						<font style="font-size:14px;color:gray">경기도 부천시 경인로 590 (유한대학교)</font>
					</td>
					<td width="300px">
						<font style="font-size:18px;font-weight:bold">만든이</font><br/><br/><br/>
						<font style="font-size:14px;color:gray">팀장 : 선상원</font><br/>
						<font style="font-size:14px;color:gray">팀원 : 박관용, 설 훈, 여수향</font>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- bottom end -->
	
<!--
	//원래 리모콘 CSS 
	#div_left{
       float: left;
       position: fixed;
       left: 5%;
       top: 40%;
       margin-left: 85%;
       text-align: center;
       width: 117px;
    }
 -->
</body>
</html>