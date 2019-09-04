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
    background-image: url(${pageContext.request.contextPath}/assets/images/leftimg.png);
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
.noti_alram {
 
 max-height: 430px; 
 overflow: auto;
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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/SmoothScroll.js"></script> --%>
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
<script>

// var ws = new WebSocket("ws://localhost/${pageContext.request.contextPath}/wschat");

// 추후 서버 연결하는 도메인으로 부분 수정할 것
// var ws = new WebSocket("ws://192.168.201.13/${pageContext.request.contextPath}/syncpush");
var ws = new WebSocket("ws://localhost/${pageContext.request.contextPath}/syncpush");

// if(ws === undefined ){
// 	ws = new WebSocket("ws://localhost/${pageContext.request.contextPath}/syncpush");
// }
// if (ws != null && ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
// 	alert("이미 연결되어있음!!");
// 	return;
// }
function notify(message, type){
    $.growl({
        message: message
    },{
        type: type,
        allow_dismiss: false,
        label: 'Cancel',
        className: 'btn-xs btn-inverse',
        placement: {
            from: 'top',
            align: 'right'
        },
        delay: 3500,
        animate: {
                enter: 'animated fadeInRight',
                exit: 'animated fadeOutRight'
        },
        offset: {
            x: 10,
            y: 60
        }
    });
};
$(function(){
	
	// 웹소켓 서버 엔드포인트 컨넥션 및 스트리밍 관리 
	ws.onopen = function() {	};
	
	// 웹소켓 서버 엔드포인트로부터 수신 이벤트 리스너 
	ws.onmessage = function(message) {
		notify(message.data, 'inverse');
		
		var ori_badge = $('#badge').text();
	
		var badge_val ="";
		if(ori_badge == null || ori_badge == ""){
			badge_val = "<label class='badge .badge-lg  badge-danger' id='badge'>1</label>";
			$("#badge").replaceWith(badge_val);
		}else{
			badge_val = parseInt($('#badge').text()) + 1; 
			$("#badge").empty();
			$("#badge").text(badge_val);
		}
	};
	
	// 알람창을 띄우는 ajax
	fn_selectALOG();
});	

function fn_selectALOG() {
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/alramlog/alramLogList.do',
		dataType : 'json', 
		data : mem_id :'${LOGIN_MEMBERINFO.mem_id}',
		error : function(data){
			alert(data.status + ' | ' + data.responseText);
			return false;
		},
		success : function(data){
			var alramLogList = data.alramLogList;
			var noti_html = "";
			var noti_label ="";
			
			if( alramLogList.length > 0){
				noti_label += "<label class='badge .badge-lg  badge-danger' id='badge'>"+alramLogList.length+"</label>";
				noti_html += "		<li> 		                                  ";
				noti_html += "   	 	<h6>프로젝트 변동 알림</h6>                ";
				noti_html += "      </li>                                        ";
			}else{
				noti_label += "<label id='badge'></label>";
				noti_html += "    	<li>                                           ";
				noti_html += "        	<h6>프로젝트 변동 알림</h6>                ";
				noti_html += "      </li>                                        ";
			}
			
			var alram_code_label = "";
			var alram_url = "";
			for (var i = 0; i < alramLogList.length; i++) {
				if(alramLogList[i].alram_code == 'ISSUE'){
					alram_code_label = "<label class='label ' style='background-color: #424C91;'><font size='2pt'>이슈</font></label>";
					alram_url = "${pageContext.request.contextPath}/user/issuetracker/issueboard/issueboardView.do?isu_no="+alramLogList[i].bo_no+"&rnum=" +
					"&currentPage=&pro_code="+alramLogList[i].pro_code+"&search_keyword=&search_keycode=&pro_name="+alramLogList[i].pro_name;
				}else if(alramLogList[i].alram_code == 'ERROR'){
					alram_code_label = "<label class='label ' style='background-color: #D372A4;'><font size='2pt'>결함</font></label>";
					alram_url = "${pageContext.request.contextPath}/user/issuetracker/errboard/errboardView.do?err_no="+alramLogList[i].bo_no+"&rnum=" +
					"&currentPage=&pro_code="+alramLogList[i].pro_code+"&search_keyword=&search_keycode=&pro_name="+alramLogList[i].pro_name;
				}else{
					alram_code_label = "<label class='label ' style='background-color: #22A598;'><font size='2pt'>게시글</font></label>";
					alram_url = "${pageContext.request.contextPath}/user/issuetracker/board/projectboardView.do?bo_no="+alramLogList[i].bo_no+"&rnum=" +
					"&currentPage=&pro_code="+alramLogList[i].pro_code+"&search_keyword=&search_keycode=&pro_name="+alramLogList[i].pro_name;
				}
					
				noti_html += "<li class='waves-effect waves-light'>                         ";
				noti_html +=	"    <div class='media'>";
				noti_html +=	"    	<div class='media-body'  style='cursor: pointer;' onclick=\"location.href='"+alram_url+"'\" >   ";
				noti_html +=	"        	<h5 class='notification-user'>";
				noti_html +=					alram_code_label;
				noti_html +=					"&nbsp<i class='ti-folder'></i>&nbsp&nbsp";
				noti_html +=					alramLogList[i].pro_name;
				noti_html +=	"        	</h5>";
				noti_html +=	"        	<p class='notification-msg'><font color='#D36C84'> &nbsp;&nbsp;@"+alramLogList[i].bo_writer+"&nbsp;</font>";
				noti_html +=				"님의 새 글";
			
	//    		noti_html +=    "        	<p class='notification-msg'>";
				noti_html +=	"				<label class='label'  style='background-color: #3F4040;'><font size='2pt'>\""+alramLogList[i].alram_content.substring(0, 13 )+"..\"</font></label>";
				noti_html +=	"			</p>";
				noti_html +=	"        	<span class='notification-time'>"+alramLogList[i].alram_date+"</span>	";
				noti_html +=	"    	</div>";
				noti_html +=	"    	<a href='javascript:fn_deleteALOG("+alramLogList[i].alog_no+");'><font size='2px'><i class='ti-trash'></i>지우기</font></a>";
				noti_html +=	"	</div>";
				noti_html +=	"</li>";
		}
		$("#notiUl").empty();
		if( alramLogList.length > 0){
		    $("#notiUl").addClass('noti_alram');
		}
		$("#notiUl").append(noti_html);
		$("#badge").replaceWith(noti_label);
			return true;
		}
	});
}


// 알람 삭제
function fn_deleteALOG(alog_no){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/alramlog/deleteALOG.do',
		dataType : 'json', 
		data : { 
			alog_no : 		alog_no
		},
		error : function(andView){
			alert(andView.status + ' | ' + andView.responseText);
			return false;
		},
		success : function(andView){
   	 		fn_selectALOG();
   	 		ws.send('알람이 삭제되었습니다!');
     	 	return true;
		}
	});
}

// 메세지 송신
function postToServer() {
	// 일반 문자열 전송(default 인코딩 타입 UTF-8 적용)
	ws.send($("#msg").val());
	$("#msg").val("");
}
// WebSocket Server 컨넥션 종료
function closeConnect() {
	// // 웹소켓 서버 엔드포인트 대상 접속종료 이벤트 전파 
	ws.close();
}

</script>
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
                      <a href="${pageContext.request.contextPath}/user/project/pro_main.do">
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
                          <li class="header-notification" id="notOkList">
<!--                               <a href="#!" class="waves-effect waves-light"> -->
<!--                               <a href="#!" class="waves-effect waves-light"> -->
                              <a href="javascript:fn_selectALOG()" class="waves-effect waves-light">
                                  <i class="ti-bell"></i>
                              	  &nbsp;&nbsp;<label id="badge"></label>
                              </a>
<!--                               확인하지 않은 알람이 0개 이상일 때만 뜨게 주석 풀도록 하면 됨. 코어태그로 -->
<!--						<label class="badge .badge-lg  badge-danger" >5</label>  --> 
<!--                               <ul class="show-notification" id="notiUl" > -->
                              <ul class="show-notification" id="notiUl" style='width: 470px;'>
<!--                                   <li> -->
<!--                                       <h6>새로운 알림이 없습니다!</h6> -->
<!--                                   </li> -->
<!--                                   반복되면 되는 부분 끝 -->
                                  
                              </ul>
                          </li>
                          
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
<%--                                   <img src="${pageContext.request.contextPath}/assets/images/user.png" class="img-radius" alt="User-Profile-Image"> --%>
                                  <span>${LOGIN_MEMBERINFO.mem_nick }</span>
<%--                                   <span>${memberInfo.mem_nick }</span> --%>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
<!--                                   <li class="waves-effect waves-light"> -->
<!--                                       <a href="#!"> -->
<!--                                           <i class="ti-settings"></i> Settings -->
<!--                                       </a> -->
<!--                                   </li> -->
                                  <li class="waves-effect waves-light">
<!--                                       <a href="user-profile.html"> -->
                                      <a onclick="javascript:fn_profile();">
                                          <i class="ti-user"></i> 마이페이지
                                          <input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id }">
                                      </a>
                                  </li>
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

          <div class="pcoded-main-container" style="background-color:white;">
              <div class="pcoded-wrapper">
                  <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
                              <div class="main-menu-header" style="height: 122px;">
<%--                                   <img class="img-80 img-radius" src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" alt="User-Profile-Image"> --%>
<!--                                   <div class="user-details"> -->
<!--                                       <span id="more-details">John Doe<i class="fa fa-caret-down"></i></span> -->
<!--                                   </div> -->
                              </div>
        
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
                              <li id="tab_home">
                                  <a  href="${pageContext.request.contextPath}/user/project/pro_main.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>H</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">HOME</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                             
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms">커뮤니티</div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li id="tab_notice">
                                  <a href="${pageContext.request.contextPath}/user/notice/noticeList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-direction"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">공지사항</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_recruitboard">
                                  <a href="${pageContext.request.contextPath}/user/recruitboard/recruitboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-user"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">팀원모집</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_freeboard">
                                  <a href="${pageContext.request.contextPath}/user/freeboard/freeboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-comments"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">자유게시판</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_library">
                                  <a href="${pageContext.request.contextPath}/user/library/libraryList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-save"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">자료실</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
        
                              <li id="tab_qaboard">
                                  <a href="${pageContext.request.contextPath}/user/qaboard/qaboardList.do" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-help-alt"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">Q&A</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li id="tab_faqboard">
                                  <a href="${pageContext.request.contextPath}/user/faqboard/faqList.do" class="waves-effect waves-dark">
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
    
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 10]>
    <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="${pageContext.request.contextPath}/assets/images/browser/chrome.png" alt="Chrome">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="${pageContext.request.contextPath}/assets/images/browser/firefox.png" alt="Firefox">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="${pageContext.request.contextPath}/assets/images/browser/opera.png" alt="Opera">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="${pageContext.request.contextPath}/assets/images/browser/safari.png" alt="Safari">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="${pageContext.request.contextPath}/assets/images/browser/ie.png" alt="">
                        <div>IE (9 & above)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->
    <!-- Warning Section Ends -->
    
    <!-- Required Jquery -->

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
function fn_logout() {
	
	Kakao.init("987ca50780e720d7d11572130e47bfed");

	if(${LOGIN_MEMBERINFO.mem_pass == null}){
		Kakao.Auth.logout();
		$(location).attr('href', '${pageContext.request.contextPath }/login/logout.do');
	}else{
		$(location).attr('href', '${pageContext.request.contextPath }/login/logout.do');
	}
}

function fn_profile(){
	if (${LOGIN_MEMBERINFO.mem_id != null}) {
// 		var mem_id = $(this).find('input[name=mem_id]').val();
		var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
		
		window.open("${pageContext.request.contextPath}/user/member/memberProfile.do?mem_id="+mem_id,
						"LAON :: 회원 정보",
						"width=600, height=940, toolbar=no, menubar=no, scrollbars=no, resizable=no");
		
// 		$(location).attr('href', '${pageContext.request.contextPath}/user/member/memberProfile.do?mem_id='+mem_id);
	}else{
		alert("로그인 후 이용할 수 있습니다.");
	}
}
$(function(){
	
	if (location.pathname.indexOf('pro_main') != -1) {
	      $('#tab_home').addClass('active');
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