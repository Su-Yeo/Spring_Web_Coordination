<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="../dist/css/style.css">
<script src="../dist/js/jquery-1.11.3.min.js"></script>

</head>
<body>
<br/>
<div class="menubar" style="margin:0 auto;padding:20px;">
	<div style="display: inline-block;text-align:center">
		<div style="margin-top:8px;">
		<font weight="bold" style="font-size:13px;">Clothes</font><br/>
		<span class="custom-dropdown">
		  <select>
		     <option>T-Shirt</option> 
		      <option>Shirt</option>  
		        <option>hood</option>
		    <option>cardigan</option>
		     <option>jacket</option>
		  </select>
		</span>
		</div><br>
		<div class="Container" style="margin-top:8px;" ><br/>
		  <font weight="bold" style="font-size:13px;">Height</font><br/>
		  <input style = "width:200px;" class="slider_range" type="range" value="150" min="150" max="200" step="5"  oninput="document.getElementById('slider_value_view').innerHTML=this.value+'cm';"></input><br/>
		  <span id = "slider_value_view" style="font-size:11px">150cm</span><br> 
		</div><br>
		<div style="margin-top:25px;">
			<font wieght="bold" style="font-size:13px">Clothes-Color</font><br/>
			<span class="color-picker"></span>
		</div>
	</div>
</div>
 <script src='http://ajax.googleapis.com/ajax/libs/prototype/1.7.1/prototype.js'></script>
  <script  src="../dist/js/index.js"></script>
<!-- https://codepen.io/seanstopnik/pen/CeLqA -->
</body>
</html>