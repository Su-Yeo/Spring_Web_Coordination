<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoUpdatePage</title>
<style>
	/* Title */
	.tit {
		font-size: 24px;
		font-weight: bold;
	}
	.tit span {
		color: gray;
	}
	.tit_hr {
		border: solid 1.5px black;
	}
	
	/* Table */
	.info_div {
		width: 60%;
		margin: 0 auto;
	}
	.info_table {
		width: 100%;
	}
	.info_table th{
		width: 200px;
		height: 50px;
		border-bottom: 1px solid rgba(204, 204 ,204 , .4);
	}
	.info_table td{
		width: 350px;
		height: 50px;
		border-bottom: 1px solid rgba(204, 204 ,204 , .4);
	}
	.modify_btn{
		width: 125px;
		height: 30px;
		background-color: white;
		border: 1px solid rgba(204, 204 ,204 , .4);
		-webkit-transition: border 0.2s ease;
    	-moz-transition: border 0.2s ease;
    	-o-transition: border 0.2s ease;
    	transition: border 0.2s ease;
	}
	.modify_btn:hover {
		border: 1px solid black;
	}
	
	/* info-Modify */
	.info-modify{
		margin: 35px;
	}
	.input {
		height: 50px;
	}
	.input label {
		width: 150px;
	}
	
	/* 회원탈퇴 */
	.delete_font {
		color: rgba(204, 204 ,204 , .4);
	}
</style>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	/* 비밀번호 변경 버튼 클릭 */
	function pwd_modify_open(){
		var pwdA = document.getElementById('password_area');
		var pwdCA = document.getElementById('password_change_area');
		
		pwdA.style.display = 'none';
		pwdCA.style.display = '';
	}
	/* 비밀번호 변경 취소 클릭 */
	function pwd_modify_close(){
		var pwdA = document.getElementById('password_area');
		var pwdCA = document.getElementById('password_change_area');
		
		pwdA.style.display = '';
		pwdCA.style.display = 'none';
	}
	
	/* 휴대전화 변경 버튼 클릭 */
	function phone_modify_open(){
		var phoneA = document.getElementById('phone_area');
		var phoneCA = document.getElementById('phone_change_area');
		
		phoneA.style.display = 'none';
		phoneCA.style.display = '';
	}
	/* 휴대전화 변경 취소 클릭 */
	function phone_modify_close(){
		var phoneA = document.getElementById('phone_area');
		var phoneCA = document.getElementById('phone_change_area');
		
		phoneA.style.display = '';
		phoneCA.style.display = 'none';
	}
	
	/* 페이지 최초 로드 */
 	$(document).ready(function(){
 		document.getElementById('password_change_area').style.display = 'none';
 		document.getElementById('phone_change_area').style.display = 'none';
 		
 		$('#password').change(function(){
 			var op = document.getElementById('op').value;
 			var ip = document.getElementById('password');
 			var spc = document.getElementById('span_pass_check');
 			
 			document.getElementById('check').setAttribute('value', op);
 			
 			if(ip != op){
 				spc.value = '비밀번호가 일치하지 않습니다.';
 				spc.style.color = 'red';
 			}
 			else{
 				spc.value = '비밀번호가 일치합니다.';
 				spc.style.color = 'skyblue';
 			}
 		})
 	});
</script>
</head>
<body>
<!-- Nav -->
<jsp:include page="../nav.jsp"></jsp:include>
<!-- End Nav -->
<br/>
	<h1 class="tit">기본 회원정보 <span>필수</span></h1>
	<hr class="tit_hr">
	<br/><br/>
	<div class="info_div">
		<table class="info_table">
			<tr> 
			<c:if test="${empty MemberList}">
				<td>
					<h2>잘못된 접근입니다.</h2>
				</td>
			</c:if>
			</tr>
			<c:forEach items="${MemberList}" var="member">
				<tr>
					<th>
						아이디
					</th>
					<td colspan="2">
						<strong>${sessionScope.userId}</strong>
					</td>
				</tr>
				<tr id="password_area">
					<th>
						비밀번호
					</th>
					<td>
						<strong>********</strong>
					</td>
					<td>
						<input type="button" class="modify_btn" id="pwd_change_btn" onclick="pwd_modify_open()" value="비밀번호 변경"/>
					</td>
				</tr>
				<tr id="password_change_area">
					<th>
						비밀번호
					</th>
					<td colspan="2">
						<div class="info-modify">
							<div class="input">
								<label for="">기존 비밀번호</label>
									<input type="password" class="pwd_input" id="password"">
										<span id="span_pass_check"></span>
											<input type="hidden" id="op" value="${ member.password }"/>
							</div>
							<div class="input">		
								<label for="">변경 비밀번호</label>
									<input type="password" class="pwd_input" id="newPassword">
							</div>
							<div class="input">
								<label for="">변경 비밀번호 재입력</label>
									<input type="password" class="pwd_input" id="checkPassword" onchange="checkPass()">
							</div>
							<div class="button_group">
								<input type="button" class="modify_cancle_btn" value="취소" onclick="pwd_modify_close()" /> 
								<input type="button" class="modify_ok_btn" value="확인" disabled />
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						이름(실명)
					</th>
					<td colspan="2">
						<strong>${sessionScope.userName}</strong>
					</td>
				</tr>
				<tr id="phone_area">
					<th>
						휴대전화
					</th>
					<td>
						<strong>${member.phone}</strong>
					</td>
					<td>
						<input type="button" class="modify_btn" id="phone_change_btn" onclick="phone_modify_open()" value="휴대전화 변경"/>
					</td>
				</tr>
				<tr id="phone_change_area">
					<th>
						휴대전화
					</th>
					<td colspan="2">
						<div class="info-modify">
							<div class="input">
								<input type="text" id="newPhone" placeholder="휴대전화 번호 입력"/>
							</div>
							<div class="button_group">
									<input type="button" class="modify_cancle_btn" value="취소" onclick="phone_modify_close()" /> 
									<input type="button" class="modify_ok_btn" value="확인" disabled />
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table><br/>
		<p class="delete_font">회원탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요 <input type="button" class="modify_btn" value="회원탈퇴"></p>
	</div>
</body>
</html>