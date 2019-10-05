<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function goSubmit() {
	var fileValue = $("#userImg").val().split("\\");
	var fileName = fileValue[fileValue.length-1];
    if(checkImageType(fileName)) {// 이미지 파일이면
    	$("#myForm").submit();
    }else{
    	alert(".jpg, .jpeg 파일만 가능합니다.");
    }
}

//이미지파일 형식을 체크
function checkImageType(fileName) {
    // i : ignore case(대소문자 무관)
    var pattern = /jpg|jpeg/i; // 정규표현식
    return fileName.match(pattern); // 규칙이 맞으면 true
}

</script>
</head>
<body>
	<form id="myForm" method="post" action="uploadImg" enctype="multipart/form-data">
		<label>파일:</label>
		<input type="file" name="file" id="userImg">
		<input type="button" value="upload" onclick="goSubmit()">
	</form>
</body>
</html>