<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>

<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var userid = $("#id").val();
			var passwd = $('#password').val();
			
			if (userid == "") {
				$('#id_invalidate').text("아이디를 입력해주세요");
				$('#id').focus();
				//return;
			}
			if(passwd == "") {
				$('#pwd_invalidate').text("비밀번호를 입력해주세요");
			}
/* 			$('.loginForm').submit();
			var data = "id=" + userid + "&password=" + passwd;
			
			$.ajax({
				type : "POST",
				data : data,
				url : action,
				success : function(value) {
					$('loginForm').submit();
				}
			}); */
		});
	});
</script>
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
	<form name="loginForm" method="post" action="loginCheck">
		<table cellpadding="5" align = "center">
			<tr>
				<td align = "center">
					<input type="text" id="id" name="id" maxlength="30" placeholder="아이디" pattern="[A-Za-z0-9]{4,}" autofocus required><br/>
					<span id="id_invalidate"></span>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<input type="password" id="password" name="password" maxlength="50" placeholder="비밀번호" autofocus required><br/>
					<span id="pwd_invalidate"></span>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<input type="button" value="로 그 인" id="btnLogin">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>