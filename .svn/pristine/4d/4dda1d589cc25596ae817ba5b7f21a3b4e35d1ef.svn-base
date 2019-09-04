<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LAON IDE ::프로젝트 메인::</title>
<script type="text/javascript">
$(function(){
	
	/* 프로젝트 코드 파라미터로 보내주기 */
	var sel_code = $('input[name=sel_proCode]').val();
	
});


</script>
</head>
<body>
	<div class="container">
		<br />
		<!-- 회원의 프로젝트 정보 불러오기 (프로젝트가 있을 경우) -->
		<c:if test="${!empty issueMain}">
			<c:forEach items="${issueMain }" var="projectList">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<input name="sel_proCode" type="hidden" value="${projectList.pro_code }">
							<div class="card-header">
								<div style="display: inline">
									<div style="display: inline;">
										<h5>${projectList.pro_name }</h5>
									</div>
									<!-- 프로젝트 팀장일 때만 삭제버튼 출력 -->
									<c:if test="${projectList.grand_code eq 'PL'}">
										<div style="display: inline; float: right; margin-left: 3px;">
<%-- 												<button onclick="location.href='${pageContext.request.contextPath}/user/project/pro_delete.do?pro_code=${projectList.pro_code }'" class="btn waves-effect waves-light btn-sm"> --%>
											<button onclick="javascript:fn_delete()" style="background-color:#0489B1" class="btn waves-effect waves-light btn-sm">
												<input type="hidden" id="procode" name="procode" value="${projectList.pro_code }"/s>
												<font size="2pt" style="color: white;"><i class="ti-cut"></i>Delete</font>
											</button>
										</div>
										<!-- 프로젝트 팀장일 때만 수정버튼 출력 -->
										<div style="display: inline; float: right;">
											<button style="background-color:#0489B1" onclick="location.href='${pageContext.request.contextPath}/user/project/pro_setting.do?pro_code=${projectList.pro_code }'"
												class="btn waves-effect waves-light btn-sm">
												<font size="2pt" style="color: white;"><i class="ti-settings"></i>Setting</font>
											</button>
										</div>
									</c:if>
								</div>
							</div>

							<div class="card-block">
								<div class="row" style="display: inline; margin-left: 10px;">
									<div style="display: inline">
										<span style="font-weight: bold">${projectList.pro_name }</span>
									</div>
									<div style="display: inline; float: right">
										<button id="btn_ide" onclick="location.href='${pageContext.request.contextPath}/laonide/goToIDE.do?pro_code=${projectList.pro_code }&pro_link=${projectList.pro_link }'"
											class="btn btn-inverse waves-effect waves-light btn-sm">
											<font size="2pt" style="color: white; size: small;"><i
												class="ti-control-play"></i>IDE 진입</font>
										</button>
									</div>
								</div>
								<br />
								<br />
								<div class="row" style="margin-left: 10px;">
									<!-- 개발 기간 -->
									<span class="text-muted">${projectList.pro_cont } <br />
										- 개발기간 : ${fn:substring(projectList.pro_begin_date,0,10) } ~
										${fn:substring(projectList.pro_end_date,0,10) }<br />
									</span>
								</div>
								<br />
								<div class="row" style="margin-left: 10px;">
									<div style="display: inline; align-items: center;" align="left">
										<div style="display: inline; float: left;">
											<div class="sub-title" style="width: 220px; margin: auto;">팀원
												목록</div>
											<br />
											<c:forEach items="${projectList.items }" var="teamwon">
												<div style="margin-left: 20px; padding-bottom: 3px;"
													align="left">
													<p>
														<i class="ti-themify-favicon"></i>&nbsp;&nbsp;<a href="">${teamwon.mem_nick}
															${teamwon.grand_code }</a>
													</p>
												</div>
											</c:forEach>
										</div>
										<div style="display: inline; float: left; margin-left: 30px;">
											<div class="sub-title" style="width: 250px;">최근 이슈</div>
											<c:if test="${empty projectList.issuItems }">
												<font>등록된 이슈가 없습니다.</font>
											</c:if>
											<c:if test="${!empty projectList.issuItems }">
												<c:forEach items="${projectList.issuItems }"
													var="issueRecent">
													<p>${issueRecent.isu_title }&nbsp;&nbsp;&nbsp;${fn:substring(issueRecent.isu_reg_date,0,16) }</p>
												</c:forEach>
											</c:if>
										</div>
										<div style="display: inline; float: left; margin-left: 30px;">
											<div class="sub-title" style="width: 250px;">최근 결함</div>
											<c:if test="${empty projectList.errItems }">
												<font>등록된 결함이 없습니다.</font>
											</c:if>
											<c:if test="${!empty projectList.errItems }">
												<c:forEach items="${projectList.errItems }" var="errRecent">
													<p>${errRecent.err_title }&nbsp;&nbsp;&nbsp;${fn:substring(errRecent.err_reg_date,0,16) }</p>
												</c:forEach>
											</c:if>
										</div>
									</div>
								</div>
								<br />
								<div class="row" style="display: inline; margin-left: 10px;">
									<div style="display: inline;"></div>
									<div style="display: inline; float: right"></div>
								</div>
							</div>
						</div>
			</c:forEach>
		</c:if>
		<!-- 프로젝트 정보 불러오기 끝  -->
	</div>
	<!--컨테이너 끝 -->
</body>

<script type="text/javascript">


function fn_projectForm(){
	if (${LOGIN_MEMBERINFO.mem_id != null}) {
		window.open("${pagaContext.request.contextPath}/user/project/projectForm.do",
					"LAON :: 프로젝트 생성",
					"width=800, height=620, toolbar=no, menubar=no, scrollbars=no, resizable=no");
	}else{
		alert("로그인 후 이용할 수 있습니다.");
	}
}

function fn_delete(){
	alert('${issueMain}.pro_code');
	var procode = $('input[name=procode]').val();
	
	if (confirm("프로젝트를 삭제하시겠습니까?")) {
		console.log(procode);
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/pro_delete.do?pro_code='+procode);
// 		$(this).append('<input type="hidden" name="mem_id" value ="'+procode+'"></input>');
		
	}
}

</script>
</html>