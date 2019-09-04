<%@ page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
<title></title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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
						<div class="card-header">
							<h4>회원 정보</h4>
							<span>가입 된 <code>회원</code> 정보입니다.</span>
							<div class="card-header-right">
								<ul class="list-unstyled card-option">
									<li><i class="fa fa fa-wrench open-card-option"></i></li>
									<li><i class="fa fa-window-maximize full-card"></i></li>
									<li><i class="fa fa-minus minimize-card"></i></li>
									<li><i class="fa fa-refresh reload-card"></i></li>
									<li><i class="fa fa-trash close-card"></i></li>
								</ul>
							</div>
						</div>
						
						<div class="auth-box card">
						<section class="login-block">
							<!-- Container-fluid starts -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-12">
											<form name="updateFrm" method="post" role="form" class="md-float-material form-material">
												<div class="text-center">
													 <img src="${pageContext.request.contextPath }/assets/images/logo.png" alt="logo.png">
												</div>
												<div class="auth-box card">
													 <div class="card-block">
														<div class="row m-b-20">
																<div class="col-md-12">
																	 <h3 class="text-center txt-primary">회원정보</h3>
																</div>
														</div>
														<div class="form-group form-primary">
															<input type="hidden" value="${memberView.mem_id}">
															<input type="text" id="mem_id" value="${memberView.mem_id }" class="form-control" required="" disabled="disabled">
															<span class="form-bar"></span>
															<label class="float-label"></label>
														</div>
														<div class="card-block">
																<input type="submit" value="수정" id="update_id" class="btn btn-mat waves-effect waves-light btn-success">&nbsp;
																<input type="button" value="탈퇴" id="delete_id" class="btn btn-mat waves-effect waves-light btn-danger ">&nbsp;
																<input type="button" value="목록" id="member_list" class="btn btn-mat waves-effect waves-light btn-info ">
														</div>
														<hr/>
														<div class="row">
															<div class="col-md-10">
																<p class="text-inverse text-left m-b-0">Thank you.</p>
																<p class="text-inverse text-left"><a href="${pageContext.request.contextPath }/admin/member/memberList.do"><b>Back to website</b></a></p>
															</div>
															<div class="col-md-2">
																<img src="${pageContext.request.contextPath }/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
															</div>
														</div>
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
<!-- 	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="${pageContext.request.contextPath }/assets/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- waves js -->
	<script src="${pageContext.request.contextPath }/assets/pages/waves/js/waves.min.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/SmoothScroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/modernizr/modernizr.js "></script>
	<!-- i18next.min.js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next/js/i18next.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/common-pages.js"></script>
	<!-- Custom js -->
	<script src="${pageContext.request.contextPath }/assets/js/pcoded.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/vertical-layout.min.js "></script>
	<script src="${pageContext.request.contextPath }/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script.js"></script>
	
	<script type ='text/javascript' src ="${pageContext.request.contextPath }/resource/js/validation.js"></script>
</body>

<script type="text/javascript">
function mailCheck(){
	var form = document.authenform;
	var authNum = ${authNum};
	
	if (!form.authnum.value) {
		alert("인증번호를 입력해주세요");
		return false;
	}
	if (form.authnum.value != authNum) {
		alert("올바르지않은 인증번호입니다. 다시 입력해주세요.");
		form.authnum.value="";
		return false;
	}
	if (form.authnum.value == authNum) {
		alert("정상적으로 인증되었습니다.");
		opener.document.userinput.mailCheck.value="정상적으로 인증되었습니다."
		self.close();
	}
}
</script>

</html>
