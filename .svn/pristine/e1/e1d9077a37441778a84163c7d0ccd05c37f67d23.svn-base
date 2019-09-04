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
<br/>
		<!-- 선택된 체크갯수가 한개 일 때 -->
<%-- 			<c:if test="${fn:length(mem_id) == 1} "> --%>
<!-- 				<div class="row" style="margin-top: 50px;margin-left: 80px;margin-bottom: 20px;"> -->
<%-- 					<span><label>${mem_nick}님을 팀에서 제거하시겠습니까?</label></span> --%>
<!-- 				</div>	 -->
<%-- 			</c:if> --%>
		<!-- 선택된 체크갯수가 한개 일 때 -->
<%-- 			<c:if test="${fn:length(mem_id) != 1} "> --%>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="text-align: center;">팀원아이디</th>
						<th style="text-align: center;">직책</th>
					</tr>
				</thead>
				<tbody id="boardListTbody">
<%-- 					<c:forEach items="${ar_mem_id }" var="teamInfo"> --%>
						<tr>
							<td align="center">
								<label id="team_mem_nick" name="team_mem_nick">${param.mem_nick}</label>
								<input type="hidden" id="team_mem_id" name="team_mem_id" value="${param.mem_id}">
							</td>
							<td align="center"><select name='grand'>
								<option value='선택' selected>-- 선택 --</option>
								<c:forEach items="${grandList }" var="grandInfo">
									<option value='${grandInfo.grand_code }'>${grandInfo.grand_code }</option>
								</c:forEach>
							</select></td>
						</tr>
<%-- 					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		<%-- 			</c:if> --%>
		<div class="row" style="margin-left: 160px;margin-bottom: 20px;">
			<button id="btn_update" type="button" class="btn btn-inverse btn-sm" >확인</button>&nbsp;
			<button id="btn_cancle" type="button" class="btn btn-inverse btn-sm" >취소</button>
		</div>
</div>
</body>
<script type="text/javascript">
$(function() {

	//팀원의 선택 직책
	function selectDelRow() {
		var chk = $("select[name=grand]").val(); 
		var len = $('#boardListTbody tr').length;  // select 박스의 전체 개수
		var selectVal = '';     

		for(var i = 0; i < len; i++){
			if(len == 1){
				selectVal += chk;
			}else{
				if(i == len-1){
					selectVal += $("select[name=grand]").eq(i).val();
				}else{
					selectVal += $("select[name=grand]").eq(i).val() + ',';
				}
				checkRow = '';
			}
		}
		return selectVal;
	}
	
	//선택된 팀원 아이디
	function trMember() {
		var chk = $("label[name=team_mem_id]").text(); 
		var len = $('#boardListTbody tr').length;  // select 박스의 전체 개수
		var selectVal = '';     

		for(var i = 0; i < len; i++){
			if(len == 1){
				selectVal += chk;
			}else{
				if(i == len-1){
					selectVal += $("label[name=team_mem_id]").eq(i).text();
				}else{
					selectVal += $("label[name=team_mem_id]").eq(i).text() + ',';
				}
				checkRow = '';
			}
		}
		return selectVal;
	}
	
	$('#btn_update').click(function(){
		
		$.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/issuetracker/crew/crewUpdateGrade.do',
	         dataType : 'json', 
	         data : { 
	        	 grand_code : selectDelRow(),
	        	 mem_id 	: '${param.mem_id}',
	        	 pro_code 	: '${param.pro_code}'
	         },
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
	
// 	var split_id = new Array();

	$('#btn_cancle').click(function() {
		window.close();
	});
});
</script>
</html>