<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LAON IDE ::프로젝트 메인::</title>
<script type="text/javascript">

var mem_id 		= '${LOGIN_MEMBERINFO.mem_id}';

$(function(){
	
	/* 프로젝트 코드 파라미터로 보내주기 */
	var sel_code = $('input[name=sel_proCode]').val();
// 	alert(sel_code);
	
	/* 프로젝트 정보 수정하기 */
	$("#btn_up").click(function() {
		
		$('form[name=updateFrm]').submit(function(){
			
			$(this).attr('action', '${pageContext.request.contextPath}/user/project/pro_update.do');
			$(this).append('<input type="hidden" name="pro_code" value="'+sel_code+'"></input>');
			alert('수정되었습니다!');
		});
	});
	
	/* 프로젝트 정보 삭제하기 */
	$("#btn_del").click(function() {
		$(location).attr("href","${pageContext.request.contextPath}/user/project/pro_delete.do?pro_code="+sel_code);
	});
	
	/* 프로젝트 메인으로 돌아가기 */
	$("#btn_list").click(function() {
		$(location).attr("href","${pageContext.request.contextPath}/user/project/pro_main.do?mem_id="+mem_id);
	});
	
});

function submitFail(message){
	alert(message);
	return false;
}

</script>
</head>
<body>
	<div class="container">
		<br />
		<div class="row">
			<div class="col-sm-12">
				<div class="card" >
					<form name="updateFrm" method="post" action="">
					<!-- 회원의 프로젝트 정보 불러오기 (프로젝트가 있을 경우) -->
					<c:if test="${!empty projectMain}">
						<c:forEach items="${projectMain }" var="projectList">
						<input name="sel_proCode" type="hidden" value="${projectList.pro_code }">
							<div class="card-header">
								<div style="display: inline">
									<div style="display: inline;">
										<h5>Project Settings</h5>
									</div>
									<div style="display: inline; float: right;margin-left: 3px;">
										<button id="btn_up" class="btn btn-inverse waves-effect waves-light btn-sm">
											<font size="2pt"style="color: white;"><i class="ti-wand"></i>Update</font>
										</button>
										<button id="btn_del" type="button" style="background-color:#0489B1" class="btn waves-effect waves-light btn-sm">
											<font size="2pt"style="color: white;"><i class="ti-cut"></i>Delete</font>
										</button>
										<button id="btn_list" style="background-color:#0489B1" type="button" class="btn waves-effect waves-light btn-sm">
											<font size="2pt"style="color: white;"><i class="ti-menu-alt"></i>Main</font>
										</button>
									</div>
								</div>
							</div>
							
							<div class="card-block">
								<div class="row" style="display: inline; margin-left: 10px;">
									<div style="display: inline">
										<label style="font-size: small">* 프로젝트명</label>&nbsp;<br/>
										<input name="pro_name" type="text" value="${projectList.pro_name }" style="width: 700px;height:30px;margin-left: 10px;"></input>
									</div>
								</div>
								<br /><br />
								<div class="row" style="margin-left: 10px;">
									<div class="form-group row" style="">
										<label class=" col-form-label" style="text-align: center;margin-left: 15px;font-size: small">
										* 개발 시작일 ~ 개발 완료일
										</label>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<div class=' input-group date dateTimePicker' id="datepicker1" style="width: 170px">
											<input type='date' class="form-control" data-date-format="YYYY-MM-DD" name="pro_begin_date" required="required" value="${fn:substring(projectList.pro_begin_date,0,10) }"/>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;
											<b>~</b>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<div class=' input-group date dateTimePicker' id="datepicker2" style="width: 170px">
											<input type='date' class="form-control"	data-date-format="YYYY-MM-DD" name="pro_end_date" required="required" value="${fn:substring(projectList.pro_end_date,0,10) }" />
										</div>
									</div>
									<br />
								</div>
								<div class="row" style="margin-left: 10px;display: block">
									<div style="display: block;">
										<label style="font-size: small">* 프로젝트 내용</label> &nbsp;
<!-- 										<dt class="col-sm-3">Description lists</dt> -->
									</div>
									<div style="display: block;">
										<input name="pro_cont" style="width: 700px;height: 150px;" value="${projectList.pro_cont }">
									</div>
								</div>
								<br />
								<div class="row" style="margin-left: 10px;">
									
								</div>
								<br />
								<div class="row" style="display: inline; margin-left: 10px;">
									<div style="display: inline;"></div>
									<div style="display: inline; float: right"></div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<!-- 프로젝트 정보 불러오기 끝  -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--컨테이너 끝 -->
</body>
</html>