<%@page import="com.coordination.weather.Coord"%>
<%@page import="java.util.Map"%>
<%@page import="com.coordination.weather.CoordFetcher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#weatherDiv{
		height:550px;
	}
	.weatherImg img{
		width:400px;
		height:400px;
		margin:-100px;
	}
	#weather1{
		font-size:150px;
	}
	#weather{
		font-size:35px;
	}
/*----------------------------태블릿----------------------------*/
@media all and (min-width: 600px) and (max-width: 1279px) {
	.weatherImg img{
		width:300px;
		height:300px;
		margin:-40px;
	}
	#weather1{
		font-size:130px;
	}
	#weather{
		font-size:25px;
	}
}
/*----------------------------태블릿끝----------------------------*/

/*----------------------------모바일----------------------------*/
@media all and (max-width: 600px){
	#weatherDiv{
		height:350px;
	}
	.weatherImg img{
		width:200px;
		height:200px;
		margin:-20px;
		margin-bottom:-30px;
	}
	#weather1{
		font-size:70px;
	}
	#weather{
		font-size:15px;
	}
	.custom-dropdown {
		font-size:0.6em;
	}
}
/*----------------------------모바일끝----------------------------*/
</style>
<link rel="stylesheet" href="/resources/css/style.css">
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
function selTop(s){
    $.ajax({
        type : "POST",
        url : "/weather/selTop",
        data: "selTop="+s,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	var obj = JSON.parse(data);
    		$("#selectBox2").find("option").remove();
    		$("#selectBox3").find("option").remove();
    		$('#selectBox2').append("<option>선택해주세요</option>");
    		$('#selectBox3').append("<option>선택해주세요</option>");
        	$.each(obj, function(index,entry){
                $('#selectBox2').append("<option value='" + entry.value+ "'>" + entry.value + "</option>");
     	    });
        }   
    });
}

function selMdl(s2){
    $.ajax({
        type : "POST",
        url : "/weather/selMdl",
        data: "selMdl="+s2,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	var obj = JSON.parse(data);
        	$("#selectBox2 option:first").remove();
    		$("#selectBox3").find("option").remove();
        	$.each(obj, function(index,entry){
                //alert("code : "+ entry.code +", value : "+ entry.value);
        		$('#selectBox3').append("<option value='" + entry.value+ "'>" + entry.value + "</option>");
     	   });
        }   
    });
}

function selLeaf(s3){
    $.ajax({
        type : "POST",
        url : "/weather/selLeaf",
        data: "selLeaf="+s3,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	text.innerHTML ="";
        	weather.innerHTML ="";
        	weather1.innerHTML ="";
        	var obj = JSON.parse(data);
        	var arr1 =obj.filter( 
      			function (item) { 
      				return item.category == 'TMN' || item.category == 'TMX'
      		});
        	//위젯 최저온도
      		weather.innerHTML += arr1[0].fcstValue+'℃ / ';
        	//위젯 최고온도
      		weather.innerHTML += arr1[1].fcstValue+'℃';
      		
      		$.ajax({
      		    type : "POST",
      		  	async : true,
      		    url : "/style",
      		    data : {"tmn" : arr1[0].fcstValue, "tmx" : arr1[1].fcstValue},
      		    dataType: "text",
      		    error : function(xhr,status,error){
      		        alert('통신실패!! style');
      		      	alert(xhr+", "+status+", "+error);
      		    },
      		    success : function(data){
      		    	$("div#div_include").html(data);
      		    }   
      		});
      		
      		//3시간마다 구하기
      		var today = new Date();
      		var time = today.getHours();
      		if(time <= 1){
      			time = 0;
      		}
      		else if(time <= 4){
      			time = 3;
      		}
      		else if(time <= 7){
      			time = 6;
      		}
      		else if(time <= 10){
      			time = 9;
      		}
      		else if(time <= 13){
      			time = 12;
      		}
      		else if(time <= 16){
      			time = 15;
      		}
      		else if(time <= 19){
      			time = 18;
      		}
      		else if(time <= 22){
      			time = 21;
      		}
      		else if(time < 24){
      			time = 0;
      		}
      		var time2 = String(time);
      		if(time < 10){
      			time2 = "0" + time2 + "00";
      		}
      		else{
      			time2 = time2 + "00";
      		}
      		console.log(time2);
      		
      		//3시간 온도
      		var arr = obj.filter( 
      		function (item) { 
      			return item.category == 'T3H' && item.fcstTime == time2;
      		} );
      		//위젯 현재 온도
      		weather1.innerHTML += arr[0].fcstValue+'℃';

      		//3시간 날씨
      		var arr = obj.filter( 
      		function (item) { 
      			return item.category == 'PTY' && item.fcstTime == time2;
      		}); 
      		arr.forEach(function (item, index, array) {
      			if(item.fcstValue=='0'){ 
      				var arr = obj.filter( 
      				function (item2) { 
      					return item2.category == 'SKY' && item2.fcstTime == item.fcstTime 
      				}); 
      				arr.forEach(function (item, index, array) { 
      					if(item.fcstValue=='1'){text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/sun.png"></div>';} 
      					else if(item.fcstValue=='2'){text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/sun.png"></div>';} 
      					else if(item.fcstValue=='3'){text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/cloudsun.png"></div>';} 
      					else{text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/cloud.png"></div>';}
      				}); 
      			} 
      			else if(item.fcstValue=='1'){text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/rain.png"></div>';} 
      			else if(item.fcstValue=='2'){text.innerHTML += '비/눈<br>';} 
      			else if(item.fcstValue=='3'){text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/snow.png"></div>';} 
      			else{text.innerHTML += '<div class="weatherImg"><img src="resources/img/weather/rain2.png"></div>';}
      		}); 
        }   
    });
}
</script>
</head>
<body>
<div id="weatherDiv" style="width:100%;background:#222222;color:#FFFFFF;border-radius:10px;">
	<div id="selectDiv" style="text-align:right">
		<%
		CoordFetcher coord = new CoordFetcher();
		%>
		<span class="custom-dropdown">
		<select id="selectBox" onchange="selTop(this.value)">
		<%
		Map<String, String> mapTop = coord.getMap();
		for(Map.Entry<String,String> entry : mapTop.entrySet()){
		%>
		  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
		<%}%>
		</select>
		</span>
		<span class="custom-dropdown">
		<select id="selectBox2" onchange="selMdl(this.value)">
		<%
		Map<String, String> mapMdl = coord.getMapMdlInit("경기도");
		for(Map.Entry<String,String> entry : mapMdl.entrySet()){
		%>
		  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
		<%}%>
		</select>
		</span>
		<span class="custom-dropdown">
		<select id="selectBox3" onchange="selLeaf(this.value)">
		<%
		Map<String, Coord> mapLeaf = coord.getMapLeafInit("경기도", "부천시소사구");
		for(Map.Entry<String,Coord> entry : mapLeaf.entrySet()){
		%>
		  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
		<%}%>
		</select>
		</span>
		<script>
			$("#selectBox").val("경기도").attr("selected","selected");
			$("#selectBox2").val("부천시소사구").attr("selected","selected");
			$("#selectBox3").val("괴안동").attr("selected","selected");
			selLeaf("괴안동");
		</script>
	</div>
	<div style="width:100%;height:90%;">
		<div style="width:70%;margin:0 auto;">
			<div id="text"></div>
			<div style="margin:10px;">
				<div id="weather1"></div>
				<div id="weather"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>