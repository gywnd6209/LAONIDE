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

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
<meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="codedthemes" />

<!-- Favicon icon -->
<link rel="icon" href="${pageContext.request.contextPath }/assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/jquery.mCustomScrollbar.css">
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
						<div class="auth-box card">
						<section class="login-block">
							<!-- Container-fluid starts -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-12">
											<form name="updateFrm" method="post" role="form" class="md-float-material form-material">
												<div class="auth-box card">
													 <div id="refreshDiv" class="card-block">
														<div class="row m-b-20">
																<div class="col-md-12">
																	 <h3 class="text-center txt-primary">회원정보</h3>
																</div>
														</div>
														<div class="form-group form-primary">
															<label><font size="2">회원ID</font></label>
															<input type="text" id="mem_id" value="${memberProfile.mem_id }" class="form-control" required="" readonly>
															<input type="hidden" id="h_mem_id" value="${memberProfile.mem_id }">
															<span class="form-bar"></span>
															<label class="float-label"></label>
														</div>
														<c:if test="${empty memberProfile.mem_pass}">
															<div class="form-group form-primary">
																<input type="password" value="${memberProfile.mem_pass }" class="form-control" required="" disabled="disabled">
																<span class="form-bar"></span>
																<label class="float-label">카카오톡 회원은 비밀번호를 수정하지 않아요 ~( :></label>
															</div>
														</c:if>
														<c:if test="${!empty memberProfile.mem_pass}">
															<div class="form-group form-primary">
																<input type="password" name="mem_pass" id="mem_pass" value="${memberProfile.mem_pass }" class="form-control" required="">
																<span class="form-bar"></span>
																<label class="float-label">비밀번호 수정. 영어 대소문자, 숫자, 특수문자를 8~24글자</label>
															</div>
														</c:if>
														
														<div class="form-group form-primary">
															<input type="text" id="mem_mail" value="${memberProfile.mem_mail }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">메일</label>
														</div>
														<div class="row">
															<div class="col-sm-6">
																<div class="form-group form-primary">
																	<input type="text" id="mem_nick" value="${memberProfile.mem_nick }" class="form-control" required="">
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
															<input type="text" id="lang_code" value="${memberProfile.lang_code }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">할줄아는언어</label>
														</div>
														<div class="form-group form-primary">
															<input type="text" id="lang_level" value="${memberProfile.lang_level }" class="form-control" required="">
															<span class="form-bar"></span>
															<label class="float-label">얼마나?</label>
														</div>
														<div class="form-group form-primary">
															<label><font size="2">가입일</font></label>
															<input type="text" id="lang_level" value="${memberProfile.join_date }" class="form-control" readonly required="">
															<span class="form-bar"></span>
														</div>
														<div class="card-block">
<!-- 																<input type="submit" value="수정" id="update_id" onclick="javascript:fn_update()" name="update_id" class="btn btn-mat waves-effect waves-light btn-success">&nbsp; -->
																<input type="submit" value="수정" id="update_id" name="update_id" class="btn btn-mat waves-effect waves-light btn-success">&nbsp;
																<input type="button" value="탈퇴" id="delete_id" name="delete_id" class="btn btn-mat waves-effect waves-light btn-danger ">&nbsp;
																<input type="button" value="닫기" id="btn_close" name="btn_close" class="btn btn-mat waves-effect waves-light btn-info ">
														</div>
														<hr/>
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
	<!-- Required Jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/popper.js/popper.min.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap/js/bootstrap.min.js "></script> --%>
<!-- 	waves js -->
	<script src="${pageContext.request.contextPath }/assets/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- waves js -->
	<script src="${pageContext.request.contextPath }/assets/pages/waves/js/waves.min.js"></script>
	<!-- modernizr js -->
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/SmoothScroll.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/modernizr/modernizr.js "></script>
	<!-- i18next.min.js -->
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next/js/i18next.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/common-pages.js"></script>
	<!-- Custom js -->
	<script src="${pageContext.request.contextPath }/assets/js/pcoded.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/vertical-layout.min.js "></script>
	<script src="${pageContext.request.contextPath }/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script.js"></script>
	
	<script type ='text/javascript' src ="${pageContext.request.contextPath }/assets/js/validation.js"></script>
</body>

<script type="text/javascript">

$(function(){
	
	//닉네임 중복검사
	$('#nick_chk').click(function(){
		id_flag = false;
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/memberForm/nickChk.do',
			dataType : 'json',
			data : { mem_nick : $('#mem_nick').val() },
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
	
	$('#update_id').click(function(){
		var mem_id = $('#mem_id').val();
		var mem_nick = $('#mem_nick').val();
		var lang_code = $('#lang_code').val();
		var lang_level= $('#lang_level').val();
		var mem_pass= $('#mem_pass').val();
		var mem_mail = $('#mem_mail').val();
		
		alert(mem_id+" : "+mem_nick+" : "+lang_code+" : "+mem_pass);
		
		if(!$('input[name=mem_pass]').val().validationPWD()){
			alert("형식에 맞는 비밀번호를 입력해주세요");
			return false;
		}
		
		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/member/updateMember.do',
				dataType : 'json',
				data : { mem_id : mem_id,
							mem_nick :mem_nick,
							lang_code:lang_code,
							lang_level:lang_level,
							mem_pass:mem_pass,
							mem_mail :mem_mail
				},
				error : function(result){
// 					alert(result.status + ' | ' + result.responseText);
					window.close();
					opener.document.location.reload();
				},
				success : function(andView){
// 					alert("성공");
						var result = andView.result;
						if (result == "정상적으로 변경 되었습니다.") {
						window.close();
						opener.document.location.reload();
					}
				}
			});
		}
	});
	
	
// 	$('input[value=수정]').click(function(){
// // 		$(location).attr('href', '${pageContext.request.contextPath}/member/updateMember.do?mem_id=${memberView.mem_id}');
// 			var mem_id = $('#mem_id').val();
// 		$('form[name=updateFrm]').submit(function(){
			
// 			var mem_mail = $('#mem_mail').val();
// 			var mem_nick = $('#mem_nick').val();
// 			var lang_code = $('#lang_code').val();
// 			var lang_level= $('#lang_level').val();
// 			var mem_pass= $('#mem_pass').val();
			
// 			if (!mem_mail.validationMAIL()) {
// 				alert("올바른 이메일 양식이 아닙니다.");
// 				return false;
// 			}
			
// 			$(this).attr('action', '${pageContext.request.contextPath}/user/member/updateMember.do?mem_id=${memberProfile.mem_id}'); 
			
// 			$(this).append('<input type="hidden" name="lang_level" value="'+lang_level+'" ></input>' );
// 			$(this).append('<input type="hidden" name="mem_mail" value="'+mem_mail+'" ></input>' );
// 			$(this).append('<input type="hidden" name="mem_pass" value="'+mem_pass+'" ></input>' );
// 			$(this).append('<input type="hidden" name="mem_nick" value="'+mem_nick+'" ></input>' );
// 			$(this).append('<input type="hidden" name="lang_code" value="'+lang_code+'" ></input>' );
			
// 			alert("정상적으로 수정되었습니다.");
// // 			opener.document.location.reload();
// // 			window.close();
// 		});
// 	});
	
	
	
	
	$('#delete_id').click(function(){
		if (confirm("탈퇴하시겠습니까?\n확인을 누르시면 바로 탈퇴를 진행합니다.")) {
// 			$(location).attr('href', "${pageContext.request.contextPath}/user/member/deleteMember.do?mem_id=${memberProfile.mem_id }");
// 			alert("탈퇴되었습니다.");
			del_member();
// 			setTimeout(function(){window.close();}, 2000);
// 			window.close();
// 			$.ajax({
// 				type : 'POST',
// 				url : '${pageContext.request.contextPath}/user/member/deleteMember.do',
// 				dataType : 'json',
// 				data : { mem_id : mem_id },
// 				error : function(result){
// 					alert(result.status + ' | ' + result.responseText);
// 				},
// 				success : function(andView){
// 					alert(andView.result);
// 					var result = andView.result;
// 					if (result == "정상적으로 탈퇴 되었습니다.") {
// 						window.close();
// 					}
// 				}
// 			});
		}
		
// 		top.opener.location.href='${pageContext.request.contextPath}/login/loginForm.do';
	});
	
	
	$('#btn_close').click(function(){
// 		$(location).attr('href', '${pageContext.request.contextPath}/admin/member/memberList.do');
// 		opener.document.location.reload();
		window.close();
	});
	
	
	
	
});

function del_member(){
	
	var mem_id = $('#mem_id').val();

	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/member/deleteMember.do',
		dataType : 'json',
		data : { mem_id : mem_id },
		error : function(result){
// 			alert(result.status + ' | ' + result.responseText);
			alert("탈퇴되었습니다.");
			top.opener.location.href='${pageContext.request.contextPath}/login/loginForm.do';
			window.close();
		},
		success : function(andView){
			alert(andView.result)
			var result = andView.result;
// 			if (result == "정상적으로 탈퇴 되었습니다.") {
				top.opener.location.href='${pageContext.request.contextPath}/login/loginForm.do';
				window.close();
// 			}
		}
	});
	
}
</script>

</html>
