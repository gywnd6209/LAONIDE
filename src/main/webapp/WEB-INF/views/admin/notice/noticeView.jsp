<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	$(function() {
		$('#bo_title').val('${noticeInfo.bo_title}');
		$('#bo_writer').val('${noticeInfo.bo_writer}');
	});
</script>
</head>
<body>
	<div class="pcoded-inner-content" style="overflow: scroll;">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					<div class="card" style="height: 600px; margin: auto;">
						<div class="card-header">
							<h5>공지사항</h5>
						</div>
						<div class="card-block">
							<h4 class="sub-title">상세내용</h4>
							<form name="updateFrm" id="updateFrm" class="form-horizontal" role="form" action="" method="post">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label" for="bo_title"
										style="text-align: center">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bo_title"
											name="bo_title" onKeyUp="javascript:fnChkByte1(this,'200')">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label" for="bo_content" style="text-align: center">내용</label>
									<div class="col-sm-10">
										<c:if test="${!empty LOGIN_ADMININFO}">
											<textarea name="bo_content" style="height: 200px" rows="5" cols="5"
											class="form-control" onKeyUp="javascript:fnChkByte(this,'1000')">${noticeInfo.bo_content}</textarea>
										</c:if>
										<c:if test="${empty LOGIN_ADMININFO}">
											<textarea name="bo_content" style="height: 200px" rows="5" cols="5" readonly="true" 
											class="form-control">${noticeInfo.bo_content}</textarea>
										</c:if>
										<span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes 
									</div>
								</div>
						</div>
						<!-- 댓글 -->
						<div class="card-block table-border-style">
							<div class="table-responsive" id="refreshDiv">${pageHtmls }
							</div>
						</div>
					</div>
					
					
					<div style="text-align: right;">
					<button id="list" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
					<c:if test="${!empty LOGIN_ADMININFO}">
						<button type="submit" id="update" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
						<button type="button" id="delete" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
					</c:if>
					</div>
<!-- 					<button type="button" id="list" class="btn btn-mat waves-effect waves-light btn-primary" style="float: right"> -->
<!-- 						<i class="icofont icofont-info-square"></i>목록 -->
<!-- 					</button>&nbsp;&nbsp; -->
<%-- 					<c:if test="${!empty LOGIN_ADMININFO}"> --%>
<!-- 						<button type="button" id="delete" class="btn btn-mat waves-effect waves-light btn-danger" style="float: right"> -->
<!-- 							<i class="icofont icofont-eye-alt"></i>삭제 -->
<!-- 						</button>&nbsp;&nbsp; -->
<!-- 						<button type="submit" id="update" class="btn btn-mat waves-effect waves-light btn-success" style="float: right"> -->
<!-- 							<i class="icofont icofont-exchange"></i>수정 -->
<!-- 						</button> &nbsp;&nbsp; -->
<%-- 					</c:if> --%>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

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
//      $(obj).val("");
     
    }else{
      document.getElementById('byteInfo').innerText = rbyte;
    }
}



function fnChkByte1(obj, maxByte){
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
     fnChkByte1(obj, maxByte);
//      $(obj).val("");
     
    }else{
      document.getElementById('byteInfo').innerText = rbyte;
    }
}




	var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
	
	$(function() {
		$('form[name=updateFrm]').submit(function() {
			
			//타이틀 특수 문자가 있나 없나 체크 
			var special_pattern = /[`@#$%&*|;:<>{}\/?]/gi; 
			if(special_pattern.test($('#bo_title').val()) == true) { 
			   alert("제목에는 특수문자를 사용할 수 없습니다.");
			   return; 
			} 
			
			
			
			if ($('input[name=bo_title]').val() == "" || $('input[name=bo_title]').val() == null) {
				alert("제목을 입력해주세요.");
				var message = '제목을 입력해주세요';
				return messagePrt(message);
			}
			if ($('textarea[name=bo_content]').val() == "" || $('textarea[name=bo_content]').val() == null) {
				alert("내용을 입력해주세요.");
				var message = '내용을 입력해주세요';
				return messagePrt(message);
			}
			
// 			if (bo_writer == mem_id) { 
				$(this).attr('action','${pageContext.request.contextPath }/admin/notice/updateNotice.do');
				$(this).append('<input type="hidden" name="bo_no" value="${noticeInfo.bo_no}"></input>');
// 			return true; //default
// 				 } else {
// 						alert("작성자만 수정 가능하다능.");
// 					BootstrapDialog.show({
// 						title : '경고',
// 						message : '작성자만 수정 가능하다능.'
// 					});
// 					return false;
			});
// 		});
	
		$('#list').click(
			function() { // 목록
				$(location).attr('href', '${pageContext.request.contextPath }/admin/notice/noticeList.do?'+
									'&currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}');
			});
		
		$('#delete').click(function() { // 삭제
// 				 if (mem_id == ${noticeInfo.bo_writer}) { 
					$(location).attr('href', '${pageContext.request.contextPath }/admin/notice/deleteNotice.do?bo_no=${noticeInfo.bo_no}');
// 				 } else {
// 					 alert("게시글 작성자만 삭제할 수 있어요.");
// 					BootstrapDialog.show({
// 						title : '경고',
// 						message : '게시글 작성자만 삭제할 수 있어요.'
// 				 });
// 			 }
		});
	});
	
	function messagePrt(message) {
		BootstrapDialog.show({
			title : '경고',
			message : message
		});
		return false;
	}
	
</script>
</html>