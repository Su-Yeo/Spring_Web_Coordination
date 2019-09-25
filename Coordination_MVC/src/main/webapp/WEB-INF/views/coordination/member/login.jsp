<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div align = "center">
	<b>Login</b>
	<form name="loginForm" method="post" action="#">
		<table cellpadding="5" align = "center">
			<tr>
				<td align = "center">
					<input type="text" name="uid" maxlength="30" placeholder="아이디" pattern="[A-Za-z0-9]{4,}" autofocus required>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<input type="password" name="upwd" maxlength="50" placeholder="비밀번호" autofocus required>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<input type="submit" value="로 그 인">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>