<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title><tiles:getAsString name="title"/></title>
    
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
<link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css">
<!-- animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css/css/animate.css">

<!-- themify icon -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/pages/notification/notification.css">
<!-- scrollbar.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.mCustomScrollbar.css">
<!-- am chart export.css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
<style type="text/css">

.main-menu .main-menu-header {
    padding: 15px 0;
/*     background-image: url(${pageContext.request.contextPath}/assets/images/leftimg.png); */
    background-size: cover;
    text-align: center;
    position: relative;
}
.pcoded[fream-type="theme1"] .page-header:before, .pcoded[fream-type="theme1"] .main-menu .main-menu-header:before {
    background: rgba(0, 0, 0, 0);
}
.main-menu .main-menu-header:before {
    content: "";
    background: rgba(0, 0, 0, 0);
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 0;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-notify.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/widget/excanvas.js"></script>
<!-- waves js -->
<script src="${pageContext.request.contextPath}/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/modernizr/modernizr.js"></script>
<!-- slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/SmoothScroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Chart js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart.js/Chart.js"></script>
<!-- amchart js -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/gauge.js"></script>
<script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/serial.js"></script>
<script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/light.js"></script>
<script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/pie.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<!-- menu js -->
<script src="${pageContext.request.contextPath}/assets/js/pcoded.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vertical-layout.min.js "></script>
<!-- notification js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-growl.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/notification/notification.js"></script> --%>
<script src="${pageContext.request.contextPath}/assets/js/pcoded.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vertical-layout.min.js "></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- custom js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js "></script>
</head>

  <body>
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
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header" style="background-color: #1e554d;">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                          <i class="ti-menu"></i>
                      </a>
                      <div class="mobile-search waves-effect waves-light">
                          <div class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control" placeholder="Enter Keyword">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <a href="${pageContext.request.contextPath}/admin/member/memberList.do">
                          <img class="img-fluid" src="${pageContext.request.contextPath}/assets/images/logowhitebig.png" alt="Theme-Logo" />
                      </a>
                      <a class="mobile-options waves-effect waves-light">
                          <i class="ti-more"></i>
                      </a>
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
<!--                           <li class="header-search"> -->
<!--                               <div class="main-search morphsearch-search"> -->
<!--                                   <div class="input-group"> -->
<!--                                       <span class="input-group-addon search-close"><i class="ti-close"></i></span> -->
<!--                                       <input type="text" class="form-control"> -->
<!--                                       <span class="input-group-addon search-btn"><i class="ti-search"></i></span> -->
<!--                                   </div> -->
<!--                               </div> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                               <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light"> -->
<!--                                   <i class="ti-fullscreen"></i> -->
<!--                               </a> -->
<!--                           </li> -->
                      </ul>
                      <ul class="nav-right">
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
<%--                                   <img src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image"> --%>
                                  <span>${LOGIN_ADMININFO.mem_nick }</span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
<!--                                   <li class="waves-effect waves-light"> -->
<!--                                       <a href="#!"> -->
<!--                                           <i class="ti-settings"></i> Settings -->
<!--                                       </a> -->
<!--                                   </li> -->
<!--                                   <li class="waves-effect waves-light"> -->
<!--                                       <a href="email-inbox.html"> -->
<!--                                           <i class="ti-email"></i> My Messages -->
<!--                                       </a> -->
<!--                                   </li> -->
<!--                                   <li class="waves-effect waves-light"> -->
<!--                                       <a href="auth-lock-screen.html"> -->
<!--                                           <i class="ti-lock"></i> Lock Screen -->
<!--                                       </a> -->
<!--                                   </li> -->
                                  <li class="waves-effect waves-light">
                                      <a onclick="javascript:fn_logout();">
                                          <i class="ti-layout-sidebar-left"></i> 로그아웃
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
<!--                               <div class="main-menu-header" style="height: 122px;"> -->
<%--                                   <img class="img-80 img-radius" src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" alt="User-Profile-Image"> --%>
<!--                                   <div class="user-details"> -->
<!--                                       <span id="more-details">John Doe<i class="fa fa-caret-down"></i></span> -->
<!--                                   </div> -->
<!--                               </div> -->
                              <div class="main-menu-content">
                                  <ul>
                                      <li class="more-details">
                                          <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                                          <a href="#!"><i class="ti-settings"></i>Settings</a>
                                          <a href="${pageContext.request.contextPath}/login/logout.do"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
    
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li id="tab_member">
                                  <a href="${pageContext.request.contextPath}/admin/member/memberList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>M</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">회원관리</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                             
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms">커뮤니티</div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li id="tab_notice">
                                  <a href="${pageContext.request.contextPath}/admin/notice/noticeList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-direction"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">공지사항</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_recruitboard">
                                  <a href="${pageContext.request.contextPath}/admin/recruitboard/recruitboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-user"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">팀원모집</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_freeboard">
                                  <a href="${pageContext.request.contextPath}/admin/freeboard/freeboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-comments"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">자유게시판</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_library">
                                  <a href="${pageContext.request.contextPath}/admin/library/libraryList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-save"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">자료실</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_qaboard">
                                  <a href="${pageContext.request.contextPath}/admin/qaboard/qaboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-help-alt"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">Q&A</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_faqboard">
                                  <a href="${pageContext.request.contextPath}/admin/faqboard/faqList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-info-alt"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">FAQ</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                          </ul>
                      </div>
                  </nav>
                  <div class="pcoded-content">
                      <tiles:insertAttribute name="tabmenu"></tiles:insertAttribute>
                        <div class="pcoded-inner-content">

<div class="main-body"  style="background-color: #ffffff;">      
<tiles:insertAttribute name="content"></tiles:insertAttribute>
</div>
                               
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script type="text/javascript">
function fn_logout() {
	$(location).attr('href', '${pageContext.request.contextPath }/login/logout.do');
}

function fn_profile(){
	if (${LOGIN_ADMININFO.mem_id != null}) {
// 		var mem_id = $(this).find('input[name=mem_id]').val();
		var mem_id = '${LOGIN_ADMININFO.mem_id}';
		
		window.open("${pageContext.request.contextPath}/user/member/memberProfile.do?mem_id="+mem_id,
						"LAON :: 회원 정보",
// 						"width=630, height=850");
						"width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=no");
		
// 		$(location).attr('href', '${pageContext.request.contextPath}/user/member/memberProfile.do?mem_id='+mem_id);
	}else{
		alert("로그인 후 이용할 수 있습니다.");
	}
}

$(function(){
	if (location.pathname.indexOf('memberList') != -1) {
	      $('#tab_member').addClass('active');
	   }
	if (location.pathname.indexOf('memberView') != -1) {
	      $('#tab_member').addClass('active');
	   }
	 if (location.pathname.indexOf('notice') != -1) {
	      $('#tab_notice').addClass('active');
	   }
	   if (location.pathname.indexOf('recruitboard') != -1) {
	      $('#tab_recruitboard').addClass('active');
	   }
	   if (location.pathname.indexOf('freeboard') != -1) {
	      $('#tab_freeboard').addClass('active');
	   }
	   if (location.pathname.indexOf('libraryList') != -1) {
	      $('#tab_library').addClass('active');
	   }
	   if (location.pathname.indexOf('qaboardList') != -1) {
	      $('#tab_qaboard').addClass('active');
	   }
	   if (location.pathname.indexOf('faqList') != -1) {
	      $('#tab_faqboard').addClass('active');
	   }
	
});
</script>
</html>