<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="/resources/icon/user/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/icon/user/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/icon/user/favicon-16x16.png">
<link rel="manifest" href="/resources/icon/user/site.webmanifest">
<link rel="mask-icon" href="/resources/icon/user/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<!-- End favicon -->

<!-- CSS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Image Upload</title>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript">

	function goSubmit() {
	
		var fileValue = $("#userImg").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
	    if(checkImageType(fileName))
	    {	// 이미지 파일이면r= 근데 . . ?
	    	$("#myForm").submit();
	    }
	    else
	    {
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
<style type="text/css">
	body{
		color: #999;
		font-family: 'Roboto', sans-serif;
	}
	.form-control{
		min-height: 41px;
		box-shadow: none;
		border-color: #e1e1e1;
	}
	.form-control:focus{
		border-color: #00cb82;
	}	
    .form-control, .btn{        
        border-radius: 3px;
    }
	.form-header{
		margin: -30px -30px 20px;
		padding: 30px 30px 10px;
		text-align: center;
		background: #61C7C1;
		border-bottom: 1px solid #eee;
		color: #fff;
	}
	.form-header h2{
		font-size: 20px;
		font-weight: bold;
        margin: 0 0 10px;
		font-family: 'Pacifico', sans-serif;
    }
	.form-header p{
		margin: 20px 0 15px;
		font-size: 14px;
		line-height: normal;
		font-family: 'Courgette', sans-serif;
	}
    .signup-form{
		width: 390px;
		margin: 0 auto;	
		padding: 30px 0;	
	}
    .signup-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form .form-group{
		margin-bottom: 20px;
	}		
	.signup-form label{
		font-weight: normal;
		font-size: 13px;
	}
    .signup-form input[type="checkbox"]{
		margin-top: 2px;
	}
    .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;
		background: #00cb82;
		border: none;
		min-width: 200px;
    }
	.signup-form .btn:hover, .signup-form .btn:focus{
		background: #00b073 !important;
        outline: none;
	}
    .signup-form a{
		color: #00cb82;		
	}
    .signup-form a:hover{
		text-decoration: underline;
	}
</style>
<body>

<!-- Upload Forr -->
<div class="signup-form">
    <form id="myForm" method="post" action="uploadImg" enctype="multipart/form-data">
		<div class="form-header">
			<h2>Upload</h2>
			<p>기계학습 된 신경망이 실제 옷장에 옷을 촬영하여 등록하면 옷의 색상을 분석해 알려줍니다.</p>
		</div>    
        <div class="form-group" style="margin-top: -30px;">
			<label>Photo Upload</label>
        	<input type="file" id="userImg" class="form-control" name="file">
        </div>        
		<div class="form-group">
			<input type="button" value="Upload" onclick="goSubmit()" class="btn btn-primary btn-block btn-lg"
				style="background: #61C7C1;">
		</div>	
    </form>
</div>


<!-- 
<form id="myForm" method="post" action="uploadImg" enctype="multipart/form-data">
		<label>파일:</label>
		<input type="file" name="file" id="userImg">
		<input type="button" value="upload" onclick="goSubmit()">
		<div class="text-center small">Already have an account? <a href="#">Login here</a></div>
</form>
 -->

	
	
</body>
</html>