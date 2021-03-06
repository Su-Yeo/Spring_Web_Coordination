<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="76x76" href="/resources/icon/admin/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/admin/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/admin/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/admin/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/admin/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<!-- End favicon -->

<!-- Carousel -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>관리자 - 수정．삭제Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
	body {
		font-family: "Open Sans", sans-serif;
	}
	h2 {
		color: #000;
		font-size: 26px;
		font-weight: 300;
		text-align: center;
		text-transform: uppercase;
		position: relative;
		margin: 30px 0 80px;
	}
	h2 b {
		color: #ffc000;
	}
	h2::after {
		content: "";
		width: 100px;
		position: absolute;
		margin: 0 auto;
		height: 4px;
		background: rgba(0, 0, 0, 0.2);
		left: 0;
		right: 0;
		bottom: -20px;
	}
	.carousel {
		margin: 50px auto;
		padding: 0 70px;
	}
	.carousel .item {
		min-height: 330px;
	    text-align: center;
		overflow: hidden;
	}
	.carousel .item .img-box {
		height: 160px;
		width: 100%;
		position: relative;
	}
	.carousel .item img {	
		max-width: 100%;
		max-height: 100%;
		display: inline-block;
		position: absolute;
		bottom: 0;
		margin: 0 auto;
		left: 0;
		right: 0;
	}
	.carousel .item h4 {
		font-size: 18px;
		margin: 10px 0;
	}
	.carousel .item .btn {
		color: #333;
	    border-radius: 0;
	    font-size: 11px;
	    text-transform: uppercase;
	    font-weight: bold;
	    background: none;
	    border: 1px solid #ccc;
	    padding: 5px 10px;
	    margin-top: 5px;
	    line-height: 16px;
	    width: 100px;
	    height: 40px;
	    border-radius: 15px;
	}
	.carousel .item .btn:hover, .carousel .item .btn:focus {
		color: #fff;
		background: #000;
		border-color: #000;
		box-shadow: none;
	}
	.carousel .item .btn i {
		font-size: 14px;
	    font-weight: bold;
	    margin-left: 5px;
	}
	.carousel .thumb-wrapper {
		text-align: center;
	}
	.carousel .thumb-content {
		padding: 15px;
	}
	.carousel .carousel-control {
		height: 100px;
	    width: 40px;
	    background: none;
	    margin: auto 0;
	    background: rgba(0, 0, 0, 0.2);
	}
	.carousel .carousel-control i {
	    font-size: 30px;
	    position: absolute;
	    top: 50%;
	    display: inline-block;
	    margin: -16px 0 0 0;
	    z-index: 5;
	    left: 0;
	    right: 0;
	    color: rgba(0, 0, 0, 0.8);
	    text-shadow: none;
	    font-weight: bold;
	}
	.carousel .item-price {
		font-size: 13px;
		padding: 2px 0;
	}
	.carousel .item-price strike {
		color: #999;
		margin-right: 5px;
	}
	.carousel .item-price span {
		color: #86bd57;
		font-size: 110%;
	}
	.carousel .carousel-control.left i {
		margin-left: -3px;
	}
	.carousel .carousel-control.left i {
		margin-right: -3px;
	}
	.carousel .carousel-indicators {
		bottom: -50px;
	}
	.carousel-indicators li, .carousel-indicators li.active {
		width: 10px;
		height: 10px;
		margin: 4px;
		border-radius: 50%;
		border-color: transparent;
	}
	.carousel-indicators li {	
		background: rgba(0, 0, 0, 0.2);
	}
	.carousel-indicators li.active {	
		background: rgba(0, 0, 0, 0.6);
	}
	.star-rating li {
		padding: 0;
	}
	.star-rating i {
		font-size: 14px;
		color: #ffc000;
	}
	img{
		max-width: 100%;
		max-height: 100%;
		width: 100%;
		height: 100%;
	}
</style>
<body>
<div align="right">
	<button class="btn btn-primary" onClick="location.href='adminPage'" style="margin-right: 50px;margin-top: 30px;">뒤로가기</button>
</div>

<!-- Images -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2>관리자 Web Parsing Data <b>Update & Delete</b></h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
  
			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
				<div class="item carousel-item active">
					<div class="row">
						<c:forEach items="${StyleList}" var="style">
						<div class="col-sm-3">
							<div class="thumb-wrapper" style="border: 1px solid #ffffff;">
								<div class="img-box" style="height: 380px;">
									<img src="/displayImg?name=${style.img}&folder=admin">
								</div>
								<div class="thumb-content">
									<h4>${style.shopname}</h4>
									<p class="item-price">
										<br>
									</p>
									<div class="star-rating">

									</div>
									<a href="adminUpdateForm?num=${style.num}" class="btn btn-primary" style="text-align: center; vertical-align: middle;">상세보기</a>
								</div>						
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- End Images -->

<!-- pagination{s} -->
<div id="paginationBox" align="center">
	<ul class="pagination">
		<c:if test="${pagination.prev}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
			</li>
		</c:if>
		
		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
			</li>
		</c:forEach>

		<c:if test="${pagination.next}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
			</li>
		</c:if>
	</ul>
</div>

<c:url var="getBoardListURL" value="adminIdentify">
	<c:param name="page" value="${pagination.page}"/>
	<c:param name="range" value="${pagination.range}"/>
</c:url>

<script>

	//이전 버튼 클릭
	function fn_prev(page, range, rangeSize) {
		
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "adminStyleList";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
	
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		
		var url = "adminStyleList";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
	
	//다음 버튼 클릭
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "adminStyleList";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}
</script>
</body>
</html>