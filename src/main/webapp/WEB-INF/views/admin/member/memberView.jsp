<%@ page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
<title>회원정보</title>

</head>
<body>
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					
					<!-- 회원정보 시작 -->
					<div class="card">
						<div class="card-header">
							<h4>회원 정보</h4>
							<span>가입 된 <code>회원</code> 정보입니다.</span>
<!-- 							<div class="card-header-right"> -->
<!-- 								<ul class="list-unstyled card-option"> -->
<!-- 									<li><i class="fa fa fa-wrench open-card-option"></i></li> -->
<!-- 									<li><i class="fa fa-window-maximize full-card"></i></li> -->
<!-- 									<li><i class="fa fa-minus minimize-card"></i></li> -->
<!-- 									<li><i class="fa fa-refresh reload-card"></i></li> -->
<!-- 									<li><i class="fa fa-trash close-card"></i></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
						</div>
						
						<div class="auth-box card">
						<section class="login-block">
							<!-- Container-fluid starts -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-12">
											<form name="updateFrm" method="post" role="form" class="md-float-material form-material">
												<div class="auth-box card" style="width:150%">
													 <div class="card-block">
														<div class="row m-b-20">
																<div class="col-md-12">
																	 <h3 class="text-center txt-primary">회원정보</h3>
																</div>
														</div>
														<div class="form-group form-primary">
															<label><font size="2">회원ID</font></label>
															<input type="hidden" value="${memberInfo.mem_id}">
															<input type="text" id="mem_id" value="${memberInfo.mem_id }" class="form-control" required="" readonly>
															<span class="form-bar"></span>
															<label class="float-label"></label>
														</div>
														<c:if test="${empty memberInfo.mem_pass}">
															<div class="form-group form-primary">
																<input type="password" value="${memberInfo.mem_pass }" class="form-control" required="" disabled="disabled">
																<span class="form-bar"></span>
																<label class="float-label">카카오톡 회원은 비밀번호를 수정하지 않아요 ~( :></label>
															</div>
														</c:if>
														<c:if test="${!empty memberInfo.mem_pass}">
															<div class="form-group form-primary">
																<input type="password" id="mem_pass" value="${memberInfo.mem_pass }" class="form-control" required="">
																<span class="form-bar"></span>
																<label class="float-label">비밀번호 수정</label>
															</div>
														</c:if>
														
														<div class="form-group form-primary">
															<input type="text" id="mem_mail" value="${memberInfo.mem_mail }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">메일</label>
														</div>
														<div class="row">
															<div class="col-sm-6">
																<div class="form-group form-primary">
																	<input type="text" name="mem_nick" id="mem_nick" value="${memberInfo.mem_nick }" class="form-control" required="">
																	<span class="form-bar"></span>
																	<label class="float-label">닉네임 입력</label>
																</div>
															</div>
															
															<div class="col-sm-6">
																<div class="form-group form-primary">
																	<input type="button" id="nick_chk" class="btn btn-mat waves-effect waves-light btn-primary " value="중복검사" />
																	<span class="form-bar"></span>
																</div>
															</div>
														</div>
														<div class="form-group form-primary">
															<input type="text" id="lang_code" value="${memberInfo.lang_code }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">할줄아는언어</label>
														</div>
														<div class="form-group form-primary">
															<input type="text" id="lang_level" value="${memberInfo.lang_level }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">얼마나?</label>
														</div>
														<div class="form-group form-primary">
															<input type="text" id="lang_level" value="${memberInfo.join_date }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">가입일</label>
														</div>
<!-- 														<div class="row m-t-25 text-left"> -->
<!-- 															<div class="col-md-12"> -->
<!-- 																<div class="checkbox-fade fade-in-primary"> -->
<!-- 																	<label> -->
<!-- 																		<input type="checkbox" value=""> -->
<!-- 																		<span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span> -->
<!-- 																		<span class="text-inverse">관리자라구 막 정보 빼돌리구 구러면 안대영. 알았졍?</span><br/><br/> -->
<!-- 																	</label> -->
<!-- 																 </div> -->
<!-- 															</div> -->
<!-- 														</div> -->
														<div class="card-block">
																<input type="submit" value="수정" id="update_id" class="btn btn-mat waves-effect waves-light btn-success">&nbsp;
																<input type="button" value="탈퇴" id="delete_id" class="btn btn-mat waves-effect waves-light btn-danger ">&nbsp;
																<input type="button" value="목록" id="member_list" class="btn btn-mat waves-effect waves-light btn-info ">
														</div>
														<hr/>
<!-- 														<div class="row"> -->
<!-- 															<div class="col-md-10"> -->
<!-- 																<p class="text-inverse text-left m-b-0">Thank you.</p> -->
<%-- 																<p class="text-inverse text-left"><a href="${pageContext.request.contextPath }/admin/member/memberList.do"><b>Back to website</b></a></p> --%>
<!-- 															</div> -->
<!-- 															<div class="col-md-2"> -->
<%-- 																<img src="${pageContext.request.contextPath }/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png"> --%>
<!-- 															</div> -->
<!-- 														</div> -->
													 </div>
												</div>
											</form>
										</div>
										<!-- end of col-sm-12 -->
									</div>
									<!-- end of row -->
								</div>
								<!-- end of container-fluid -->
							</section>
							
						</div>
						<!-- 회원목록 끝 -->
					<!-- Page-body end -->
					</div>
				</div>
				<!-- Main-body end -->
				<div id="styleSelector"></div>
			</div>
		</div>
	</div>
	<script type ='text/javascript' src ="${pageContext.request.contextPath }/assets/js/validation.js"></script>
</body>

<script type="text/javascript">
$(function(){
// 	alert("${memberInfo.mem_id}");
	
	//닉네임 중복검사
	$('#nick_chk').click(function(){
		id_flag = false;
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/admin/member/memberForm/nickChk.do',
			dataType : 'json',
			data : { mem_nick : $('input[name=mem_nick]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(andView){
				alert(andView.result)
				var result = andView.result;
				if (result == "이미 사용중인 별명입니다.") {
					$('#mem_nick').val('');
				}
			}
		});
	});
	
// 	$('#update_id').click(function(){
// // 		$(location).attr('href', '${pageContext.request.contextPath}/member/updateMember.do?mem_id=${memberView.mem_id}');
// 		$('form[name=updateFrm]').submit(function(){
			
// 			var mem_id = $('#mem_id').val();	
// 			var mem_pass = $('#mem_pass').val();
// 			var mem_mail = $('#mem_mail').val();
// 			var mem_nick = $('#mem_nick').val();
// 			var lang_code = $('#lang_code').val();
// 			var lang_level= $('#lang_level').val();
			
// 			alert("아이디 : "+mem_id);
			
// 			if(!$('input[name=mem_pass]').val().validationPWD()){
// 				return submitFail('패스워드');
// 			}
			
// 			if (!mem_mail.validationMAIL()) {
// // 				alert("올바른 이메일 양식이 아닙니다.");
// // 				return false;
// 				return submitFail('E-Mail');
// 			}
			
// // 			$(this).attr('action', '${pageContext.request.contextPath}/admin/member/updateMember.do?mem_id=${memberInfo.mem_id}'); 
// 			$(location).attr('href', '${pageContext.request.contextPath}/admin/member/updateMember.do?mem_id='+mem_id); 
			
// 			$(this).append('<input type="hidden" name="mem_pass" value="'+mem_pass+'" ></input>' );
// 			$(this).append('<input type="hidden" name="lang_level" value="'+lang_level+'" ></input>' );
// 			$(this).append('<input type="hidden" name="mem_mail" value="'+mem_mail+'" ></input>' );
// // 			$(this).append('<input type="hidden" name="mem_nick" value="'+mem_nick+'" ></input>' );
// 			$(this).append('<input type="hidden" name="lang_code" value="'+lang_code+'" ></input>' );
			
// 		});
// 	});

	
	$('#update_id').click(function(){
		var mem_id = $('#mem_id').val();
		var mem_nick = $('#mem_nick').val();
		var lang_code = $('#lang_code').val();
		var lang_level= $('#lang_level').val();
		var mem_pass= $('#mem_pass').val();
		var mem_mail = $('#mem_mail').val();
		
		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/admin/member/updateMember.do',
				dataType : 'json',
				data : { mem_id : mem_id,
							mem_nick :mem_nick,
							lang_code:lang_code,
							lang_level:lang_level,
							mem_pass:mem_pass,
							mem_mail :mem_mail
				},
				error : function(result){
					alert("변경 완료");
				},
				success : function(andView){
// 					alert("성공");
					var result = andView.result;
					alert(result);
				}
			});
		}
	});
	
	$('input[value=목록]').click(function(){
// 		$(location).attr('href', '${pageContext.request.contextPath}/admin/member/memberList.do');
		$(location).attr('href', '${pageContext.request.contextPath }/admin/member/memberList.do?'+
				'&currentPage=${currentPage}&search_keyword='+encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}');
	});
	
	$('#delete_id').click(function(){
		if (confirm("삭제하시겠습니까?")) {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/member/deleteMember.do?mem_id=${memberInfo.mem_id}');
		}
	});
});

function submitFail(message) {
	BootstrapDialog.show({
		title : '경고',
		message : message
	});
	
	return false;
}
</script>

</html>
