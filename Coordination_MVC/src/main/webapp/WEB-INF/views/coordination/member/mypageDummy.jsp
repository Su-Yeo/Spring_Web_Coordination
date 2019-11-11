<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<link rel="stylesheet" href="/resources/css/swiper.min2.css">
<link rel="stylesheet" href="/resources/css/swiper.min3.css">
<link rel="stylesheet" href="/resources/css/import.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
	img {
	 width: 300px;
	 height: 330px;
	}
</style>
<body>

	<div>
		<c:forEach items="${dressroomList}" var="dressroom">
			<img class="swiper-img3" style="border: 1px solid gray; margin: 5px;" src="/displayImg?name=${dressroom.img}&folder=admin" />
		</c:forEach>
	</div>

	<!-- pagination{s} -->
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
	
	<c:url var="getBoardListURL" value="adminIdentify">
		<c:param name="page" value="${pagination.page}" />
		<c:param name="range" value="${pagination.range}" />
	</c:url>
	
	<!-- pagination{s} -->
	<script>
		//이전 버튼 클릭
		function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "isMyPage";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
		}

		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "isMyPage";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			alert(url);

			location.href = url;
		}

		//다음 버튼 클릭
		function fn_next(page, range, rangeSize) {

			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;

			var url = "isMyPage";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
		}
	</script>
	<!-- End pagination{s} -->
</body>
</html>