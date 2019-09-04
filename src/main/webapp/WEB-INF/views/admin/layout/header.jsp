<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>::: 코딩을 즐겁게! LAON IDE :::</title>
<style>


</style>
<!--Loading laon css 시작 -->
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
<body >
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
          <nav class="navbar header-navbar pcoded-header" style="background-color: #05cfb3;">
         
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
                      <a href="index.html">
                          <img class="img-fluid" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="Theme-Logo" />
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
                          <li class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                      </ul>
                      <ul class="nav-right">
                          <li class="header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="ti-bell"></i>
                                  <span class="badge bg-c-red"></span>
                              </a>
                              <ul class="show-notification">
                                  <li>
                                      <h6>Notifications</h6>
                                      <label class="label label-danger">New</label>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">John Doe</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Joseph William</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Sara Soudein</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                              </ul>
                          </li>
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <img src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                  <span>John Doe</span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
                                  <li class="waves-effect waves-light">
                                      <a href="#!">
                                          <i class="ti-settings"></i> Settings
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a href="user-profile.html">
                                          <i class="ti-user"></i> Profile
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a href="email-inbox.html">
                                          <i class="ti-email"></i> My Messages
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a href="auth-lock-screen.html">
                                          <i class="ti-lock"></i> Lock Screen
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a href="auth-normal-sign-in.html">
                                          <i class="ti-layout-sidebar-left"></i> Logout
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
         </div>
         </div>
         
</body>


<!-- Required Jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js "></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/widget/excanvas.js "></script>
<!-- waves js -->
<script src="${pageContext.request.contextPath}/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/modernizr/modernizr.js "></script>
<!-- slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/SmoothScroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
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
<!-- custom js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js "></script>

<!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
<%-- <script src="${pageContext.request.contextPath}/script/jquery-1.8.3.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery-ui.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/bootstrap.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/bootstrap-hover-dropdown.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/html5shiv.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/respond.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery.metisMenu.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery.slimscroll.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery.cookie.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/icheck.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/custom.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery.news-ticker.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/jquery.menu.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/pace.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/holder.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/responsive-tabs.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/script/zabuto_calendar.min.js"></script> --%>

</html>