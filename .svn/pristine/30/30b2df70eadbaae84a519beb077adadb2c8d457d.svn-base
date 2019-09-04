<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* .nav-tabs > li { */
/*	 float:none; */
/*	 display:inline-block; */
/*	 zoom:1; */
/* } */

/* .nav-tabs { */
/*	 text-align:center; */
/* } */
/* .nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus{ */
/* 	background-color:yourBgColor; */
/* 	color:#05cfb3; */
/* } */
.nav-tabs{
  background-color:#ffffff;
  
}
/* .tab-content{ */
/*	 background-color:#05cfb3; */
/*	 color:#fff; */
/*	 padding:5px */
/* } */
/* .nav-tabs > li > a{ */
/*   border: medium none; */
/* } */
.nav-tabs > li > a:hover{
  background-color: #1e554d !important;
	border: medium none;
	border-radius: 0;
	color:#fff;
}

.nav-tabs .slide {
	background: #1e554d;
	width: 100%;
	height: 4px;
	position: absolute;
	-webkit-transition: left 0.3s ease-out;
	transition: left 0.3s ease-out;
	bottom: 0;
}

.md-tabs .nav-item.open .nav-link, .md-tabs .nav-item.open .nav-link:focus, .md-tabs .nav-item.open .nav-link:hover, .md-tabs .nav-link.active, .md-tabs .nav-link.active:focus, .md-tabs .nav-link.active:hover
{
	color: #1e554d;
	border: none;
	background-color: transparent;
	border-radius: 0;
}

/* .md-tabs .nav-item.open .nav-link,  .md-tabs .nav-item.open .nav-link:hover, .md-tabs .nav-link.active{ */
/*	 color: #05cfb3; */
/*	 border: none; */
/*	 background-color: transparent; */
/*	 border-radius: 0; */
/* } */
.md-tabs .nav-link.active:hover {
	color: #ffffff;
	border: none;
	background-color: transparent;
	border-radius: 0;
}
</style>
</head>
<body>
<!-- background-size: 100%;  -->
<div  style="height: 100px; ">

	<div style="margin: auto; ">
	<input type="hidden" id="procode" value="${pro_code }">
<!-- Nav tabs -->
		<ul id="ul_menu" class="nav nav-tabs md-tabs" role="tablist" >
			<li class="nav-item" >
				<a id="tab_homes" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/issueMain.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }" >홈</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item" >
				<a id="tab_team" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/crew/crewList.do?pro_code=${pro_code}&pro_name=${param.pro_name }" role="tab" >팀원</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item">
				<a id="tab_alarm"class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/alramboard/alramboardList.do?pro_code=${pro_code}&pro_name=${param.pro_name }" role="tab" >알림</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item" >
<!-- 				<a class="nav-link" onclick="fn_schedule()" aria-expanded="false">일정</a> -->
				<a id="tab_schedule" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/schedule/schedule.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }" role="tab" >일정</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item" >
				<a id="tab_issue" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/issueboard/issueboardList.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }" >이슈</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item" >
				<a id="tab_err" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/errboard/errboardList.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }" >결함</a>
				<div class="slide"></div>
			</li>
			<li class="nav-item" >
				<a id="tab_free" class="nav-link" href="${pageContext.request.contextPath}/user/issuetracker/board/projectboardList.do?pro_code=${pro_code}&pro_name=${param.pro_name }" >자유게시판</a>
				<div class="slide"></div>
			</li>
		</ul>

		</div>
	<div class="row" style="height: 60px; background-color: #ffffff" >
		<div class="sub-title" style="height:40px; margin:auto; margin-left:40px; text-align: center;"  >
		
		<h3 ><i class="ti-folder"></i>&nbsp;${param.pro_name }</h3>
		</div>
	</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/script/jquery.cookie.js"></script>
<script type="text/javascript">

$(function(){

	 if (location.pathname.indexOf('issueMain') != -1) {
	      $('#tab_homes').addClass('active');
	   }
	 if (location.pathname.indexOf('crewList') != -1) {
	      $('#tab_team').addClass('active');
	   }
	   if (location.pathname.indexOf('alram') != -1) {
	      $('#tab_alarm ').addClass('active');
	   }
	   if (location.pathname.indexOf('schedule') != -1) {
	      $('#tab_schedule').addClass('active');
	   }
	   if (location.pathname.indexOf('issueboard') != -1) {
	      $('#tab_issue').addClass('active');
	   }
	   if (location.pathname.indexOf('errboard') != -1) {
	      $('#tab_err').addClass('active');
	   }
	   if (location.pathname.indexOf('projectboard') != -1) {
	      $('#tab_free').addClass('active');
	   }
	
});

// $(document).ready( function() {
	
// 	$("#ul_menu").click(function(event){
// 		alert("css");
// 		$("#ul_menu").find('a').attr('class','active');
// 	});
// });
</script>

</html>