<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: none; color: black;}


	.img_copping{
		width:340px;
		max-height:340px;
		overflow:hidden;
	}
	.img_polaroid img{
		width:100%;
		max-height:initial;
	}
  
    
	/*----------------------------태블릿----------------------------*/
	@media all and (min-width: 600px) and (max-width: 1279px) {
	
		.img_copping{
			width:320px;
			max-height:320px;
			overflow:hidden;
		}
	}
	/*----------------------------태블릿끝----------------------------*/
	
	/*----------------------------모바일----------------------------*/
	@media all and (max-width: 600px){
		
		.img_copping{
			width:100%;
		}
		.img_polaroid{
			width:90%;
		}
	}
	/*----------------------------모바일끝----------------------------*/
</style>
</head>
<body>
	<!-- <div style="clear:left">
		<p class="p2" style="font-size:24px">Today's Coordination</p>
	</div> -->
	<div id="div_include">
		<c:forEach items="${TemperatureStyle}" var="style" begin="1" end="12" step="1"> 
			<div class="img_polaroid" style="cursor: pointer;" data-toggle="modal" data-target="#${ style.num }">
				<div class="img_copping">
				<img class="w3-border w3-hover-border-red" src="/displayImg?name=${style.img}&folder=admin" />
				</div>
				<div class="img_container">
					<div><b>${style.shopname}</b></div>
					<div>좋아요 : #명 <span style="margin: 0 0 0 55%;">버튼</span></div>
				</div>
			</div>
			<!-- Image Model -->
			<div id="${ style.num }" class="modal fade" align="center">
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
								<button type="button" class="btn btn-primary btn-block btn-lg" style="background: #FFF0F5; color: black;" data-dismiss="modal">돌아가기</button>
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