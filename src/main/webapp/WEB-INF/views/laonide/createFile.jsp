<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
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
<body>
<div class="pcoded-inner-content" style="padding: 0px;">
    <!-- Main-body start -->
	<div class="main-body" >
	    <div class="page-wrapper" style="background-color: #837E7C;">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card">
		       <div class="card-block">
		               <div class="form-group row" style="margin : auto;">
		                   <label class="col-sm-3 col-form-label" style="text-align: center" for="folder_name">폴더명</label>
		                   <div class="col-sm-8">
		                   		<label class="form-control" id="folder_name" name="folder_name" >${folder_name}</label>
		                   </div>
		               </div>
		               
		               <div class="form-group row" style="margin : auto;">
		                   <label class="col-sm-3 col-form-label" style="text-align: center" for="file_name">파일이름</label>
		                   <div class="col-sm-8">
		                   		<input type="text" class="form-control" id="file_name" name="file_name">
		                   </div>
		               </div>
		               
		               <div class="form-group row" style="margin : auto;">
		                   <label class="col-sm-3 col-form-label" style="text-align: center" for="file_type">확장자</label>
		                   <div class="col-sm-8">
		                   		<input type="text" class="form-control" id="file_type" name="file_type" 
		                   							placeholder="ex) java, xml, css, html, txt...">
		                   </div>
		               </div>
		              <br>
		           <div style="margin-left: 35%;">
					<button type="button" id="btn1" class="btn waves-effect waves-light btn-success" style="float: center;"><i class="icofont icofont-check-circled"></i>확인</button>
					<button type="button" id="btn2" class="btn waves-effect waves-light btn-info" style="float: center;"><i class="icofont icofont-info-square"></i>취소</button>
				   </div>
				</div>
				</div>
			</div>
		 </div>
 	</div>
 </div>
</body>
<script type="text/javascript">
$(function(){
	
	$('#btn1').click(function(){
		
		if($('#file_name').val()==""||$('#file_name').val()==null){
			alert("파일명을 입력해주세요.");
			$("#file_name").focus();
			return;
	    }
		if($('#file_type').val()==""||$('#file_type').val()==null){
			alert("파일 타입을 입력해주세요.");
			$("#file_type").focus();
			return;
	    }
		
		var getName = /^[A-Z]+/;
		var getNameRow = /^[a-z]+/;
		var getPattern = /^(txt|html|java|xml|css)/;
		
		if($('#file_type').val()=="java"){
			if(!getName.test($("#file_name").val())) {
			      alert("파일의 첫글자는 대문자로 작성해주세요.");
			      $("#file_name").val("");
			      $("#file_name").focus();
			      return;
			}
		}else if(!($('#file_type').val()=="java")){
			if(!getNameRow.test($("#file_name").val())) {
			      alert("해당 파일의 파일명은 소문자로 작성해주세요.");
			      $("#file_name").val("");
			      $("#file_name").focus();
			      return;
			}
		}
		
		if(!getPattern.test($("#file_type").val())){
			alert("잘못된 파일타입입니다.");
		      $("#file_type").val("");
		      $("#file_type").focus();
		      return;
		}
		
		
		$.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/laonide/insertFile.do',
	         dataType : 'json', 
	         data : { 
	        	 ide_no : '${ide_no}',
	        	 folder_name : '${folder_name}',
	        	 file_name : $('#file_name').val(),
	        	 file_type : $('#file_type').val(),
	        	 author : '${author}'
	        	 },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
	        	 alert(andView.result);
	        	 window.close();
	        	 return true;
	         }
	      });
		
	});
    
   $('#btn2').click(function(){
	   window.close();
    });
   
      
});
</script>
</html>