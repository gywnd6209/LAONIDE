<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">

</script>
<body>
<div class="container">
	<hr class="one" style="color: #A96EFC;">
		<div class="row" style="margin-top: 50px;margin-left: 100px;margin-bottom: 30px;">
			<span><label>${mem_nick}님을 팀장으로 위임하시겠습니까?</label></span>
		</div>
		<div class="row" style="margin-left: 120px;">
			<button id="btn_upPL" type="button" class="btn btn-inverse btn-sm" >확인</button>&nbsp;
			<button id="btn_cancle" type="button" class="btn btn-inverse btn-sm" >취소</button>
		</div>
	<hr class="one">
</div>
</body>
<script type="text/javascript">
$(function(){
	
	$('#btn_upPL').click(function(){
		
		$.ajax({
	         type : 'post',
	         url : '${pageContext.request.contextPath }/user/issuetracker/crew/upPL.do',
	         dataType : 'json', 
	         data : { mem_id 	: '${mem_id}',
	        	 	  pro_code  : '${pro_code}',
	        	 	  mem_nick  : '${mem_nick}' },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
	        	 alert(andView.result);
	        	 opener.document.location.reload();
				 self.close();
	        	 return true;
	         }
	      });
	});
    
   $('#btn_cancle').click(function(){
	   window.close();
    });
   
      
});
</script>
</html>