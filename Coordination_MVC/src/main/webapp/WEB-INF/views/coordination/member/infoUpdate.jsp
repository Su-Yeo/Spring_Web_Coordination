<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		min-width: 400px;
		max-width: 60%;
		margin: 0 auto;
	}
	.info_table {
		width: 100%;
	}
	.info_table th{
		width: 20%;
		height: 50px;
		font-size: 0.9vm;
		border-bottom: 1px solid rgba(204, 204 ,204 , .4);
	}
	.info_table td{
		width: 40%;
		height: 50px;
		font-size: 1vm;
		border-bottom: 1px solid rgba(204, 204 ,204 , .4);
	}
	.modify_btn{
		width: 125px;
		height: 30px;
		font-size: 1vm;
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
	.modify_cancle_btn, .modify_ok_btn {
		width: 62.5px;
		height: 30px;
		background-color: white;
		font-size: 1vm;
		border: 1px solid rgba(204, 204 ,204 , .4);
		-webkit-transition: border 0.2s ease;
    	-moz-transition: border 0.2s ease;
    	-o-transition: border 0.2s ease;
    	transition: border 0.2s ease;
	}
	.modify_cancle_btn:hover, .modify_ok_btn:hover {
		border: 1px solid black;
	}
	
	/* info-Modify */
	.info-modify{
		margin: 30px 0;
	}
	.input {
		height: 50px;
	}
	.input label {
		width: 150px;
	}
	
	/* 회원탈퇴 */
	.delete_font {
		font-size: 0.7vm;
		color: rgba(204, 204 ,204 , .4);
	}
	
	@media ( max-width: )
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
		var phoneI = document.getElementById('newPhone');
		
		phoneA.style.display = '';
		phoneCA.style.display = 'none';
		phoneI.value = "";
	}
	
	/* 회원 탈퇴 클릭 */
	function delete_member(){
		var frm = document.getElementById('deleteForm');
		
		if(confirm('정말로 탈퇴하시겠습니까?')) {
			frm.submit();	
		} else {
			
		}
	}
	
	/* 페이지 최초 로드 */
 	$(document).ready(function(){
 		document.getElementById('password_change_area').style.display = 'none';
 		document.getElementById('phone_change_area').style.display = 'none';
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
							<form id="pwd_modify_form" method="post" action="updateMember">
								<div class="input">		
									<label for="">변경 비밀번호</label>
										<input type="password" class="pwd_input" id="newPassword" name="password" required>
										<input type="hidden" value="${ sessionScope.userId }" name="id"/>
										<input type="hidden" value="${ member.phone }" name="phone"/>
								</div>
								<div class="button_group">
									<input type="button" class="modify_cancle_btn" value="취소" onclick="pwd_modify_close()" /> 
									<input type="submit" class="modify_ok_btn" value="확인"/>
								</div>
							</form>
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
							<form method="post" action="updateMember">
								<div class="input">
									<input type="text" id="newPhone" name="phone" placeholder="휴대전화 번호 입력 " pattern="(010)\d{3,4}\d{4}" required />
								</div>
								<div class="button_group">
										<input type="button" class="modify_cancle_btn" value="취소" onclick="phone_modify_close()" /> 
										<input type="submit" class="modify_ok_btn" value="확인"/>
										<input type="hidden" value="${ sessionScope.userId }" name="id"/>
										<input type="hidden" value="${ member.password }" name="password"/>
								</div>
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table><br/>
		<form id="deleteForm" method="get" action="deleteMember">
			<input type="hidden" name="id" value="${ sessionScope.userId }"/>
			<p class="delete_font">회원탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요 <input type="button" class="modify_btn" value="회원탈퇴" onclick="delete_member()"></p>
		</form>
	</div>
</body>
</html>