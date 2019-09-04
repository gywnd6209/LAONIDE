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
<script type="text/javascript"></script>
<body>
<div class="container">
	<hr class="two" style="color: #A96EFC;">
		<!-- 선택된 체크갯수가 한개 일 때 -->
<%-- 			<c:if test="${fn:length(mem_id) == 1} "> --%>
<!-- 				<div class="row" style="margin-top: 50px;margin-left: 80px;margin-bottom: 20px;"> -->
<%-- 					<span><label>${mem_nick}님을 팀에서 제거하시겠습니까?</label></span> --%>
<!-- 				</div>	 -->
<%-- 			</c:if> --%>
		<!-- 선택된 체크갯수가 한개 일 때 -->
<%-- 			<c:if test="${fn:length(mem_id) != 1} "> --%>
				<div class="row" style="margin-top: 50px;margin-left: 80px;margin-bottom: 20px;">
					<span><label>팀에서 추방하시겠습니까?</label></span>
				</div>
<%-- 			</c:if> --%>
		<div class="row" style="margin-left: 120px;margin-bottom: 20px;">
			<button id="btn_del" type="button" class="btn btn-inverse btn-sm" >확인</button>&nbsp;
			<button id="btn_cancle" type="button" class="btn btn-inverse btn-sm" >취소</button>
		</div>
	<hr class="two">
</div>
</body>
<script type="text/javascript">
$(function(){
		
	var split_id = new Array();
	
	$('#btn_del').click(function(){
		
// 		$(location).attr("href","${pageContext.request.contextPath }/user/issuetracker/crew/deleteCrew.do?mem_id={mem_id}&pro_code={pro_code}&mem_nick=${mem_nick}");
// 		window.close();
		$.ajax({
	         type : 'post',
	         url : '${pageContext.request.contextPath }/user/issuetracker/crew/deleteCrew.do',
	         dataType : 'json', 
	         data : { mem_id 	: '${mem_id}',
	        	 	  pro_code  : '${pro_code}',
	        	 	  mem_nick  : '${mem_nick}' },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
// 	        	 alert(andView.result);
				opener.document.location.reload();
				self.close();
// 	        	 window.location.realod();
// 	        	 window.location.href = '${pageContext.request.contextPath }user/issuetracker/crew/crewList.do';
	        	 return true;
	         }
	      });
	});
		
    
   $('#btn_cancle').click(function(){
	   window.close();
    });
});
// function fn_deleteCrew(){
// 	$(location).attr("href","${pageContext.request.contextPath }/user/issuetracker/crew/deleteCrew.do?mem_id=${param.mem_id}&pro_code=${param.pro_code}&mem_nick=${param.mem_nick}");
// 	window.close();
// }
</script>
</html>