<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
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
</style>

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
</head>
<body>
<!-- <div class="pcoded-inner-content" style="width: 800px;"> -->
<!--     Main-body start -->
<!-- 	<div class="main-body"> -->
<!-- 	    <div class="page-wrapper"> -->
<!-- 	        Page-body start -->
<!-- 	        <div class="page-body"> -->
<!-- 			<div class="card"> -->
<!-- 		       <div class="card-header"> -->
		       
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header" style="background-color: #1e554d;">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a>
                          <img class="img-fluid" src="${pageContext.request.contextPath}/assets/images/logowhitebig.png" alt="Theme-Logo" />
                      </a>
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
                          <li>
                              <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
       </div>
    </div>
    <div class="pcoded-inner-content" style="width: 790px; background-color:white; height: 900px;">
   		<div class="main-body">
    		<div class="page-wrapper">
	        <div class="page-body">
			<div class="card">
		       <div class="card-header">
		       <br>
               		<h5>팀구성을 위한 팝업창입니다.</h5>
               </div>
		       <div class="card-block">
		           <h4 class="sub-title">**프로젝트 팀 구성**</h4>
		         	 <form class="form-horizontal" id="registFrm" name="registFrm" role="form" action="" method="post">
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="pro_name">프로젝트 명</label>
		                   <div class="col-sm-10">
		                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control" 
		                       id="pro_name" name="pro_name" value="${recruitboardInfo.bo_title}">
		                   </div>
		               </div>
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="pro_cont">프로젝트<br/>상세내용</label>
		                   <div class="col-sm-10">
		                       <textarea id="pro_cont" name="pro_cont" style="height: 200px" rows="5" cols="5" class="form-control"
		                       onKeyUp="javascript:fnChkByte(this,'1000')">${recruitboardInfo.bo_content}</textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
		                   </div>
		               </div>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">시작일 ~ <br/>완료일</label>
		                   	 <div class='col-sm-4 input-group date dateTimePicker' id="datepicker1" style="width: 200px;">
		                         <input type='date' style="text-align: center; width:auto;" class="form-control" 
		                         name="pro_begin_date" id="pro_begin_date" value="${fn:substring(recruitboardInfo.bo_begin_date, 0, 10)}" required="required"/>
		                     </div>&nbsp;&nbsp;&nbsp;&nbsp;
		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp;
		                     <div class='col-sm-4 input-group date dateTimePicker' id="datepicker2" style="width: 200px;">
		                         <input type='date' style="text-align: center; width:auto;" class="form-control" 
		                         name="pro_end_date" id="pro_end_date" value="${fn:substring(recruitboardInfo.bo_end_date, 0, 10)}" required="required"/>
		                  	</div>
		               </div>
		               <div class="card-block table-border-style">
		                 <div class="table-responsive">
		                     <table class="table table-hover">
		                         <thead>
		                             <tr>
										 <th style="text-align: center;">팀원 닉네임</th>
										 <th style="text-align: center;">직책</th>
		                             </tr>
		                         </thead>
					         <tbody id = "boardListTbody">
					         	<c:forEach var="ar_id" items="${ar_mem_id}" varStatus="status">
					            	<tr>
					                  <td align="center">
					                    <label id="team_mem_nick" name="team_mem_nick">${ar_mem_nick[status.index]}</label>
					                    <input type="hidden" id="team_mem_id" name="team_mem_id" value="${ar_id }">
					                  </td>
					                  <td align="center">
					                    <select name='grand'>
										  	<option value='선택' selected>-- 선택 --</option>
										  <c:forEach items="${grandList }" var="grandInfo">
										  		<option value='${grandInfo.grand_code }'>${grandInfo.grand_code }</option>
										  </c:forEach>
										</select>
					                  </td>
					               </tr>
					             </c:forEach>
					         </tbody>
					      </table>
		                 </div>
		             </div>
		             
		            <label style="margin-left: 35%;">프로젝트 팀을 구성하시겠습니까?</label>
			        <div style="margin-left: 37%;">
						<button type="button" id="btn1" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;팀생성</button>
						<button id="btn2" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;안할래요</button>
					</div>
					
		           </form>
				</div>
				</div>
			</div>
		 </div>
 	</div>
 </div>

</body>
<script type="text/javascript">
$(document).ready( function() {
    var now = new Date();
 
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    
   document.getElementById("pro_begin_date").min = today;
   document.getElementById("pro_end_date").min = today;
});

$(function(){
	var crew_cnt = $('#boardListTbody tr').length + 1;
	
	// 팀원직책 selectBox값 가져오기
	function selectDelRow() {
		var chk = $("select[name=grand]").val(); 
		var len = $('#boardListTbody tr').length;  // select 박스의 전체 개수
		var selectVal = 'PL,';     

		for(var i = 0; i < len; i++){
			if(len == 1){
				selectVal += chk;
			}else{
				if(i == len-1){
					selectVal += $("select[name=grand]").eq(i).val();
				}else{
					selectVal += $("select[name=grand]").eq(i).val() + ',';
				}
				checkRow = '';
			}
		}
		return selectVal;
	}
	
	// 팀원 아이디 값 가져오기
	function trMember() {
		var chk = $("input[name=team_mem_id]").val(); 
		var len = $('#boardListTbody tr').length;  // select 박스의 전체 개수
		var selectVal = '${LOGIN_MEMBERINFO.mem_id},';     

		for(var i = 0; i < len; i++){
			if(len == 1){
				selectVal += chk;
			}else{
				if(i == len-1){
					selectVal += $("input[name=team_mem_id]").eq(i).val();
				}else{
					selectVal += $("input[name=team_mem_id]").eq(i).val() + ',';
				}
				checkRow = '';
			}
		}
		return selectVal;
	}
	
	// 팀구성
	$('#btn1').click(function(){
		
		// 타이틀 특수 문자가 있나 없나 체크 
		var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
		if(special_pattern.test($('input[name=pro_name]').val()) == true) { 
			alert("제목에는 특수문자를 사용할 수 없습니다.")
			return; 
		} 
    	if($('#pro_end_date').val() < $('#pro_begin_date').val()){
    		alert("프로젝트 기간이 잘못되었습니다. 완료일이 시작일보다 빠릅니다.");
    		return;
    	}
    	// 프로젝트 생성
		$.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/recruitboard/insertProject.do',
	         dataType : 'json', 
	         data : { 
	        	 crew_cnt : crew_cnt,
	        	 grand_code : selectDelRow(),
	        	 mem_id : trMember(),
	        	 pro_begin_date : $('#pro_begin_date').val(),
	        	 pro_end_date : $('#pro_end_date').val(),
	        	 pro_cont : $('#pro_cont').val(),
	        	 pro_name : $('#pro_name').val(),
	        	 bo_no : '${recruitboardInfo.bo_no}'
	        	 },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
	        	 alert(andView.result);
	        	 
	        	 opener.location.href='${pageContext.request.contextPath}/user/recruitboard/recruitboardList.do'; 
	        	 window.close();
	        	 
	        	 return true;
	         }
	      });
		

	});
    
   $('#btn2').click(function(){
	   window.close();
    });
   
      
});
function fnChkByte(obj, maxByte){
    var str = obj.value;
    var str_len = str.length;

    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for(var i=0; i<str_len; i++){
        one_char = str.charAt(i);
        if(escape(one_char).length > 4){
            rbyte += 3;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }

     if(rbyte > maxByte){
	  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  alert("글 내용은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte(obj, maxByte);
	  
	 }else{
	   document.getElementById('byteInfo').innerText = rbyte;
	 }
}
function fnChkByte_title(obj, maxByte){
    var str = obj.value;
    var str_len = str.length;

    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for(var i=0; i<str_len; i++){
        one_char = str.charAt(i);
        if(escape(one_char).length > 4){
            rbyte += 3;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }

     if(rbyte > maxByte){
	  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  alert("글 제목은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte_title(obj, maxByte);
	  
	 }
}
</script>
</html>