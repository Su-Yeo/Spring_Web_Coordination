<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/admin/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/admin/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/admin/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/admin/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/admin/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->
<meta charset="UTF-8">
<title>관리자 - ImageParsingList</title>
</head>
<style>
	img{
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
	
	.size{
		width: 100px;
		height: 35px;
	}
	.size:hover{
		background-color: #17A2B8;
		background-position: #ffffff;
	}
</style>
<body>

<div class="container" align="center">
<form id="frm" method="GET" action="parsing">
	<table>
		<tr>
			<td colspan="2" align="center">
				<input type="radio" id="shopName1" name="shopName" value="언더70" class="form-control">언더70
			</td>
			<td colspan="2" align="center">
				<input type="radio" id="shopName2" name="shopName" value="바이슬림" class="form-control">바이슬림
			</td>
		</tr>
		<tr>
			<td width="100" align="center">
				<img src="/resources/admin/outer.jpg" />
			</td>
			<td width="100" align="center">
				<img src="/resources/admin/tshirt.jpg" />
			</td>
			<td width="100" align="center">
				<img src="/resources/admin/half-tshirt.jpg" />
			</td>
			<td width="100" align="center">
				<img src="/resources/admin/hood.jpg" />
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="radio" id="Category1" name="Category" value="1" class="form-control">Outer
			</td>
			<td align="center">
				<input type="radio" id="Category2" name="Category" value="2" class="form-control">T-shirt
			</td>
			<td align="center">
				<input type="radio" id="Category3" name="Category" value="3" class="form-control">Half-Tshirt
			</td>
			<td align="center">
				<input type="radio" id="Category4" name="Category" value="4" class="form-control">Hood
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<!-- btn-outline-info -->
				<input type="button" class="form-control size" onClick="submit2();" value="등록" />
			</td>
		</tr>
	</table>
</form>
</div>
<script>
	
    function submit2(){
    	
    	if( document.getElementById("shopName1").checked != true &&
    	    document.getElementById("shopName2").checked != true)
    	{
    		alert('데이터 등록할 쇼핑몰을 선택해주세요.');
    		document.getElementById("shopName1").focus();
    		return;
    	}
  
        if(document.getElementById("Category1").checked != true &&
           document.getElementById("Category2").checked != true &&
           document.getElementById("Category3").checked != true &&
           document.getElementById("Category4").checked != true)
        {
            alert("카테고리를 체크해주십시오.");
            document.getElementById("Category1").focus();
            
            return;
        }
        
        document.getElementById("frm").submit();
    }
</script>
</body>
</html>