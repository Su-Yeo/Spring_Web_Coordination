<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: none; color: black;}
	
	.imgstyle{
		max-width: 100%;
		height: auto;
	}
</style>
<!-- 
<script type="text/javascript">
	function dress_save() {
		var frm = document.getElementById('dressInsertForm');
		frm.submit();
	}
</script>
 -->
<body>
	<!-- <div style="clear:left">
		<p class="p2" style="font-size:24px">Today's Coordination</p>
	</div> -->

	<div id="div_include">
		<c:forEach items="${TemperatureStyle}" var="style" begin="1" end="12" step="1"> 
			<div class="img_polaroid" style="cursor: pointer;" data-toggle="modal" data-target="#${ style.num }">
					<img style="width:340px;" class="w3-border w3-hover-border-red" src="/displayImg?name=${style.img}&folder=admin" />
					<div class="img_container">
						<div><b>${style.shopname}</b></div>
						<div>좋아요 : #명 ${style.img} <span style="margin: 0 0 0 55%;">버튼</span></div>
					</div>
			</div>
			
			<!-- Image Model -->
			<div id="${ style.num }" class="modal fade">
				<div class="modal-dialog modal-login">
					<div class="modal-content">
						<div class="modal-header">
							<div align="center">
			                	<img style="width: 100%; height: 100%;" class="img-fluid" src="/displayImg?name=${style.img}&folder=admin">
			                </div>
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>
							</p>
							<div class="form-group">
								<c:if test="${!empty sessionScope.userId}">
									<form id="dressInsertForm" method="get" action="dressInsert">
										<input type="hidden" name="img" value="${ style.img }"/>
										<input type="submit" class="btn btn-primary btn-block btn-lg" value="저장하기">
									</form>
								</c:if><br/>
								<button type="button" class="btn btn-primary btn-block btn-lg" data-dismiss="modal">돌아가기</button>
							</div>			
						</div>
					</div>
				</div>
			</div>
			<!-- End Image Model -->
		</c:forEach>
	</div>
	<!-- <a href="#noticeModal" data-toggle="modal"></a> -->
</body>
</html>