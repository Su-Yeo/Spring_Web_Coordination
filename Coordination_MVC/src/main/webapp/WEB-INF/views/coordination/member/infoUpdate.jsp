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
		border: solid 2px black;
	}
	
	/* Table */
	.info_table {
		border: 1px 0px solid gray;
	}
	.info_table th{
		width: 200px;
	}
	.info_table td{
		width: 500px;
	}
</style>
</head>
<body>
<!-- Nav -->
<jsp:include page="../nav.jsp"></jsp:include>
<!-- End Nav -->
<br/>
	<h1 class="tit">기본 회원정보 <span>필수</span></h1>
	<hr class="tit_hr">
	<table class="info_table">
		<tr>
		<c:if test="${empty MemberList}">
			<h2>잘못된 접근입니다.</h2>
		</c:if>
		<c:forEach items="${MemberList}" var="member">
			<tr>
				<th>
					아이디
				</th>
				<td>
					<strong>${sessionScope.userId}</strong>
				</td>
			</tr>
			<tr>
				<th>
					비밀번호
				</th>
				<td>
					<strong>********</strong>
				</td>
			</tr>
			<tr>
				<th>
					이름(실명)
				</th>
				<td>
					<strong>${sessionScope.userName}</strong>
				</td>
			</tr>
			<tr>
				<th>
					휴대전화
				</th>
				<td>
					<strong>${member.phone}</strong>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>