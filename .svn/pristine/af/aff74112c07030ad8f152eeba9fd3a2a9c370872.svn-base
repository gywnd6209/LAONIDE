<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: LAON IDE ::: 프로젝트 생성</title>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- themify icon -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
<script type="text/javascript">
$(function() {
	$('#pro_name').val('${recruitboardInfo.bo_title}');
	$('#pro_cont').val('${recruitboardInfo.bo_content}');
	$('#pro_begin_date').val('${fn:substring(recruitboardInfo.pro_begin_date, 0, 10)}');
	$('#pro_end_date').val('${fn:substring(recruitboardInfo.pro_end_date, 0, 10)}');
});
</script>
<body>
<div class="pcoded-inner-content" style="width: 800px;">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card">
		       <div class="card-header">
		           <h5>생성할 프로젝트의 내용을 입력해주세요</h5>
		       </div>
		       <div class="card-block">
		         	 <form class="form-horizontal" id="registFrm" name="registFrm" role="form" action="" method="post">
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="pro_name">프로젝트 명</label>
		                   <div class="col-sm-10">
		                       <input type="text" class="form-control" id="pro_name" name="pro_name">
		                   </div>
		               </div>
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="pro_cont">프로젝트<br/>상세내용</label>
		                   <div class="col-sm-10">
		                       <textarea id="pro_cont" name="pro_cont" style="height: 200px" rows="5" cols="5" class="form-control"></textarea>
		                   </div>
		               </div>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">시작일 ~ <br/>완료일</label>
		                   	 <div class='col-sm-4 input-group date dateTimePicker' id="datepicker1" style="width: 200px;">
		                         <input type='date' style="text-align: center;" class="form-control" name="pro_begin_date" id="pro_begin_date" required="required"/>
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
		                     </div>&nbsp;&nbsp;&nbsp;&nbsp;
		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp;
		                     <div class='col-sm-4 input-group date dateTimePicker' id="datepicker2" style="width: 200px;">
		                         <input type='date' style="text-align: center;" class="form-control" name="pro_end_date" id="pro_end_date" required="required"/>
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
		                  	</div>
		               </div>
		             <label style="margin-left: 35%;">프로젝트를 구성하시겠습니까?</label>
		           <div style="margin-left: 35%;">
					<button type="button" id="btn1" class="btn waves-effect waves-light btn-success" style="float: center"></i>생성</button>
					<button type="button" id="btn2" class="btn waves-effect waves-light btn-info" style="float: center"></i>닫기</button>
<!-- 					<button type="button" id="test" class="btn waves-effect waves-light btn-info" style="float: center"></i>Test</button> -->
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
$(function(){
	
	var crew_cnt = $('#boardListTbody tr').length + 1;
	
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
	
	function trMember() {
		var chk = $("label[name=team_mem_id]").text(); 
		var len = $('#boardListTbody tr').length;  // select 박스의 전체 개수
		var selectVal = '${LOGIN_MEMBERINFO.mem_id},';     

		for(var i = 0; i < len; i++){
			if(len == 1){
				selectVal += chk;
			}else{
				if(i == len-1){
					selectVal += $("label[name=team_mem_id]").eq(i).text();
				}else{
					selectVal += $("label[name=team_mem_id]").eq(i).text() + ',';
				}
				checkRow = '';
			}
		}
		return selectVal;
	}
	
	
// 	$('#test').click(function(){
// 		alert(selectDelRow());
// 	});
	
	$('#btn1').click(function(){
		
		if($('#pro_end_date').val() < $('#pro_begin_date').val()){
		return submitFail("개발 기간이 잘못되었습니다. 완료예정일이 시작일보다 빠릅니다.");
	}
		
		if($('input[name=pro_name]').val()==""||$('input[name=pro_name]').val()==null){
			alert("프로젝트 명을 입력해주세요.");
    		var message = '프로젝트 명을 입력해주세요.';
	         return messagePrt(message);
	      }
		if($('#pro_cont').val()==""||$('#pro_cont').val()==null){
			alert("프로젝트 내용을 입력해주세요.");
    		var message = '프로젝트 내용을 입력해주세요.';
	         return messagePrt(message);
	     }
		
// 		var eventData = {
// 	        	crew_cnt : crew_cnt,
// 	        	grand_code : selectDelRow(),
// 	        	mem_id : trMember(),
// 	        	pro_begin_date : $('#pro_begin_date').val(),
// 	        	pro_end_date : $('#pro_end_date').val(),
// 	        	pro_cont : $('#pro_cont').val(),
// 	        	pro_name : $('#pro_name').val(),
// 	        	bo_no : '${recruitboardInfo.bo_no}'
// 	    };
		
// 		if (eventData.pro_begin_date > event.pro_end_date) {
// 			alert('끝나는 날짜가 앞설 수 없습니다.');
// 			return false;
// 		}
		
		$.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/recruitboard/insertProject.do',
	         dataType : 'json', 
	         data : { 
// 	        	 	eventData
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
	        	 window.close();
	        	 window.opener.parent.location.reload();
	        	 return true;
	         }
	      });
	});

	$('#btn2').click(function() {
			opener.document.location.reload();
			window.close();
		});

	});
	
function submitFail(message){
	alert(message);
	return false;
}
</script>
</html>