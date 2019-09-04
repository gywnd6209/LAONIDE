<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>회원가입</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
	<meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
	<meta name="author" content="codedthemes" />
	
	<link rel="icon" href="${pageContext.request.contextPath }/assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->     
      <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/style.css">
	

</head>

<body themebg-pattern="theme1">
<!-- Pre-loader start -->
<div class="theme-loader">
	<div class="loader-track">
		 <div class="preloader-wrapper">
			  <div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						 <div class="circle"></div>
					</div>
					<div class="gap-patch">
						 <div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						 <div class="circle"></div>
					</div>
			  </div>
			  <div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						 <div class="circle"></div>
					</div>
					<div class="gap-patch">
						 <div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						 <div class="circle"></div>
					</div>
			  </div>
			
			  <div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						 <div class="circle"></div>
					</div>
					<div class="gap-patch">
						 <div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						 <div class="circle"></div>
					</div>
			  </div>
			
			  <div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						 <div class="circle"></div>
					</div>
					<div class="gap-patch">
						 <div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						 <div class="circle"></div>
					</div>
			  </div>
		 </div>
	</div>
</div>
<!-- Pre-loader end -->
<section class="login-block">
	<!-- Container-fluid starts -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<form name="memberForm" action='${pageContext.request.contextPath }/member/insertMember.do' method='post' class="md-float-material form-material">
					<div class="auth-box card">
						 <div class="card-block">
							<div class="row m-b-20">
									<div class="col-md-12">
										 <h3 class="text-center txt-primary">회원 가입</h3><br/>
									</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="text" name="mem_id" id="mem_id" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">ID입력(영어소문자, 숫자포함 4~14글자)<br/>&nbsp;<br/></label>
									</div>
								</div>
								
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="button" id="id_chk" class="btn btn-mat waves-effect waves-light btn-primary " value="중복검사" />
										<span class="form-bar"></span>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-sm-6">
									 <div class="form-group form-primary">
										<input type="password" name="mem_pass" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">비밀번호(영어대소문자,숫자,특수문자포함 8~24글자)</label>
									 </div>
								</div>
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="password" name="confirm_mem_pass" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">비밀번호 확인</label>
									 </div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group form-primary">
										<input type="text" id="mem_mail" name="mem_mail" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">E-MAIL</label>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group form-primary">
										<input type="button" id="send_mail" name="send_mail" class="btn btn-mat waves-effect waves-light btn-primary "
											 value="인증키 전송"/>
										<span class="form-bar"></span>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="text" name="mem_key" id="mem_key" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">인증키 입력</label>
									</div>
									<div id="nickCheck"></div>
								</div>
								
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="button" id="key_chk" name="key_chk" class="btn btn-mat waves-effect waves-light btn-primary " value="인증키 확인" />
										<span class="form-bar"></span>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="text" name="mem_nick" id="mem_nick" class="form-control" required="">
										<span class="form-bar"></span>
										<label class="float-label">닉네임 입력</label>
									</div>
									<div id="nickCheck"></div>
								</div>
								
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="button" id="nick_chk" class="btn btn-mat waves-effect waves-light btn-primary " value="중복검사" />
										<span class="form-bar"></span>
									</div>
								</div>
							</div>
							<div class="form-group form-primary">
								<input type="text" name="lang_code" class="form-control" required="">
								<span class="form-bar"></span>
								<label class="float-label">사용 가능한 언어를 적어주세요</label>
							</div>
							<div class="form-group form-primary">
								<input type="text" name="lang_level" class="form-control" required="">
								<span class="form-bar"></span>
								<label class="float-label">숙련도가 어느정도인가요? ex)상, 중, 하 등</label>
							</div>
							<div class="row m-t-25 text-left">
								<div class="col-md-12">
									<div class="checkbox-fade fade-in-primary">
										<label>
											<input type="checkbox" id="insertChk" name="insertChk" value="">
											<span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
<%-- 											<span class="text-inverse"> <a href="${pageContext.request.contextPath }/member/provision.do" target="_black">약관 </a> 에 동의하시면 체크해주세요.</a></span> --%>
											<span class="text-inverse"> <a href="#" onclick="window.open('${pageContext.request.contextPath }/member/provision.do', '_blank', 'width=600 height=350')">약관 </a> 에 동의하시면 체크해주세요.</a></span>
										</label>
									 </div>
								</div>
							</div>
							<div class="row m-t-30">
								<div class="col-md-12">
									<button type="submit" id="insertMem" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">가입</button>
								</div>
							</div>
							<hr/>
							<div class="row">
								<div class="col-md-10">
									<p class="text-inverse text-left m-b-0">LAON을 찾아주셔서감사합니다 :)</p>
									<p class="text-inverse text-left"><a href="${pageContext.request.contextPath }/login/loginForm.do"><b>이전페이지로 돌아가기</b></a></p>
								</div>
								<div class="col-md-2">
<%-- 									<img src="${pageContext.request.contextPath }/assets/images/logolaon-small.png" alt="small-logo.png"> --%>
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

</script>
<!-- Required Jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery.min.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-ui/jquery-ui.min.js "></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/popper.js/popper.min.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="${pageContext.request.contextPath }/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/SmoothScroll.js"></script>     
    <script src="${pageContext.request.contextPath }/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<!-- i18next.min.js -->
<!-- <script type="text/javascript" src="bower_components/i18next/js/i18next.min.js"></script> -->
<!-- <script type="text/javascript" src="bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script> -->
<!-- <script type="text/javascript" src="bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script> -->
<!-- <script type="text/javascript" src="bower_components/jquery-i18next/js/jquery-i18next.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/common-pages.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/assets/js/validation.js'></script>
</body>

<script type="text/javascript">

var id_flag = false;
var nick_flag = false;
var check_flag= false;
var con_flag = false;
var tmp_key="";
$(function(){
	//메일발송
	if(eval('${!empty message}')){
			messagePrt('${message}');
	}
	$('#send_mail').click(function(){
		
		if(!$('input[name=mem_mail]').val().validationMAIL()){
			alert("형식에 맞지않은 아이디입니다.")
			
			return false;
		}
		
		if ($('#mem_mail').val() == null || $('#mem_mail').val() == "") {
			alert("이메일을 입력해주세요 :)");
		} else {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/member/sendCode.do',
				dataType : 'json', 
				data : { 
					mem_mail : $('#mem_mail').val(),
				},
				error : function(result){
					alert('code : ' + result.status + 
						' | message : ' + result.responseText);
				},
				success : function(andView){
					alert("인증키가 메일이 발송되었습니다.\n하단에 인증키를 입력해주세요 :>");
					tmp_key = andView.keycode;
				}
			});
		}
	});
	
	
	//인증키 검증
	$("#key_chk").click(function(){
		if ($('#mem_key').val() == tmp_key) {
// 			alert("인증키 : "+tmp_key);
// 			alert("입력값 : "+$('#mem_key').val());
			alert("정상적으로 인증되었습니다.");
			check_flag = true;
		}else {
			alert("올바른 인증키를 입력해주세요.");
			check_flag = false;
		}
	});
	
	//닉네임 중복검사
	$('#nick_chk').click(function(){
		nick_flag = false;
		
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/member/memberForm/nickChk.do',
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
					nick_flag = false;
				}else {
					nick_flag = true;
				}
			}
		});
	});
	
	
	//id 중복검사
	$('#id_chk').click(function(){
		id_flag = false;

		if(!$('input[name=mem_id]').val().validationID()){
			alert("형식에 맞지않은 아이디입니다.");
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/member/memberForm/idChk.do',
			dataType : 'json',
			data : { mem_id : $('input[name=mem_id]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(andView){
// 				alert(andView.result)
				var result = andView.result;
				alert(result);
				
				if (result == "이미 사용중인 ID입니다.") {
					$('#mem_id').val('');
					id_flag = false;
				}else{
					id_flag = true;
				}
// 				alert(id_flag);
			}
		});
	});
	
	
// 	var insertChk =$('#insertChk');
// 	var chk = false;
	
		
	$("#insertMem").click(function(){
		if (id_flag == true && nick_flag==true && check_flag==true) {
			if ($("input:checkbox[name='insertChk']").is(":checked") == true){
				$('form[name=memberForm]').submit(function(){
					
					if(!$('input[name=mem_id]').val().validationID()){
						alert("형식에 맞지않은 아이디입니다.");
						return false;
					}
					
					if(!$('input[name=mem_pass]').val().validationPWD()){
						alert("형식에 맞지않은 아이디입니다.");
						return false;
					}
					if($('input[name=mem_pass]').val()!=$('input[name=confirm_mem_pass]').val()){
						alert("비밀번호가 일치하지 않습니다");
						return false;
					}
					
					if(!$('input[name=mem_mail]').val().validationMAIL()){
						return submitFail('E-Mail');
					}
					
					if (id_flag==false) {
						alert("id 중복검사를 진행해주세요");
						return false;
					}
					
					if (nick_flag==false) {
						alert("닉네임 중복검사를 진행해주세요");
						return false;
					}
					
					if (check_flag == false) {
						alert("인증키 확인을 정상적으로 마쳐야 가입 가능합니다.");
						return false;
					}
				});
			}else {
				alert("약관에 동의해주세요");
				con_flag = false;
				return con_flag;
			}
		}else{
			alert("회원가입 검사를 진행해주세요");
			return false;
		}
	});
	
});


</script>

</html>
