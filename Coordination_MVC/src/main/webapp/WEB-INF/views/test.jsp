<!-- 화면 -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../dist/css/style2.css">
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
</head>
<body>
<div id="weatherDiv" style="width:700px;background:#222222;color:#FFFFFF;border-radius:20px;margin:0 auto;padding:10px;">
<div id="selectDiv" style="text-align:right">
<%
	CoordFetcher coord = new CoordFetcher();
String loc = request.getParameter("loc");
%>
<span class="custom-dropdown">
<select id="selectBox" onchange="sel(this.value)" onmousedown="init()">
<option value="초기" selected>경기도</option>
<%
	Map<String, String> mapTop = coord.getMap();
for(Map.Entry<String,String> entry : mapTop.entrySet()){
%>
  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
<%
	}
%>
</select>
</span>
<span class="custom-dropdown">
<select id="selectBox2" onchange="sel2(this.value)">
<%
	if(loc==null){
%>
	<option value="초기">부천시소사구</option>
<%
	}else{
Map<String, String> mapMdl = coord.getMapMdl(loc);
for(Map.Entry<String,String> entry : mapMdl.entrySet()){
%>
  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
<%
	}
}
%>
</select>
</span>
<%
	String mdl = request.getParameter("loc2");
%>
<span class="custom-dropdown">
<select id="selectBox3" onchange="sel3(this.value)">
<%
	if(mdl==null){
%>	
<option value="초기">괴안동</option>
<%
	}else{
Map<String, Coord> mapleaf = coord.getMapLeaf(loc,mdl);
for(Map.Entry<String,Coord> entry : mapleaf.entrySet()){
%>
  <option value=<%=entry.getKey()%>><%=entry.getKey()%></option>
<%
	}
}
%>
</select>
</span>
<br>
<%
	String leaf = request.getParameter("loc3");
String[] location = null;
if(loc!=null&&(mdl==null||leaf==null)){
}else{
	if(loc==null&&mdl==null&&leaf==null){
		location = new String[]{"경기도","부천시소사구","괴안동"};
	}else if(loc!=null&&mdl!=null&&leaf!=null){
		location = new String[]{loc,mdl,leaf};
	}
	ApiExplorerWeather api = new ApiExplorerWeather(coord.fetchCoord(location));
	JsonArray js = api.getJArray();
%>
</div>
<div style="height:350px;">
<div id="weather2" style="margin-left:16%;float:left;"></div>
<div id="weather1" style="width:100%;height:250px;font-size:90px;padding-top:80px;margin-left:-90px;"></div>
<div id="weather" style="font-size:25px;margin-top:-70px;"></div>
<script>
var arr1 =<%=js%>.filter( 
function (item) { 
	return item.category == 'TMN' 
}); 
//위젯 최저
weather.innerHTML += arr1[0].fcstValue+'℃ / '; 
//weather.innerHTML += '3℃ / '; 

var arr2 = <%=js%>.filter( 
function (item) { 
	return item.category == 'TMX' 
});
//위젯 최고
weather.innerHTML += arr2[0].fcstValue+'℃'; 
//weather.innerHTML += '8℃'; 

$.ajax({
    type : "GET",
    //값 넘기기
    url : "imageView.jsp?tmn="+arr1[0].fcstValue+"&tmx="+arr2[0].fcstValue,
    //url : "imageView.jsp?tmn=3&tmx=8",
    dataType: "text",
    error : function(){
        alert('통신실패!!');
    },
    success : function(data){
    	$("div#div_include").html(data);
    }   
});

<%
Date today = new Date();
SimpleDateFormat timeHours = new SimpleDateFormat("HH");
int time = Integer.parseInt(timeHours.format(today).toString());
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
String time2 = String.valueOf(time);
if(time < 10){
	time2 = "0" + time2 + "00";
}
else{
	time2 = time2 + "00";
}
System.out.println(time2);
%>
//3시간 온도
var arr = <%=js%>.filter( 
function (item) { 
	return item.category == 'T3H' && item.fcstTime == <%=time2%>
} ); 
//위젯 현재 온도
weather1.innerHTML += arr[0].fcstValue+'℃';
//weather1.innerHTML += '5℃';

//3시간 날씨
var arr = <%=js%>.filter( 
function (item) { 
	return item.category == 'PTY' && item.fcstTime == <%=time2%>
}); 
arr.forEach(function (item, index, array) {
	if(item.fcstValue=='0'){ 
		var arr = <%=js%>.filter( 
		function (item2) { 
			return item2.category == 'SKY' && item2.fcstTime == item.fcstTime 
		}); 
		arr.forEach(function (item, index, array) { 
			if(item.fcstValue=='1'){weather2.innerHTML += '<img src="img/weather/sun.png" style="width:250px; height:250px;"><br>';} 
			else if(item.fcstValue=='2'){weather2.innerHTML += '구름조금<br>';} 
			else if(item.fcstValue=='3'){weather2.innerHTML += '<img src="img/weather/cloudsun.png" style="width:250px; height:250px;"><br>';} 
			else{weather2.innerHTML += '<img src="img/weather/cloud.png" style="width:250px; height:250px;"><br>';}
		}); 
	} 
	else if(item.fcstValue=='1'){weather2.innerHTML += '<img src="img/weather/rain.png" style="width:250px; height:250px;"><br>';} 
	else if(item.fcstValue=='2'){weather2.innerHTML += '비/눈<br>';} 
	else if(item.fcstValue=='3'){weather2.innerHTML += '<img src="img/weather/snow.png" style="width:250px; height:250px;"><br>';} 
	else{weather2.innerHTML += '<img src="img/weather/rain2.png" style="width:250px; height:250px;"><br>';}
}); 
</script>
<%}%>
</div>
</div>
</body>
</html>