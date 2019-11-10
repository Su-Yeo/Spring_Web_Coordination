<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Recommendation</title>
</head>
<style>
	h2 {
		color: #000;
		font-size: 26px;
		font-weight: 300;
		text-align: center;
		text-transform: uppercase;
		position: relative;
		margin: 30px 0 80px;
	}
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: none; color: black;}
	.img_polaroid img{
		width:340px;
	}
	.cropping{
		max-height:370px;
		overflow:hidden;
	}
	.cropping img{
		max-height:initial;
	}
	.imgstyle{
		max-width: 100%;
		height: auto;
	}
	/* Image Polaroid */
	div.img_polaroid {
		display: inline-block;
		background-color: white;
		margin: 10px 15px;
		border: 1px solid gray;
	}
	div.img_polaroid:hover {
		border: 1px solid red;
	}
	
	div.img_container {
		text-align: left;
		padding: 10px 20px;
	}
	div.img_container div {
		margin-top: 5px;
	}
	.title{
		margin:1%;
		font-size:30pt;
	}
	/*----------------------------태블릿----------------------------*/
	@media all and (min-width: 600px) and (max-width: 1279px) {
		
		.title{
			margin:1%;
			font-size:25pt;
		}
	}
	/*----------------------------태블릿끝----------------------------*/

	/*----------------------------모바일----------------------------*/
	@media all and (max-width: 600px){
		.title{
			position:absolute;
    		overflow:hidden;
    		font-size:0;

		}
		.table1 td{
			width:100%;
			height:150px;
			float:left;
			padding:10px;
			margin:0 auto;
		}
		.table1{
			height:450px;
		}
		.weatherTable{
			width:90%;
			margin:0 auto;
			margin-top:20px;
			text-align:center;
		}
	}
	/*----------------------------모바일끝----------------------------*/
		.card-img-top {
            width: 100%;
            height: 380px;
            object-fit: cover;
        }
</style>
<body>
	<!-- Nav -->
	<jsp:include page="../nav.jsp" />
	<!-- End Nav -->
	
	<!-- Image Recommendation -->
	<div id="div_include" align="center">
		<c:if test="${empty StyleList}" >
			<h2>해당 코디에 대한 정보가 없습니다.</h2>
			<br>
			<button class="btn btn-primary btn-block btn-lg" style="background: #61C7C1; width: 140px; height: 50px;" onclick="history.back();">돌아가기</button>
		</c:if>
		<!-- 사용자가 선택한 의상과 색상의 옷을 입은 코디룩만을 추천 -->
		<c:forEach items="${StyleList}" var="style" begin="1" end="12" step="1">
			<div class="img_polaroid" style="cursor: pointer;" data-toggle="modal" data-target="#${style.num}">
				<img style="width:340px;" class="w3-border w3-hover-border-red card-img-top" src="/displayImg?name=${style.img}&folder=admin" />
				
				<div class="img_container">
					<div><b>${style.shopname}</b></div>
				</div>
			</div>
			
			<!-- Image Model -->
			<div id="${style.num}" class="modal fade">
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
										<input type="submit" class="btn btn-primary btn-block btn-lg" style="background: #61C7C1;" value="저장하기">
									</form>
								</c:if>
								<br/>
								
								<button type="button" class="btn btn-primary btn-block btn-lg" style="background: #EBFFEB; color: black;" data-dismiss="modal">돌아가기</button>
							</div>			
						</div>
					</div>
				</div>
			</div>
			<!-- End Image Model -->
		</c:forEach>
	</div>
	<!-- End Image Recommendation -->
	
	<c:if test="${not empty StyleList}" >
		<!-- Pagination -->
		<div id="paginationBox" align="center">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
					</li>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
							${idx} </a></li>
				</c:forEach>

				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- End Pagination -->

		<c:url var="getBoardListURL" value="adminIdentify">
			<c:param name="page" value="${pagination.page}" />
			<c:param name="range" value="${pagination.range}" />
		</c:url>
	</c:if>

	<script>
	
		//이전 버튼 클릭
		function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "Recommendation";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
		}

		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "Recommendation";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
		}

		//다음 버튼 클릭
		function fn_next(page, range, rangeSize) {

			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;

			var url = "Recommendation";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
		}
	</script>
</body>
</html>