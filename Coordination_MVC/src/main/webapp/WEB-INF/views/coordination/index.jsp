<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Map"%>
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
<link rel="stylesheet" href="../dist/css/style.css">
<link rel="stylesheet" href="../dist/css/swiper.min.css">
<meta charset="UTF-8">
<title>Man & Coordination</title>

<style>
		
      #iframe{
         margin-left:100px;
         overflow:hidden;
      }
      #div_top{
      	 <!-- background-color:#000000; -->
         text-align: center;
         width: 100%;
         padding-top:50px;
      }

		.menubar{
		width:100%;
		background-color:#f0f0f0;
		border:none;
		border:0px;
		margin-top:-10px;
		padding:0px;
		font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
		font-size:14px;
		font-weight:bold;
		}

		.menubar ul{
		background: rgb(102,255,153);
		height:50px;
		list-style:none;
		/*가운데 정렬 해주기*/
		display:table;
		margin-left:auto;
		margin-right:auto;

		/*가운데 정렬 해주기
		display:table;
		margin-left:auto;
		margin-right:auto; */

		padding:0;
		}
		.menubar li{
		width:150px;
		float:left;
		padding-left:75px;

		margin:0px;
		}

		.menubar li a{
		background: rgb(102,255,153);
		color:#120384;
		display:block;
		font-weight:bold;
		line-height:50px;
		margin:0px;
		padding:0px 25px;
		text-align:center;
		text-decoration:none;
		}

		.menubar li a:hover, .menubar ul li:hover a{
		background: rgb(051,204,133);
		color:#FFFFFF;
		text-decoration:none;
		}

		.menubar li ul{
		background: rgb(102,255,153);
		display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
		height:auto;
		padding:0px;
		margin:0px;
		border:0px;
		position:absolute;
		width:150px;
		z-index:200;
		/*top:1em;
		/*left:0;*/
		}

		.menubar li:hover ul{
		display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
		}

		.menubar li li {
		background: rgb(051,204,133);
		display:block;
		float:none;
		margin:0px;
		padding:0px;
		width:200px;
		}

		.menubar li:hover li a{
		background:none;
		}

		.menubar li ul a{
		display:block;
		height:50px;
		font-size:12px;
		font-style:normal;
		margin:0px;
		padding:0px 10px 0px 15px;
		text-align:left;
		}

		.menubar li ul a:hover, .menubar li ul li:hover a{
		background: rgb(051,153,133);
		border:0px;
		color:#ffffff;
		text-decoration:none;
		}

		.menubar p{
		clear:left;
		}	  
      #div_right{
         float: left;
         text-align: center;
         width: 100%;
      }  
      #div_left{
         float: left;
         position: fixed;
         left: 5%;
         top: 40%;
         margin-left: 85%;
         text-align: center;
         width: 117px;
      }
		/*모달창 뜨면 보이는 div 부분*/
		/*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider arrow skin 093 css*/
        .jssora093 {display:block;position:absolute;cursor:pointer;}
        .jssora093 .c {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;}
        .jssora093 .a {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;}
        .jssora093:hover {opacity:.8;}
        .jssora093.jssora093dn {opacity:.6;}
        .jssora093.jssora093ds {opacity:.3;pointer-events:none;}

        /*jssor slider thumbnail skin 101 css*/
        .jssort101 .p {position: absolute;top:0;left:0;box-sizing:border-box;background:#000;}
        .jssort101 .p .cv {position:relative;top:0;left:0;width:100%;height:100%;border:2px solid #000;box-sizing:border-box;z-index:1;}
        .jssort101 .a {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;visibility:hidden;}
        .jssort101 .p:hover .cv, .jssort101 .p.pdn .cv {border:none;border-color:transparent;}
        .jssort101 .p:hover{padding:2px;}
        .jssort101 .p:hover .cv {background-color:rgba(0,0,0,6);opacity:.35;}
        .jssort101 .p:hover.pdn{padding:0;}
        .jssort101 .p:hover.pdn .cv {border:2px solid #fff;background:none;opacity:.35;}
        .jssort101 .pav .cv {border-color:#fff;opacity:.35;}
        .jssort101 .pav .a, .jssort101 .p:hover .a {visibility:visible;}
        .jssort101 .t {position:absolute;top:0;left:0;width:100%;height:100%;border:none;opacity:.6;}
        .jssort101 .pav .t, .jssort101 .p:hover .t{opacity:1;}

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
      a:link { color: black; text-decoration: none; }
      a:visited { color: black; text-decoration: none;}
      a:hover { color: black; text-decoration: none;}
      a:active { color: black; text-decoration: none;}
	  
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

    .swiper-container {
      width: 60%;
      height: 40%;
      padding-top: 40px;
	  margin-left: auto;
      margin-right: auto;
	  
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
	  
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;
    }
/*모달창 뜨면 보이는 div 부분*/
/*jssor slider loading skin spin css*/
      .jssorl-009-spin img {
          animation-name: jssorl-009-spin;
          animation-duration: 1.6s;
          animation-iteration-count: infinite;
          animation-timing-function: linear;
      }

      @keyframes jssorl-009-spin {
          from { transform: rotate(0deg); }
          to { transform: rotate(360deg); }
      }

      /*jssor slider arrow skin 093 css*/
      .jssora093 {display:block;position:absolute;cursor:pointer;}
      .jssora093 .c {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;}
      .jssora093 .a {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;}
      .jssora093:hover {opacity:.8;}
      .jssora093.jssora093dn {opacity:.6;}
      .jssora093.jssora093ds {opacity:.3;pointer-events:none;}

      /*jssor slider thumbnail skin 101 css*/
      .jssort101 .p {position: absolute;top:0;left:0;box-sizing:border-box;background:#000;}
      .jssort101 .p .cv {position:relative;top:0;left:0;width:100%;height:100%;border:2px solid #000;box-sizing:border-box;z-index:1;}
      .jssort101 .a {fill:none;stroke:#fff;stroke-width:400;stroke-miterlimit:10;visibility:hidden;}
      .jssort101 .p:hover .cv, .jssort101 .p.pdn .cv {border:none;border-color:transparent;}
      .jssort101 .p:hover{padding:2px;}
      .jssort101 .p:hover .cv {background-color:rgba(0,0,0,6);opacity:.35;}
      .jssort101 .p:hover.pdn{padding:0;}
      .jssort101 .p:hover.pdn .cv {border:2px solid #fff;background:none;opacity:.35;}
      .jssort101 .pav .cv {border-color:#fff;opacity:.35;}
      .jssort101 .pav .a, .jssort101 .p:hover .a {visibility:visible;}
      .jssort101 .t {position:absolute;top:0;left:0;width:100%;height:100%;border:none;opacity:.6;}
      .jssort101 .pav .t, .jssort101 .p:hover .t{opacity:1;}

 /* The Modal (background) */
      .modal {
          display: none; /* Hidden by default */
          position: fixed; /* Stay in place */
          z-index: 1; /* Sit on top */
          left: 0;
          top: 0;
          width: 100%; /* Full width */
          height: 100%; /* Full height */
          overflow: auto; /* Enable scroll if needed */
          background-color: rgb(0,0,0); /* Fallback color */
          background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }
  
      /* The Close Button */
      .close {
	margin-right:1%;
          color: #fff;
          float: right;
          font-size: 28px;
          font-weight: bold;
      }
      .close:hover,
      .close:focus {
          color: black;
          text-decoration: none;
          cursor: pointer;
      }
</style>
<script type="text/javascript">
function sel(s){
	var sel = encodeURI(s);
    $.ajax({
        type : "GET",
        url : "test2.jsp?loc="+sel,
        dataType: "text",
        async:false,
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$("#selectDiv").html(data);
        	$("#selectBox").val(s).attr("selected","selected");
        	$("#selectBox2").prepend('<option value="선택">--선택--</option>');
        	$("#selectBox2").val("선택").attr("selected","selected");
        	$("#selectBox3").prepend('<option value="선택">--선택--</option>');
        	$("#selectBox3").val("선택").attr("selected","selected");
        	loc=sel;
        }   
    });
}

function sel2(s){
	var sel2 = encodeURI(s);
    $.ajax({
        type : "GET",
        url : "test2.jsp?loc="+loc+"&loc2="+sel2,
        dataType: "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$("#selectDiv").html(data);
        	$("#selectBox").val(decodeURI(loc)).attr("selected","selected");
        	$("#selectBox2").val(s).attr("selected","selected");
        	$("#selectBox3").prepend('<option value="선택">--선택--</option>');
        	$("#selectBox3").val("선택").attr("selected","selected");
        	loc2=sel2;
        }   
    });
}

function sel3(s){
	var sel3 = encodeURI(s);
    $.ajax({
        type : "GET",
        url : "test2.jsp?loc="+loc+"&loc2="+loc2+"&loc3="+sel3,
        dataType: "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$("#weatherDiv").html(data);
        	$("#selectBox").val(decodeURI(loc)).attr("selected","selected");
        	$("#selectBox2").val(decodeURI(loc2)).attr("selected","selected");
        	$("#selectBox3").val(s).attr("selected","selected");
        }   
    });
}

function init(){
	$("#selectBox option:eq(0)").replaceWith('<option value="선택">--선택--</option>');
}
</script>
</head>
<body>
   <div style="text-align:center;">
      <div id="div_top">
      	<!--
		<p class="p1" style="font-size:50px;weight:bold;"><a href="index.jsp">M & C</a></p>
      	 -->
      	<p class="p1" style="font-size:50px;weight:bold;">
     	<a href="index.jsp">
     		<img src="resources/img/logo.jpg" style="width:700px;height:130px">
		</a></p><hr/>
      </div>
      <!-- include -->
      <!--모달창 뜨면 보이는 div 부분-->
		<div id="myModal" class="modal">
			<span class="close">&times;</span>
		    <div id="div_include2" style="width:20%;margin-top:13%;margin-left:auto;margin-right:auto;">
		    	<jsp:include page="category.jsp" flush="true"></jsp:include>
		    </div>
	    </div>
      <!-- 
      <div class="menubar">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#" id="current">recommend</a>
			<ul>
				<li><a href="#">Weather</a></li>
				<li><a href="#">Style</a></li>
				<li><a href="#">Trend</a></li>
			</ul>
			</li>
			<li><a href="#" id="current">Company</a>
			<ul>
				<li><a href="#">Introduce</a></li>
				<li><a href="#">Address</a></li>
				<li><a href="#">Q&A</a></li>
			</ul></li>
			<li><a href="#">board</a></li>
		</ul>
      </div> -->
      <div id="div_right">
    <!-- weather select start -->
    	<div style="width:100%;margin-top:30px;text-align:center;">
		    <div id="div_include3">
		    	<jsp:include page="weather.jsp" flush="true"></jsp:include>
		    </div>
	    </div>
    <!-- weather select end --> 
    <!-- weather widget start 
			<div id="m-booked-small-t1-26691">
				<div class="booked-weather-120x100 w100-bg" style="background-color:#000000; color:#ffffff; border-radius:4px; -moz-border-radius:4px; width:740px !important; border:none">
					<a target="_blank" style="background-color:#000000; color:#ffffff;" href="https://booked.kr/weather/seoul-18406" class="booked-weather-120x100-city">서울특별시</a>
					<a target="_blank" class="booked-weather-120x100-bottom" href="https://www.booked.net/">
						<img src="//s.bookcdn.com/images/letter/s5.gif" alt="Book Your Hotel on Booked.net" />
					</a>
					<div class="booked-weather-120x100-degree w18">
						<span class="plus">+</span>19&deg;<sub class="booked-weather-140x100-type">C</sub>
					</div>
					<div class="booked-weather-120x100-high-low">
						<p>높음: <span class="plus">+</span>19&deg;</p>
						<p>낮음: <span class="plus">+</span>17&deg;</p>
					</div>
					<div style="background-color:#000000; color:#ffffff;" class="booked-weather-120x100-date">월, 27.05.2019</div>
					</div>
				</div>
			<script type="text/javascript">
			var css_file=document.createElement("link");
			css_file.setAttribute("rel","stylesheet");
			css_file.setAttribute("type","text/css");
			css_file.setAttribute("href",'https://s.bookcdn.com/css/w/bw-120-100.css?v=0.0.1');
			document.getElementsByTagName("head")[0].appendChild(css_file);
			function setWidgetData(data) {
				if(typeof(data) != 'undefined' && data.results.length > 0) {
					for(var i = 0; i < data.results.length; ++i) {
						var objMainBlock = document.getElementById('m-booked-small-t1-26691');
						if(objMainBlock !== null) {
							var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type);
							objMainBlock.innerHTML = data.results[i].html_code;
							if(copyBlock !== null) objMainBlock.appendChild(copyBlock); 
							} 
						}
					} else {
						alert('data=undefined||data.results is empty');
					}
				}
			</script>
			<script type="text/javascript" charset="UTF-8" src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=18406&type=11&scode=2&ltid=3458&domid=593&anc_id=39266&cmetric=1&wlangID=24&color=000000&wwidth=740&header_color=000000&text_color=ffffff&link_color=ffffff&border_form=3&footer_color=000000&footer_text_color=ffffff&transparent=0">
			</script>
			<!-- weather widget end -->
			
      </div>
      <div id="div_left">
         <div id="div_banner1">
            <button id="div_button1">Weather</button>
         </div>
         <div id="div_banner1">
            <button id="div_button2" target="mainiframe">Style</button>
         </div>
         <div id="div_banner1">
            <button id="div_button3">Trend</button>
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
	<!-- #region Jssor Slider Begin -->
    <!-- Generator: Jssor Slider Maker -->
    <!-- Source: https://www.jssor.com -->
    <script src="../dist/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../dist/js/jssor.slider-27.5.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var jssor_1_SlideshowTransitions = [
              {$Duration:1200,$Zoom:1,$Easing:{$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad},$Opacity:2},
              {$Duration:1000,$Zoom:11,$SlideOut:true,$Easing:{$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Zoom:1,$Rotate:1,$During:{$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Easing:{$Zoom:$Jease$.$Swing,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$Swing},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Zoom:$Jease$.$InQuint,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InQuint},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:0.5,$Cols:2,$Zoom:1,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:4,$Cols:2,$Zoom:11,$SlideOut:true,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.6,$Zoom:1,$Rotate:1,$During:{$Left:[0.2,0.8],$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,x:-4,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Left:$Jease$.$InQuint,$Zoom:$Jease$.$InQuart,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InQuint},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:-0.6,$Zoom:1,$Rotate:1,$During:{$Left:[0.2,0.8],$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,x:4,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Left:$Jease$.$InQuint,$Zoom:$Jease$.$InQuart,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InQuint},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:0.5,y:0.3,$Cols:2,$Zoom:1,$Rotate:1,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1000,x:0.5,y:0.3,$Cols:2,$Zoom:1,$Rotate:1,$SlideOut:true,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InExpo,$Top:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InExpo},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1200,x:-4,y:2,$Rows:2,$Zoom:11,$Rotate:1,$Assembly:2049,$ChessMode:{$Row:28},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1200,x:1,y:2,$Cols:2,$Zoom:11,$Rotate:1,$Assembly:2049,$ChessMode:{$Column:19},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.8}}
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Rows: 2,
                $SpacingX: 14,
                $SpacingY: 12,
                $Orientation: 2,
                $Align: 156
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 960;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        });
    </script>
	
	<!-- #region Jssor Slider Begin -->
	<script>
	// Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("div_button2");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];  
        
        // Get the <img> element that closes the modal
        //var img = document.getElementsById("img_click");                                          
 
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
        
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
	</script>
</body>
</html>