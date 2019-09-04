<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>:: 라온IDE 시작하기 ::</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
      <!-- Favicon icon -->

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
  <style type="text/css">
 body[themebg-pattern="themelaon"] {
/*  	background-image: url( "${pageContext.request.contextPath }/assets/images/8f24124fb847f8e32fd3d79c4609d54e.jpg" );  */
	background-color: #ffffff;
 }
  </style>
  </head>

  <body themebg-pattern="themelaon">
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
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <dir class="row" style="height: 100px;"></dir>
                        <form class="md-float-material form-material">
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                            <div class="text-center" style="height: 150px;">
                            <a href="${pageContext.request.contextPath }/login/loginForm.do">
                                <img width="80px;" src="${pageContext.request.contextPath }/assets/images/logolaon.png" alt="logo.png">
                            </a>
                            </div>
                                          <h6 align="center">회원가입으로 라온 IDE의 모든 기능을 시작할 수 있습니다.</h7><br/>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="text" name="mem_id" id="mem_id"class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">ID</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" name="mem_pass" id="mem_pass" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">PASSWORD</label>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                            <div class="checkbox-fade fade-in-primary d-">
<!--                                                 <label> -->
<!--                                                     <input type="checkbox" value=""> -->
<!--                                                     <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span> -->
<!--                                                     <span class="text-inverse">아이디 기억하기</span> -->
<!--                                                 </label> -->
                                            </div>
                                            <div class="forgot-phone text-right f-right">
                                                <a href="${pageContext.request.contextPath }/login/findIDForm.do" class="text-right f-w-600">아이디 찾기</a>&nbsp;|&nbsp;
                                                <a href="${pageContext.request.contextPath }/login/findPWForm.do" class="text-right f-w-600">비밀번호 찾기</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" id="loginBtn" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">로그인</button>            
                                        </div>
<!--                                         <div class="col-md-12"> -->
<!--                                         	<a id="kakao-login-btn"></a> -->
<!--                                         </div> -->
										<div class="col-md-12">
											<a id="custom-login-btn" href="javascript:loginWithKakao()">
												<img src="${pageContext.request.contextPath }/assets/images/kakao-login.png" class="m-b-20"/>
											</a>
										</div>
                                        <div class="col-md-12">
                                            <button type="button" id="registBtn" class="btn btn-success btn-md btn-block waves-effect waves-light text-center m-b-20">회원가입</button>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    
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
<!-- 암호화복호화 -->
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/jsbn.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/rsa.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/prng4.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/rng.js'> </script>
<!-- 카카오톡 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

//사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('987ca50780e720d7d11572130e47bfed');

var kt_id = "";
function loginWithKakao(){
	
// 	Kakao.Auth.login({ // 초기 로그인창 한번으로 같은 계정 자동로그인
// 		   success: function(authObj) {
// 		     Kakao.API.request({
// 		       url: '/v1/user/me',
// 		       success: function(res) {
// 	// 	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
// 		             kt_id = res.id;
// 	// 	             alert(kt_id);
// 		             location.href="${pageContext.request.contextPath }/login/kakao/kakaologinCheck.do?kt_id=" + kt_id;
// 		           }
// 		         })
// 		       },
// 		       fail: function(error) {
// 		         alert(JSON.stringify(error));
// 		       }
// 	});

	Kakao.Auth.loginForm({ // 로그인버튼 누를 때 마다 로그인창 출력
		   success: function(authObj) {
		     Kakao.API.request({
		       url: '/v1/user/me',
		       success: function(res) {
	// 	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
		             kt_id = res.id;
	// 	             alert(kt_id);
		             location.href="${pageContext.request.contextPath }/login/kakao/kakaologinCheck.do?kt_id=" + kt_id;
		           }
		         })
		       },
		       fail: function(error) {
		         alert(JSON.stringify(error));
		       }
	});
}

$(function () {
   if(eval('${!empty message}')){
      alert('${message}');
   }
   $("#mem_pass").on("keypress", function(e) {
	    if ((e.keyCode == 10 || e.keyCode == 13)) {
	    	
	    	if($('input[name=mem_id]').val() == ''){
	        	alert("아이디를 입력해주세요");
	        	return;
			}

		   	if($('input[name=mem_pass]').val() == ''){
		   		alert("비밀번호를 입력해주세요");
		   		return;
		    }
	         e.preventDefault();
	         
	     	 fn_login();
	    }
	    
   });
   
   $('#loginBtn').click(function () {
	   
       if($('input[name=mem_id]').val() == ''){
        	alert("아이디를 입력해주세요");
        	return;
	      }

	   	if($('input[name=mem_pass]').val() == ''){
	   		alert("비밀번호를 입력해주세요");
	   		return;
	      }
	   	
	   	fn_login();
		
	});
   
   $('#registBtn').click(function () {
	   $(location).attr('href', '${pageContext.request.contextPath }/member/memberForm.do');
   });
   
   // 로그인 필터 메시지
	if(eval('${!empty param.message}')){
		alert('${param.message}');
	}
});

function fn_login() {
	// 유저가 입력한 아이디, 패스워드를 동적으로  Form tag를 작성해서 submit
	var frm = $('<form action="${pageContext.request.contextPath}/login/loginCheck.do" method="POST"></form>');
	$(frm).append('<input type="hidden" name="mem_id" value="'+ $('input[name=mem_id]').val() +'"></input>');
	$(frm).append('<input type="hidden" name="mem_pass" value="'+ $('input[name=mem_pass]').val() +'"></input>');
	$(document.body).append(frm);

	var modulus = '${publicKeyMap["publicKeyModulus"]}';
    var exponent = '${publicKeyMap["publicKeyExponent"]}';
    
    var rsaObject = new RSAKey();
    rsaObject.setPublic(modulus, exponent);
    
    var encryptID = rsaObject.encrypt($('input[name=mem_id]').val());
    var encryptPWD = rsaObject.encrypt($('input[name=mem_pass]').val());
    
	$(frm).find('input[name=mem_id]').val(encryptID);
    $(frm).find('input[name=mem_pass]').val(encryptPWD);
    
	frm.submit();
}
</script>
</body>

</html>
