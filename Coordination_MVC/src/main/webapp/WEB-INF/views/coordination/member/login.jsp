<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<!-- 
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var userid = $("#id").val();
			var passwd = $('#password').val();
			
			if (userid == "") {
				$('#invalidate').text("아이디를 입력해주세요");
				$('#id').focus();
				return;
			}
			
			var exp = /^[A-Za-z0-9]{4,}$/; // 영문자와 숫자
			// 정규표현식.test(입력값) -> 규칙에 맞으면 true
			
			if(!exp.test(userid)){
				$('#invalidate').text("4자 이상의 영문자와 숫자만 입력가능합니다.");
				$('#id').focus();
				return;
			}
			else {
				$('#invalidate').text("");
			}
			
			if(passwd == "") {
				$('#invalidate').text("비밀번호를 입력해주세요");
				$('#password').focus();
				return;
			}
			$('#loginForm').submit();
			var data = "id=" + userid + "&password=" + passwd;

			$.ajax({
				type : "GET",
				data : data,
				url : action,
				success : function(data) {
					alert("값 전달 성공!!!");
				success : function(response) {
					  if(response.trim() == "success"){
						  alert("dddd");
					  }

					$('#loginForm').submit();
				}
			});
</script>
 -->
<style>
	span{
		color: red;
		font-size: 7px;
	}
</style>
</head>
<body>
<div align = "center">
	<b>Login</b>
	<form id="loginForm" method="post" action="loginCheck">
		<table cellpadding="5" align = "center">
			<tr>
				<td align = "center">
					<input type="text" id="id" name="id" maxlength="30" placeholder="아이디" autofocus required>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<input type="password" id="password" name="password" maxlength="50" placeholder="비밀번호" autofocus required><br/>
					<span id="invalidate"></span>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<!-- <input type="button" value="로 그 인" id="btnLogin"> -->
					<input type="submit" value="로 그 인" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>