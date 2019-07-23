<%@page import="java.util.Map"%>
<%@page import="com.coordination.weather.CoordFetcher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
function selTop(s){
    $.ajax({
        type : "POST",
        url : "/main/weather/selTop",
        data: "selTop="+s,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	var obj = JSON.parse(data);
    		$("#selectBox2").find("option").remove();
        	$.each(obj, function(index,entry){
                $('#selectBox2').append("<option value='" + entry.value+ "'>" + entry.value + "</option>");
     	   });
        }   
    });
}

function selMdl(s2){
    $.ajax({
        type : "POST",
        url : "/main/weather/selMdl",
        data: "selMdl="+s2,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	var obj = JSON.parse(data);
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
        url : "/main/weather/selLeaf",
        data: "selLeaf="+s3,
        dataType: "text",
        error : function(data,xhr,status,error){
            alert(xhr+", "+status+", "+error);
        },
        success : function(data){
        	alert('통신성공!!');
        	text.innerHTML ="";
        	var obj = JSON.parse(data);
        	var arr1 =obj.filter( 
      			function (item) { 
      				return item.category == 'TMN' || item.category == 'TMX'
      		}); 
      		text.innerHTML += '최저-'+arr1[0].fcstValue+'℃<br>'; 
      		text.innerHTML += '최고-'+arr1[1].fcstValue+'℃<br>'; 
      		
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
      		text.innerHTML += arr[0].fcstValue+'℃';

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
      					if(item.fcstValue=='1'){text.innerHTML += '<img src="resources/img/weather/sun.png" style="width:250px; height:250px;"><br>';} 
      					else if(item.fcstValue=='2'){text.innerHTML += '구름조금<br>';} 
      					else if(item.fcstValue=='3'){text.innerHTML += '<img src="resources/img/weather/cloudsun.png" style="width:250px; height:250px;"><br>';} 
      					else{text.innerHTML += '<img src="resources/img/weather/cloud.png" style="width:250px; height:250px;"><br>';}
      				}); 
      			} 
      			else if(item.fcstValue=='1'){text.innerHTML += '<img src="resources/img/weather/rain.png" style="width:250px; height:250px;"><br>';} 
      			else if(item.fcstValue=='2'){text.innerHTML += '비/눈<br>';} 
      			else if(item.fcstValue=='3'){text.innerHTML += '<img src="resources/img/weather/snow.png" style="width:250px; height:250px;"><br>';} 
      			else{text.innerHTML += '<img src="resources/img/weather/rain2.png" style="width:250px; height:250px;"><br>';}
      		}); 
        }   
    });
}
</script>
</head>
<body>
<div id="weatherDiv">
<div id="selectDiv">
<%
CoordFetcher coord = new CoordFetcher();
%>
<select id="selectBox" onchange="selTop(this.value)">
<%
Map<String, String> mapTop = coord.getMap();
for(Map.Entry<String,String> entry : mapTop.entrySet()){
%>
  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
<%}%>
</select>

<select id="selectBox2" onchange="selMdl(this.value)"></select>

<select id="selectBox3" onchange="selLeaf(this.value)"></select>
</div>
<div id="text"></div>

</div>
</body>
</html>