<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>:: 라온IDE 카카오톡으로 가입하기 ::</title>
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
                        <form name="kt_form" class="md-float-material form-material">
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
                                    	<input type="hidden" name="mem_id" id="mem_id" value="${kt_id }">
                                        <input type="text" name="mem_nick" id="mem_nick" class="form-control" required="" style="width: 300px;">
                                        <label class="float-label">NICKNAME</label>
                                        <button id=nick_chk type="button" style="width: 100px; margin: auto;" class="btn waves-effect waves-light btn-inverse btn-square">
                                           <font size="2em;">중복검사</font>	
                                       	</button>
                                        <span class="form-bar" style="width: 300px"></span>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="email" name="mem_mail" id="mem_mail" class="form-control" required="" style="width: 300px;">
                                        <label class="float-label">EMAIL</label>
                                        <button id=mail_chk type="button" style="width: 100px; margin: auto;" class="btn waves-effect waves-light btn-inverse btn-square">
                                           <font size="2em;">중복검사</font>	
                                       	</button>
                                        <span class="form-bar"></span>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">회원가입</button>
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
<!-- Warning Section Ends -->
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
<!-- <!-- i18next.min.js --> -->
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
$(function () {
	var flagNick = false;
	var flagMail = false;
	
	$('#nick_chk').click(function(){
		
		if($('#mem_nick').val()==null || $('#mem_nick').val()==""){
			alert("닉네임을 입력해주세요.");
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/login/kakao/nickCheck.do',
			dataType : 'json',
			data : { mem_nick : $('input[name=mem_nick]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(andView){
				alert(andView.result);
				var result = andView.result;
				flagNick = true;
				
				if(result == "중복된 닉네임입니다."){
					$('#mem_nick').val('');
					flagNick = false;
				}
			}
		});
	});
	
	$('#mail_chk').click(function(){
		
		if($('#mem_mail').val()==null || $('#mem_mail').val()==""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/login/kakao/mailCheck.do',
			dataType : 'json',
			data : { mem_mail : $('input[name=mem_mail]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(andView){
				alert(andView.result);
				var result = andView.result;
				flagMail = true;
				
				if(result == "중복된 이메일입니다."){
					$('#mem_mail').val('');
					flagMail = false;
				}
			}
		});
	});
	
   $('form[name=kt_form]').submit(function(){
	   
	   if(flagNick==true&&flagMail==true){
		$(this).attr('action', '${pageContext.request.contextPath }/login/kakao/insertKt.do');
		return true;
	   }
	   if(flagNick == false){
		   alert("닉네임 중복검사를 해주세요.");
		   return false;
	   }
	   if(flagMail == false){
		   alert("이메일 중복검사를 해주세요.");
		   return false;
	   }
	   
	});
});
</script>
</body>

</html>














