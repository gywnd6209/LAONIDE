<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
var flag = true;
var mem_id 		= '${LOGIN_MEMBERINFO.mem_id}';
var mem_nick 	= '${LOGIN_MEMBERINFO.mem_nick}';
var bo_mem_id 	= '${libraryInfo.mem_id}';
var bo_writer 	= '${libraryInfo.bo_writer}';

$(function(){
	
    $('#deleteBtn').click(function() {
		if(mem_id == bo_mem_id){
			$(location).attr('href', '${pageContext.request.contextPath }/user/library/deleteLibraryInfo.do?bo_no=${libraryInfo.bo_no}');
		}else{
			alert('게시글 작성자만 삭제 가능합니다!');
		}
	});
    
    $('#goListBtn').click(function() {
		$(location).attr('href', '${pageContext.request.contextPath }/user/library/libraryList.do?'
				+'currentPage=${currentPage}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}');
	});
    
    $('form[name=updateFrm]').submit(function() {
		if(mem_id == bo_mem_id){
			
	    	var title 		= $('#bo_title').val();
			var content 	= $('#bo_cont').val();
			if(mem_nick != bo_writer){
				$(this).append('<input type="hidden" name="bo_writer" value="'+mem_nick+'"></input>');
			}
						
			if(title==null||title==''){
				return submitFail('제목을 입력해주세요!');
			}
			if(content==''||content==null){
				return submitFail('내용을 입력해주세요!');
			}
			$(this).attr('action', '${pageContext.request.contextPath }/user/library/updateLibraryInfo.do');
			$(this).append('<input type="hidden" name="bo_no" value="${libraryInfo.bo_no}"></input>');
			
			return true;
		}else{
			alert('게시글 작성자만 수정 가능합니다!');
			return false;
		}
    });
    /*
    $('#libraryReplyRegiBtn').click(function() {
    	
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
		// 댓글 등록 ajax
    	 $.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/library/insertLibraryReply.do',
	         dataType : 'json', 
	         data : { 
	        	 bo_cont : 		$('#replyText').val(),
	        	 bo_writer : 	'${LOGIN_MEMBERINFO.mem_nick}',
	        	 mem_id : 		'${LOGIN_MEMBERINFO.mem_id}',
	        	 bo_group : 	'${libraryInfo.bo_no}',
	        	 bo_no : 		'${libraryInfo.bo_no}'
	        	 },
	         error : function(andView){
	            alert(andView.status + ' | ' + andView.responseText);
	            return false;
	         },
	         success : function(andView){
	        	 $('#replyList').load(document.URL + ' #replyList'); 
	        	 return true;
	         }
	      });
	});*/
});
function submitFail(message){
	alert(message);
	return false;
}

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
	// 댓글 등록 ajax
	 $.ajax({
         type : 'POST',
         url : '${pageContext.request.contextPath}/user/library/insertLibraryReply.do',
         dataType : 'json', 
         data : { 
        	 bo_cont : 		$('#replyText').val(),
        	 bo_writer : 	'${LOGIN_MEMBERINFO.mem_nick}',
        	 mem_id : 		'${LOGIN_MEMBERINFO.mem_id}',
        	 bo_group : 	'${libraryInfo.bo_no}',
        	 bo_no : 		'${libraryInfo.bo_no}'
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
function updateReply(bo_no){
	
	/*미리 바이트 수 계산 하는 코드*/
	var bo_cont_obj = $('#'+ bo_no + ' .pCont')[0]; 
	var byteRtn = fnChkByte_View(bo_cont_obj, '300');
	console.log('fnChkByte_View : ' +  byteRtn);
	
// 	var content = $('#'+ bo_no).text();
	var content = $('#'+ bo_no + ' .pCont').val();
	
	var htmls = "";
	htmls += '<div id="' + bo_no + '"  class="row " >';
	htmls += '<input type="hidden" class="pCont" value="'+content+'">';
	htmls += '<div class="row" style="padding-left: 70px; ">';
	htmls += "<textarea name='editContent' id='editContent' style='width: 800px;' onKeyUp=\"javascript:fnChkByte_reply(this,'300')\" >";
	htmls += content;
	htmls += "</textarea><span id='byteInfo_1'>"+byteRtn+" &nbsp;</span>&nbsp;/&nbsp;300bytes";
	htmls += '</div>';

	htmls += '<div  class="row" >';
	htmls += '&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="fn_updateReply(' + bo_no + ')" type="button" class="btn btn-info btn-sm" ><i class="ti-check-box"></i>&nbsp;수정</button>';
	htmls += '&nbsp;<button onclick="fn_resetReply(' + bo_no + ')"  type="button" class="btn btn-inverse btn-sm" ><i class="ti-back-left"></i>&nbsp;취소</button>';
	htmls += '</div>';
	htmls += '</div>';

	$('#' + bo_no).replaceWith(htmls);
	$('#' + bo_no + ' #editContent').focus();
}

// 댓글 수정 평션
function fn_updateReply(bo_no){
	var editContent = $('#' + bo_no + ' #editContent').val();
	if(editContent == ''||editContent==null){
		alert('내용을 입력하세요!');
		return false;
	}
	// 댓글 수정 ajax
	 $.ajax({
        type : 'POST',
        url : '${pageContext.request.contextPath}/user/library/updateLibraryReply.do',
        dataType : 'json', 
        data : { 
       	 bo_cont 	: 	editContent,
       	 bo_writer  : 	'${LOGIN_MEMBERINFO.mem_nick}',
       	 mem_id : 		'${LOGIN_MEMBERINFO.mem_id}',
       	 bo_no 		: 		bo_no
       	 },
        error : function(andView){
           alert(andView.status + ' | ' + andView.responseText);
           return false;
        },
        success : function(andView){
			var htmls = "";
			htmls += '<div style="padding-left: 15px; padding-top: 5px; " id="'+bo_no+'">'+editContent+'</div>';
			$('#' + bo_no).replaceWith(htmls);
			return true;
        }
     });
}
// 댓글 수정 취소 펑션
function fn_resetReply(bo_no){
	var content = $('#' + bo_no + ' .pCont').val();
	var htmls = "";
	htmls += '<div style="padding-left: 15px; padding-top: 5px; " id="'+bo_no+'">'+content+'</div>';
	$('#' + bo_no).replaceWith(htmls);
	
}

function deleteReply(bo_no) {
	// 댓글 삭제 ajax
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/library/deleteLibraryReply.do',
		dataType : 'json', 
		data : { 
			bo_no : 		bo_no
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
//은지 추가
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
	var bo_cont_obj = $('#bo_cont')[0]; 
	var byteRtn = fnChkByte_View(bo_cont_obj, '1000');
// 	console.log('fnChkByte_View : ' +  byteRtn);
	document.getElementById('byteInfo').innerText = byteRtn;
});
</script>
</head>
<body>
<div class="card" >
       <div class="card-header">
           <h5>자료실</h5>
           <span>필요한 자료를 공유하는 공간입니다 :)</span>
       </div>
       <div class="card-block">
           <h4 class="sub-title"><i class="ti-notepad"></i> 게시글보기</h4>
         	 <form name="updateFrm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">글제목</label>
                   <div class="col-sm-10">
                       <input type="text" class="form-control" onKeyUp="javascript:fnChkByte_title(this,'200')" id="bo_title" name="bo_title" value="${libraryInfo.bo_title}"></input>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">글쓴이</label>
                   <div class="col-sm-3">
                   <label class="col-form-label" style="text-align: left;" id="bo_date" name="bo_date">${libraryInfo.bo_writer}</label>
<!--                        <input type="text" disabled="disabled" class="form-control"  id="bo_writer" name="bo_writer" /> -->
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">등록일</label>
                   <div class="col-sm-3">
                   	<label class="col-form-label" style="text-align: left;" id="bo_date" name="bo_date">${fn:substring(libraryInfo.bo_date,0, 10) }</label>
<!--                        <input type="text" disabled="disabled" class="form-control"  id="bo_date" name="bo_date" /> -->
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">글내용</label>
                   <div class="col-sm-10">
                       <textarea id="bo_cont" name="bo_cont" style="height: 200px" rows="5" cols="5" class="form-control" onKeyUp="javascript:fnChkByte(this,'1000')">${libraryInfo.bo_cont}</textarea>
                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
                   </div>
               </div>
               <!-- 첨부파일 시작-->
               <c:if test="${!empty libraryInfo.items }">
	               <div class="form-group">
	               <label class="col-sm-2 col-form-label" style="text-align: center">첨부파일</label>
               	   <c:forEach items="${libraryInfo.items }" var="fileItem"	varStatus="stat">
<!-- 	                <div class="col-sm-10"> -->
	               		<span style="text-align: left; padding-right: 20px;"> 
							<i class="ti-save">&nbsp;${fileItem.file_name}
								<a href="${pageContext.request.contextPath}/user/library/fileDownload.do?file_seq=${fileItem.file_seq }">
									<label style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;내PC저장</label>
								</a>
							</i>
						</span>
<!-- 					</div> -->
<!-- 						<label class="col-sm-2 col-form-label"  style="text-align: center" for="file01">첨부파일1</label> -->
<!-- 						<div class="col-sm-10"> -->
<!-- 							<input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary"> -->
<!-- 						</div>				 -->
					</c:forEach>
					</div>
				</c:if>
				<!-- 첨부파일 끝-->
		</div>
		<div style="text-align: right;">
<!-- 			<button type="button" class="btn waves-effect waves-light btn-info" id="goListBtn"><i class="icofont icofont-info-square"></i>목록</button> -->
			<button id="goListBtn" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq libraryInfo.mem_id}">
				<button type="submit" id="updateBtn" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
				<button type="button" id="deleteBtn" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
			</c:if>		
			&nbsp;
		</div>
 	</form>
 	<br/>
 	<div id="replyList" >
	 	<div  class="card-block" >
 		<h4 class="sub-title"><i class="ti-comments"></i> 댓글<label class="badge badge-info">${fn:length(libraryReplyList)} </label></h4>
	 		<div  class="row" style="text-align: center; margin: auto;">
	 			<c:if test="${empty libraryReplyList}">
	 			
		 			<div class="col-sm-12" style="padding-left: 90px; padding-right:90px; padding-top: 10px; background-color: #F0F0F0;">
		 				<hr/>
		 			</div>
	 			
	 			</c:if>
	 			<c:forEach items="${libraryReplyList}" var="libraryReplyInfo" varStatus="status">
	 			
	 			<!-- 작성자 및 글내용 반복 시작 -->
	 			<table class="replyTB">
	 			<div class="col-sm-12" style="padding-left: 90px; padding-right:90px; padding-top: 2px;  background-color: #F0F0F0;">
	 				<div class="row" >
	 				
	 					<div class="label-main" style=" float: left;">
	 						<c:if test="${LOGIN_MEMBERINFO.mem_id eq libraryReplyInfo.mem_id}">
                            <label class="label " style="background-color: #A27AAF;">  <font size="2pt" >${libraryReplyInfo.bo_writer}</font></label>
                            </c:if>
                            <c:if test="${LOGIN_MEMBERINFO.mem_id ne libraryReplyInfo.mem_id}">
                            <label class="label label-inverse">  <font size="2pt" >${libraryReplyInfo.bo_writer}</font></label>
                            </c:if>
                        
                            <font size="2pt" color="gray">
                            <fmt:parseDate value="${libraryReplyInfo.bo_date}" var="noticePostDate" pattern="yyyy-MM-dd"/>
<%-- 							<fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd"/> --%>
							<fmt:formatDate value="${noticePostDate}" type="date" dateStyle="full"/>
<%--                             <fmt:formatDate value="${libraryReplyInfo.bo_date}"  type="date" dateStyle="full"/> --%>
							</font>
							&nbsp;
							<c:if test="${LOGIN_MEMBERINFO.mem_id eq libraryReplyInfo.mem_id}">
								<a href="javascript:void(0);" onclick='updateReply(${libraryReplyInfo.bo_no})'><i class="ti-marker-alt" style="color: #06908C;" ></i></a>
								<a href="javascript:void(0);" onclick='deleteReply(${libraryReplyInfo.bo_no})'><i class="ti-close" style="color: #F03E68;"></i></a>
							</c:if>
                         </div>
	 				</div>
	 				<div class="row"  id="div${libraryReplyInfo.bo_no}">
	 					<div style="padding-left: 15px; padding-top: 5px; " id="${libraryReplyInfo.bo_no}"><input type="hidden" class="pCont" value="${libraryReplyInfo.bo_cont}">${libraryReplyInfo.bo_cont}</div>
	 				</div>
	 				<hr/>
	 				</tr>
	 			</div>
				<!-- 반복 끝 -->
	 		</table>
	 		
				</c:forEach>
				
			</div>
	 		
	 		 
	 	</div>
				<!-- 글쓰기 부분 -->
<!-- 				<form name="replyRegi" action="" method="post" enctype="multipart/form-data"> -->
				<div class="row col-sm-12" style="padding-left: 90px; padding-right:90px; padding-bottom: 10px;">
					<div class="col-sm-11" >
						<textarea id="replyText" class="form-control" placeholder="댓글을 입력하세요." onKeyUp="javascript:fnChkByte_reply(this,'300')"></textarea>
						<span id="byteInfo_1">0 &nbsp;</span>&nbsp;/&nbsp;300bytes
					</div>
					<div class="row">
					&nbsp;&nbsp;<button id="libraryReplyRegiBtn" onclick="insertReply();" type="button" class="btn btn-inverse btn-sm" ><i class="ti-pencil-alt"></i>&nbsp;댓글쓰기</button>
					</div>
				</div>
<!-- 				</form> -->
	 		
 	</div>
 </div>
</body>