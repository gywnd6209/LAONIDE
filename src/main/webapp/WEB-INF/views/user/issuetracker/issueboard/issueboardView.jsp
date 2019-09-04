<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈 상세보기</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready( function() {
    var now = new Date();
 
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    
   document.getElementById("isu_goal_end_date").min = today;
});

var flag = true;
var mem_id 		= '${LOGIN_MEMBERINFO.mem_id}';
var mem_nick 	= '${LOGIN_MEMBERINFO.mem_nick}';
var isu_mem_id 	= '${issueboardInfo.mem_id}';
var isu_writer 	= '${issueboardInfo.isu_writer}';

$(function(){
	
    $('#deleteBtn').click(function() {
		if(mem_id == isu_mem_id){
			$(location).attr('href', '${pageContext.request.contextPath }/user/issuetracker/issueboard/deleteIssueboard.do?isu_no=${issueboardInfo.isu_no}&pro_code=${pro_code}&pro_name=${param.pro_name }');
		}else{
			alert('게시글 작성자만 삭제 가능합니다!');
		}
	});
    
    $('#goListBtn').click(function() {
		$(location).attr('href', '${pageContext.request.contextPath }/user/issuetracker/issueboard/issueboardList.do?'
				+'currentPage=${currentPage}&pro_code=${pro_code}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}&pro_name=${param.pro_name }');
	});
    
    $('form[name=updateFrm]').submit(function() {
		if(mem_id == isu_mem_id){
			
	    	var title 		= $('#isu_title').val();
			var content 	= $('#isu_cont').val();
			var date 		= $('#isu_goal_end_date').val();
			var radio 		= $('input[name=isu_priority]:checked').val();
			
			if(mem_nick != isu_writer){
				$(this).append('<input type="hidden" name="isu_writer" value="'+mem_nick+'"></input>');
			}
						
			if(title==null||title==''){
				return submitFail('이슈 제목을 입력해주세요!');
			}
			if(content==''||content==null){
				return submitFail('이슈 내용을 입력해주세요!');
			}
			if(date==''||date==null){
				return submitFail('이슈 완료예정일을 선택해주세요!');
			}
			var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
			if(special_pattern.test($('input[name=isu_title]').val()) == true) { 
				return submitFail('제목에는 특수문자를 사용할 수 없습니다.');
			}
			
			$(this).attr('action', '${pageContext.request.contextPath }/user/issuetracker/issueboard/updateIssueboard.do?pro_code=${pro_code}&pro_name=${param.pro_name }');
			$(this).append('<input type="hidden" name="isu_no" value="${issueboardInfo.isu_no}"></input>');
			
			return true;
		}else{
			alert('게시글 작성자만 수정 가능합니다!');
			return false;
		}
    });
    /*
    $('#issueReplyRegiBtn').click(function() {
    	
    	// 유효성 검사
    	var replyText = $('#replyText').val();
    	
    	if(replyText == ''||replyText==null){
    		alert('내용을 입력하세요!');
    		return false;
    	}
    	if(eval('${empty LOGIN_MEMBERINFO}')){
    		alert('로그인한 회원만 댓글을 등록할 수 있습니다.');
    		return false;
    	}
    	
    	var ch_isu_end = $('input[name=isu_end]').is(":checked");
    	var isu_y = "";
    	if(ch_isu_end == true){
    		isu_y = "Y";
     	 }else{
     		isu_y = "N";
     	 }
    	
		// 댓글 등록 ajax
    	 $.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/issuetracker/issueboard/insertIssueboardReply.do',
	         dataType : 'json', 
	         data : { 
	        	 isu_no : '${issueboardInfo.isu_no}',
	        	 isu_end_cont : $('#replyText').val(),
	        	 isu_end_writer : '${LOGIN_MEMBERINFO.mem_id}',
	        	 isu_end_ok : isu_y
	        },
	         error : function(andView){
	            alert(andView.status + ' | ' + andView.responseText);
	            return false;
	         },
	         success : function(andView){
	        	 alert(andView.result);
	        	 $('#replyList').load(document.URL + ' #replyList'); 
	        	 return true;
	         }
	      });
	}); */
});
function submitFail(message){
	alert(message);
	return false;
}

var content;

// 댓글 등록 펑션
function insertReply(){
	// 유효성 검사
	var replyText = $('#replyText').val();
	
	if(replyText == ''||replyText==null){
		alert('내용을 입력하세요!');
		return false;
	}
	if(eval('${empty LOGIN_MEMBERINFO}')){
		alert('로그인한 회원만 댓글을 등록할 수 있습니다.');
		return false;
	}
	
	var ch_isu_end = $('input[name=isu_end]').is(":checked");
	var isu_y = "";
	if(ch_isu_end == true){
		isu_y = "Y";
 	 }else{
 		isu_y = "N";
 	 }
	
	// 댓글 등록 ajax
	 $.ajax({
         type : 'POST',
         url : '${pageContext.request.contextPath}/user/issuetracker/issueboard/insertIssueboardReply.do',
         dataType : 'json', 
         data : { 
        	 isu_no : '${issueboardInfo.isu_no}',
        	 isu_end_cont : $('#replyText').val(),
        	 isu_end_writer : '${LOGIN_MEMBERINFO.mem_id}',
        	 isu_end_ok : isu_y
        },
         error : function(andView){
           
            return false;
         },
         success : function(andView){
        	
        	 $('#replyList').load(document.URL + ' #replyList'); 
        	 return true;
         }
      });
}
// 댓글 수정 펑션
function updateReply(isu_end_no){
	
	/*미리 바이트 수 계산 하는 코드*/
	var bo_cont_obj = $('#'+ isu_end_no + ' .pCont')[0]; 
	var byteRtn = fnChkByte_View(bo_cont_obj, '300');
	console.log('fnChkByte_View : ' +  byteRtn);
// 	document.getElementById('byteInfo').innerText = byteRtn;
	
	
// 	var content = $('#'+ sol_no).text();
	var content = $('#'+ isu_end_no + ' .pCont').val();
	
	
	var htmls = "";
	htmls += '<div id="' + isu_end_no + '"  class="row " >';
	htmls += '<input type="hidden" class="pCont" value="'+content+'">';
	htmls += '<div class="row" style="padding-left: 70px; ">';
	htmls += "<textarea name='editContent' id='editContent' style='width: 800px;' onKeyUp=\"javascript:fnChkByte_reply(this,'300')\" >";
	htmls += content;
	htmls += '</textarea><span id="byteInfo_1">'+byteRtn+' &nbsp;</span>&nbsp;/&nbsp;300bytes';
	htmls += '</div>';

	htmls += '<div  class="row" >';
	htmls += '&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="fn_updateReply(' + isu_end_no + ')" type="button" class="btn btn-info btn-sm" ><i class="ti-check-box"></i>&nbsp;수정</button>';
	htmls += '&nbsp;<button onclick="fn_resetReply(' + isu_end_no + ')"  type="button" class="btn btn-inverse btn-sm" ><i class="ti-back-left"></i>&nbsp;취소</button>';
	htmls += '</div>';
	htmls += '</div>';

	$('#' + isu_end_no).replaceWith(htmls);
	$('#' + isu_end_no + ' #editContent').focus();
}

// 댓글 수정 평션
function fn_updateReply(isu_end_no){
	var editContent = $('#' + isu_end_no + ' #editContent').val();
	if(editContent == ''||editContent==null){
		alert('내용을 입력하세요!');
		return false;
	}
	// 댓글 수정 ajax
	 $.ajax({
        type : 'POST',
        url : '${pageContext.request.contextPath}/user/issuetracker/issueboard/updateIssueboardReply.do',
        dataType : 'json', 
        data : { 
       	 isu_end_cont : 		editContent,
       	 isu_end_writer : 	'${LOGIN_MEMBERINFO.mem_id}',
       	 isu_end_no : isu_end_no
       	 },
        error : function(andView){
           alert(andView.status + ' | ' + andView.responseText);
           return false;
        },
        success : function(andView){
			var htmls = "";
			htmls += '<div style="padding-left: 15px; padding-top: 5px; " id="'+isu_end_no+'"><input type="hidden" class="pCont" value="'+editContent+'">'+editContent+'</div>';
			$('#' + isu_end_no).replaceWith(htmls);
			return true;
        }
     });
}
// 댓글 수정 취소 펑션
function fn_resetReply(isu_end_no){
	var content = $('#' + isu_end_no + ' .pCont').val();
	var htmls = "";
	htmls += '<div style="padding-left: 15px; padding-top: 5px;width:100%; text-align:left; " id="'+isu_end_no+'"><input type="hidden" class="pCont" value="'+content+'">'+content+'</div>';
	$('#' + isu_end_no).replaceWith(htmls);
	
}

function deleteReply(isu_end_no) {
	// 댓글 삭제 ajax
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/issuetracker/issueboard/deleteIssueboardReply.do',
		dataType : 'json', 
		data : { 
			isu_end_no : isu_end_no
		},
		error : function(andView){
			alert(andView.status + ' | ' + andView.responseText);
			return false;
		},
		success : function(andView){
			alert('댓글이 삭제되었습니다.');
   	 		$('#replyList').load(document.URL + ' #replyList'); 
     	 	return true;
		}
	});
}

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
function fnChkByte_reply(obj, maxByte){
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
	  fnChkByte_reply(obj, maxByte);
	  
	 }else{
	   document.getElementById('byteInfo_1').innerText = rbyte;
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
</head>
<body>
<div class="card" >
       <div class="card-header">
           <h5>우리팀 이슈게시판</h5>
       </div>
       <div class="card-block">
           <h4 class="sub-title"><i class="ti-notepad"></i>이슈 게시글보기</h4>
         	 <form name="updateFrm" class="form-horizontal" role="form" action="" method="post">
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 제목</label>
                   <div class="col-sm-10">
                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control"  id="isu_title" name="isu_title" value="${issueboardInfo.isu_title}"></input>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 작성자</label>
                   <div class="col-sm-3">
                   	  <label class="col-form-label" style="text-align: left;" id="isu_writer" name="isu_writer">${issueboardInfo.isu_writer}</label>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 등록일</label>
                   <div class="col-sm-3">
                   	  <label class="col-form-label" style="text-align: left;" id="isu_reg_date" name="isu_reg_date">${fn:substring(issueboardInfo.isu_reg_date,0, 10) }</label>
                   </div>
               </div>
               
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 내용</label>
                   <div class="col-sm-10">
                   <script type="text/javascript">
					//은혜 미리 계산 펑션
					function fnChkByte_View(obj, maxByte){
					    var str = obj.value;
					    console.log('str:' + str);
					    var str_len = str.length;
					
					    var rbyte = 0;
					    var rlen = 0;
					    var one_char = "";
					    var str2 = "";
					
					    for(var i=0; i<str_len; i++){
					        one_char = str.charAt(i);
					        if(escape(one_char).length > 4){
					            rbyte += 3;                       
					        }else{
					            rbyte++;                                           
					        }if(rbyte <= maxByte){
					            rlen = i+1;                                          
					        }
					     }
					    return rbyte;
					}	
					$(function(){
						var bo_cont_obj = $('#isu_cont')[0]; 
						var byteRtn = fnChkByte_View(bo_cont_obj, '1000');
					// 	console.log('fnChkByte_View : ' +  byteRtn);
						document.getElementById('byteInfo').innerText = byteRtn;
					});
					</script>
                       <textarea id="isu_cont" name="isu_cont" style="height: 200px" rows="5" cols="5" class="form-control" 
                       onKeyUp="javascript:fnChkByte(this,'1000')">${issueboardInfo.isu_cont}</textarea>
                   	   <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 담당자</label>
                   <div class="col-sm-10">
                      <select name='isu_manager' style="height: 30px; width: 100px">
	                      <c:if test="${issueboardInfo.isu_manager == null}">
							  	<option value='선택' selected>----- 선택 -----</option>
							  <c:forEach items="${crewList }" var="crewInfo">
							  		<option value='${crewInfo.mem_nick }'>${crewInfo.mem_nick }&nbsp;&nbsp;|&nbsp;&nbsp;${crewInfo.grand_code }</option>
							  </c:forEach>
						  </c:if>
	                      <c:if test="${issueboardInfo.isu_manager != null}">
							  	<option value='${issueboardInfo.isu_manager}' selected>${issueboardInfo.isu_manager}</option>
							  <c:forEach items="${crewList }" var="crewInfo">
							  		<option value='${crewInfo.mem_nick }'>${crewInfo.mem_nick }&nbsp;&nbsp;|&nbsp;&nbsp;${crewInfo.grand_code }</option>
							  </c:forEach>
						  </c:if>
					  </select>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">이슈 우선순위</label>
                   <div class="col-sm-10">
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_lowness.png">
                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_usually.png">
                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_Emergency.png"><br>
                   	<c:if test="${issueboardInfo.isu_rank eq '낮음'}">
                    	<input type='radio' name='isu_priority' value='낮음' checked/>낮음
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='isu_priority' value='보통' />보통
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='isu_priority' value='긴급' />긴급
                    </c:if>
                    <c:if test="${issueboardInfo.isu_rank eq '보통'}">
                    	<input type='radio' name='isu_priority' value='낮음' />낮음
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='isu_priority' value='보통' checked/>보통
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='isu_priority' value='긴급' />긴급
                    </c:if>
                    <c:if test="${issueboardInfo.isu_rank eq '긴급'}">
	                    <input type='radio' name='isu_priority' value='낮음' />낮음
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input type='radio' name='isu_priority' value='보통' />보통
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='isu_priority' value='긴급' checked/>긴급
                    </c:if>
                   </div>
               </div>
               
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">완료 예정일</label>
                   <div class='col-sm-3 input-group date dateTimePicker' id="datepicker" style="width: 170px">
	                  <input type='date' style="width:auto;" class="form-control" data-date-format="YYYY-MM-DD" 
	                  		name="isu_goal_end_date" id="isu_goal_end_date" value="${fn:substring(issueboardInfo.isu_goal_end_date,0, 10) }" required="required"/>
	               </div>
               </div>
		</div>
		<div style="text-align: right;">
			<button id="goListBtn" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq issueboardInfo.mem_id}">
				<button type="submit" id="updateBtn" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
				<button type="button" id="deleteBtn" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
			</c:if>		
			&nbsp;
		</div>
 	</form>
 
 	
 	
 	
 	
 	<br/>
 	<div id="replyList" >
	 	<div  class="card-block" >
	 	
 		<h4 class="sub-title"><i class="ti-comments"></i> 댓글<label class="badge badge-info">${fn:length(issueboardReplyList)} </label></h4>
	 		<div  class="row" style="text-align: center; margin: auto;">
	 			<c:if test="${empty issueboardReplyList}">
	 			
		 			<div class="col-sm-12" style="padding-left: 90px; padding-right:90px; padding-top: 10px; background-color: #F0F0F0;">
		 				<hr/>
		 			</div>
	 			
	 			</c:if>
	 			<c:forEach items="${issueboardReplyList}" var="issueReplyInfo" varStatus="status">
	 			
	 			
<!-- 	 			작성자 및 글내용 반복 시작 -->
	 			<table class="replyTB">
	 			<div class="col-sm-12" style="padding-left: 90px; padding-right:90px; padding-top: 2px;  background-color: #F0F0F0;">
	 				<div class="row" >
	 				
	 					<div class="label-main" style=" float: left;">
	 						<c:if test="${LOGIN_MEMBERINFO.mem_id eq issueReplyInfo.isu_end_writer}">
                            	<label class="label " style="background-color: #A27AAF;">  <font size="2pt" >${issueReplyInfo.mem_nick}</font></label>
                            </c:if>
                            <c:if test="${LOGIN_MEMBERINFO.mem_id ne issueReplyInfo.isu_end_writer}">
                            	<label class="label label-inverse">  <font size="2pt" >${issueReplyInfo.mem_nick}</font></label>
                            </c:if>
                        
                            <font size="2pt" color="gray">
                            <fmt:parseDate value="${issueReplyInfo.isu_end_reg_date}" var="noticePostDate" pattern="yyyy-MM-dd"/>
<%-- 							<fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd"/> --%>
							<fmt:formatDate value="${noticePostDate}" type="date" dateStyle="full"/>
<%--                             <fmt:formatDate value="${proReplyInfo.bo_date}"  type="date" dateStyle="full"/> --%>
							</font>
							&nbsp;
							&nbsp;
							<c:if test="${issueReplyInfo.isu_end_ok == 'Y'}">
								<label class="label label-inverse-danger"><font size="2pt">이슈 해결!!</font></label>
							</c:if>
							&nbsp;
							<c:if test="${LOGIN_MEMBERINFO.mem_id eq issueReplyInfo.isu_end_writer}">
							<a href="javascript:void(0);" onclick='updateReply(${issueReplyInfo.isu_end_no})'><i class="ti-marker-alt" style="color: #06908C;" ></i></a>
							<a href="javascript:void(0);" onclick='deleteReply(${issueReplyInfo.isu_end_no})'><i class="ti-close" style="color: #F03E68;"></i></a>
                        	
							</c:if>
                         </div>
	 				</div>
	 				<div class="row"  id="div${issueReplyInfo.isu_end_no}">
	 					<div style="padding-left: 15px; padding-top: 5px; " id="${issueReplyInfo.isu_end_no}"><input type="hidden" class="pCont" value="${issueReplyInfo.isu_end_cont}">${issueReplyInfo.isu_end_cont}</div>
	 				</div>
	 				<hr/>
	 				</tr>
	 			</div>
<!-- 				반복 끝 -->
	 		</table>
	 		
				</c:forEach>
				
			</div>
	 		
	 		 
	 	</div>
<!-- 				글쓰기 부분 -->
<!-- 				<form name="replyRegi" action="" method="post" enctype="multipart/form-data"> -->
				<c:if test="${issueboardInfo.isu_end_ok == 'N'}">
					<div class="row col-sm-12" style="padding-left: 90px; padding-right:90px; padding-bottom: 10px;">
						<label class="label label-success"><font size="2pt">이슈를 해결했어요!</font></label>
							<input type='checkbox' name='isu_end' value='해결'/>
						<br>
					</div>
				</c:if>
				<div class="row col-sm-12" style="padding-left: 90px; padding-right:90px; padding-bottom: 10px;">
					<div class="col-sm-11" >
						<textarea id="replyText" class="form-control" onKeyUp="javascript:fnChkByte_reply(this,'300')"></textarea>
						<span id="byteInfo_1">0 &nbsp;</span>&nbsp;/&nbsp;300bytes
					</div>
					<div class="row">
					&nbsp;&nbsp;<button id="issueReplyRegiBtn"  onclick="insertReply();" type="button" class="btn btn-inverse btn-sm" ><i class="ti-pencil-alt"></i>&nbsp;댓글쓰기</button>
					</div>
				</div>
<!-- 				</form> -->
	 		
 	</div>
 </div>
</body>