<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 수정할 Style선택</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<style>
img{
	width: 250px;
	height : 300px;
}
</style>
<body>

<!-- 데이터베이스에 정보가 없을 경우 -->
<c:if test="${empty StyleList}">
		<h2>데이터베이스에 등록된 정보가 없습니다.</h2>
</c:if>

<c:forEach items="${StyleList}" var="style">
	<a href="<c:url value='adminUpdate'/>?num=${style.num}">
		<img src="/resources/admin/${style.img}" />
	</a>
</c:forEach>

<br/>
<br/>
<div class="container" align="center">
<form id="frm" method="GET" action="parsing">
	<table>
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
				<button class="btn btn-outline-info" onClick="submit2()">등록</button>
			</td>
		</tr>
	</table>
</form>
</div>
<script>
	
    function submit2(){
        if(document.getElementById("Category1").checked != true &&
           document.getElementById("Category2").checked != true &&
           document.getElementById("Category3").checked != true &&
           document.getElementById("Category4").checked != true)
        {
            alert("처리상태를 체크해주십시오.");
            document.getElementById("Category1").focus();
            return;
        }
        else
        {
        	document.getElementById("frm").submit();	
        }
    }

</script>
</body>
</html>