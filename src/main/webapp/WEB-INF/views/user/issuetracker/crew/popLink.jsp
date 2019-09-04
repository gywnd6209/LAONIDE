<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온IDE 팀원 초대하기♥</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
<meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="codedthemes" />
<!-- Favicon icon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.mCustomScrollbar.css">
<style type="text/css">

</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>
<body>
<div class="container">
	<hr class="two" style="color: #A96EFC;">
		<div class="row">
			<div style="display: block;margin-left: 20px;margin-bottom: 10px;margin-top: 20px;">
				<label class="label label-default" style="margin-left: 20px;margin-bottom: 10px;">프로젝트 초대하기</label><br/>
					<!-- 프로젝트 초대 코드 띄우기 -->
					<input type="text" style="width: 350px;margin-left: 20px;height: 35px;" id ="ShareUrl" value="http://192.168.201.27/user/issuetracker/crew/join.do?pro_link=${pro_link }&pro_code=${pro_code}">
					<span class="btn-type1"><button class="btn btn-inverse btn-sm" OnClick="javascript:CopyUrlToClipboard()">URL 복사</button></span>
			</div>
		</div>
		<div class="row" style="margin-left: 190px;margin-top: 50px;margin-bottom: 40px;">
			<button id="btn_close" type="button" class="btn btn-inverse btn-sm" ><i class="ti-close"></i>닫기</button>&nbsp;
		</div>
	<hr class="two">
	
</div>
</body>
<script type="text/javascript">
$(function(){
		
	var split_id = new Array();
	
	$('#btn_close').click(function(){
		window.close();
	});
    
});

function CopyUrlToClipboard(){

	var obShareUrl = document.getElementById("ShareUrl");

	obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
	document.execCommand("copy"); // 클립보드에 복사합니다.
	obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.

	alert("URL이 클립보드에 복사되었습니다"); 
}

</script>
</html>