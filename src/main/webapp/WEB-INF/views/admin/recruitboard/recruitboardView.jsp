<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#menu {
    width: 460px;
    margin: 40px auto;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
span1 {
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none;
  position: absolute;
  width: 200px;
  padding: 8px;
  left: 220px;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span1:hover + p.arrow_box {
  display: block;
}
</style>
<meta charset="UTF-8">
<title>팀원모집 게시글</title>
<script type="text/javascript">
	$(function() {
		$('#bo_title').val('${recruitboardInfo.bo_title}');
		$('#bo_person').val('${recruitboardInfo.bo_person}');
		$('#bo_begin_date').val('${fn:substring(recruitboardInfo.bo_begin_date, 0, 10)}');
		$('#bo_end_date').val('${fn:substring(recruitboardInfo.bo_end_date, 0, 10)}');
	});
</script>
</head>
<body>
<div class="pcoded-inner-content" id="refresh_test">
    <!-- Main-body start -->
	<div class="main-body" id="refresh_test">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card" style="margin: auto; ">
		       <div class="card-header">
		           <h5>팀원모집 게시판</h5>
		       </div>
		       <div class="card-block">
		           <h4 class="sub-title">상세내용</h4>
		         	 <form name="updateFrm" id="updateFrm" class="form-horizontal" role="form" action="" method="post">
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" for="bo_title" style="text-align: center">개발 제목</label>
		                   <div class="col-sm-10">
		                       <input type="text" class="form-control" id="bo_title" name="bo_title">
		                   </div>
		               </div>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" for="bo_content" style="text-align: center">개발 내용</label>
		                   <div class="col-sm-10">
		                       <textarea id="bo_content" name="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       onKeyUp="javascript:fnChkByte(this,'1000')">${recruitboardInfo.bo_content}</textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes  
		                   </div>
		               </div>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" for="bo_person" style="text-align: center">모집 인원</label>
		                   <div class="col-sm-10">
		                       <input type="text" class="form-control" id="bo_person" name="bo_person">
		                   </div>
		               </div>
		               
						<div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">개발 시작일 ~ <br/>개발 완료일</label>
		                   	 <div class='col-sm-2 input-group date dateTimePicker' id="datepicker1" style="width: 170px">
		                         <input type='date' style="text-align: center" class="form-control" name="bo_begin_date" id="bo_begin_date" required="required"/>
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
		                     </div>&nbsp;&nbsp;&nbsp;&nbsp;
		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp;
		                     <div class='col-sm-2 input-group date dateTimePicker' id="datepicker2" style="width: 170px">
		                         <input type='date' style="text-align: center" class="form-control" name="bo_end_date" id="bo_end_date" required="required"/>
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
		                  	</div>
		               </div>
		               <!-- 댓글 -->
						<div class="card-block table-border-style">
		                 <div class="table-responsive" id="refreshDiv">
<%-- 		                 <c:if test="${LOGIN_MEMBERINFO.mem_id eq recruitboardInfo.mem_id }"> --%>
<!-- 			                 <button type="button" class="btn waves-effect waves-light btn-success btn-outline-success" id="btn_team"><i class="ti-plus"></i>팀구성하기</button> -->
<!-- 			                 <label>원하는 팀원을 체크하여 프로젝트 팀을 구성해보세요!</label> -->
<%-- 		                 </c:if> --%>
		                     <table class="table table-hover">
		                         <thead>
		                             <tr>
										 <th></th>
										 <th style="text-align: center;">WRITER</th>
		                                 <th style="text-align: center;">COMMENT</th>
		                                 <th style="text-align: center;">DATE</th>
		                             </tr>
		                         </thead>
						         <tbody id = "boardListTbody">
						         <c:if test="${empty recruitboardReplyList }">
						            <tr>
						               <td colspan ="5" align="center"><font color="red">등록된 댓글이 없습니다.</font></td>
						            </tr>
						         </c:if>
						         <c:if test="${!empty recruitboardReplyList  }">   
						            <c:forEach items="${recruitboardReplyList }" var="recruitReplyInfo">
						            	<c:if test="${recruitReplyInfo.bo_status =='n' }">
						            	<tr>
						            	  <td align="center">
<%-- 						            	    <input type="checkbox" name="ch_reply" value="${recruitReplyInfo.mem_id}"> --%>
						            	  </td>
						                  <td align="center">
						                  <span1>${recruitReplyInfo.bo_writer}&nbsp;&nbsp;&nbsp;&nbsp;<b>:</b>&nbsp;&nbsp;</span1>
<!-- 						                  <p class="arrow_box"> -->
<%-- 						                  	아이디 : ${recruitReplyInfo.mem_id}</br>  --%>
<%-- 						                  	닉네임 : ${recruitReplyInfo.bo_writer}</br>  --%>
<%-- 						                  	가능 언어 : ${recruitReplyInfo.lang_code } </br> --%>
<%-- 						                  	언어 레벨 : ${recruitReplyInfo.lang_level } </br> --%>
<!-- 						                  </p> -->
						                    <input type="hidden" id="hidden_mem_id" value="${recruitReplyInfo.mem_id }">
						                  	<input type="hidden" id="bo_no" value="${recruitReplyInfo.bo_no }">
						                  	<input type="hidden" id="bo_seq" value="${recruitReplyInfo.bo_seq }">
						                  	<input type="hidden" id="bo_group" value="${recruitReplyInfo.bo_group }">
						                  	<input type="hidden" id="bo_depth" value="${recruitReplyInfo.bo_depth }">
						                  </td>
						                  <td align="center">${recruitReplyInfo.bo_content}</td>
						                  <td align="center">${recruitReplyInfo.bo_reg_date}</td>
						               </tr>
						            	</c:if>
						             </c:forEach>
						         </c:if>
						         </tbody>
					      	</table>
					      ${pageHtmls }
		                 </div>
		             </div>
		             <c:if test="${!empty LOGIN_ADMININFO }">
		             <div class="form-group row" style="margin-left: 10%;">
		                  <label class="col-sm-2 col-form-label" style="text-align: center">댓글 작성</label>
		                  <div class="col-sm-10" id="refresh_">
		                      <textarea id="bo_content_reply" style="height: 60px; width: 600px;" rows="5" cols="5" class="form-control"
		                      			placeholder="댓글을 입력하세요." onKeyUp="javascript:fnChkByte_reply(this,'300')"></textarea>
		                      <span id="byteInfo_1">0 &nbsp;</span>&nbsp;/&nbsp;300bytes
		                  </div>
		             </div>
	                  <div id="reply_button_div" style="text-align: center;">
	                  	<button type="button" class="btn waves-effect waves-light btn-success btn-outline-success" id="rebtn3"><i class="ti-plus"></i>등록</button>
	                  	<button type="button" class="btn waves-effect waves-light btn-inverse btn-outline-inverse" id="rebtn1"><i class="ti-reload"></i>수정</button>
	                  	<button type="button" class="btn waves-effect waves-light btn-danger btn-outline-danger" id="rebtn2"><i class="ti-minus"></i>삭제</button>	
	                  </div>
		             </c:if>
				</div>
				<div style="text-align: right;">
					<button id="btn1" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
<%-- 					<c:if test="${LOGIN_ADMININFO.mem_id eq recruitboardInfo.mem_id }"> --%>
<!-- 						<button type="submit" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button> -->
						<button type="button" id="btn2" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
<%-- 					</c:if>		 --%>
					&nbsp;
				</div>
		 	</form>
				</div>
			</div>
		 </div>
 	</div>
 </div>
</body>
<script type="text/javascript">

var mem_id = '${LOGIN_ADMININFO.mem_id}';
var bo_mem_id = '${recruitboardInfo.mem_id}';
var flag = true;
var bo_no;
var bo_content;
var pro_bo_no = '${proInfoInfo.bo_no}';

$(document).ready( function() {
    var now = new Date();
 
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    
   document.getElementById("bo_begin_date").min = today;
   document.getElementById("bo_end_date").min = today;
   
   // 댓글 수정, 삭제 버튼 숨기기
   document.getElementById("rebtn1").style.display = "none";
   document.getElementById("rebtn2").style.display = "none";
   
});

	var mem_id = '${LOGIN_ADMININFO.mem_id}';
	var bo_mem_id = '${recruitboardInfo.mem_id}';
	var flag = true;
	var bo_no;
	var bo_content;
	var pro_bo_no = '${proInfoInfo.bo_no}';
	
	if('${proInfoInfo.bo_no}' == null){
		pro_bo_no = "0"
	}

	$(function() {
	
		$('#btn1').click(function() { // 목록
				$(location).attr('href', '${pageContext.request.contextPath }/admin/recruitboard/recruitboardList.do?'+
									'&currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}');
			});
		
		$('#btn2').click(function() { // 삭제
			$(location).attr('href', '${pageContext.request.contextPath }/admin/recruitboard/deleteRecruitboard.do?bo_no=${recruitboardInfo.bo_no}');
		});
		
		$('#rebtn3').click(function() { //댓글
			flag = false;
		
			if($('#bo_content_reply').val() == null ||
					$('#bo_content_reply').val() == ''){
				
				alert("댓글을 입력해주세요.");
				return true;
			}
		
	      $.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/admin/recruitboard/insertRecruitboardReply.do',
	         dataType : 'json', 
	         data : { 
	        	 bo_no : ${recruitboardInfo.bo_no},
	        	 bo_content : $('#bo_content_reply').val(),
	        	 bo_writer : '${LOGIN_ADMININFO.mem_nick}',
	        	 mem_id : '${LOGIN_ADMININFO.mem_id}',
	        	 lang_code : '${LOGIN_ADMININFO.lang_code}',
	        	 lang_level : '${LOGIN_ADMININFO.lang_level}',
	        	 bo_seq : ${recruitboardInfo.bo_seq},
	        	 bo_depth : ${recruitboardInfo.bo_depth},
	        	 bo_group : ${recruitboardInfo.bo_group}
	        	 },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
// 	        	 $('#refreshDiv').load(document.URL +  ' #refreshDiv'); 
// 	        	 $('#refresh_').load(document.URL +  ' #refresh_'); 
	        	 document.location.reload();
	        	 return true;
	         }
	      });
			
		});
		
			
		$('#boardListTbody tr').click(function(){
			document.getElementById("rebtn2").style.display = "inline-block";
			flag = false;
			
			 var bo_no = $(this).find('td:eq(1)').find('#bo_no').val();
			 var hidden_mem_id = $(this).find('td:eq(1)').find('#hidden_mem_id').val();
			 var bo_writer = $(this).find('td:eq(1)').text();
			 var bo_content = $(this).find('td:eq(2)').text();
			 
			 $('#bo_content_reply').val(bo_content);
			 
			 $('#rebtn2').click(function(){ // 댓글 삭제
				 
					$.ajax({
				         type : 'POST',
				         url : '${pageContext.request.contextPath}/admin/recruitboard/deleteRecruitboardReply.do',
				         dataType : 'json', 
				         data : { 
				        	 bo_no : bo_no
				        	 },
				         error : function(result){
				            alert(result.status + ' | ' + result.responseText);
				         },
				         success : function(andView){
//				        	 $('#refreshDiv').load(document.URL +  ' #refreshDiv'); 
//				        	 $('#refresh_').load(document.URL +  ' #refresh_'); 
				        	 document.location.reload();
				        	 return true;
				         }
				      });
			});
			 
			 if(mem_id == hidden_mem_id){
				 document.getElementById("rebtn1").style.display = "inline-block";
// 				 document.getElementById("rebtn2").style.display = "inline-block";
				   
				 $('#rebtn1').click(function(){ // 댓글 수정
					$.ajax({
				         type : 'POST',
				         url : '${pageContext.request.contextPath}/admin/recruitboard/updateRecruitboardReply.do',
				         dataType : 'json', 
				         data : { 
				        	 bo_no : bo_no,
				        	 bo_content : $('#bo_content_reply').val()
				        	 },
				         error : function(result){
				            alert(result.status + ' | ' + result.responseText);
				         },
				         success : function(andView){
// 				        	 $('#refreshDiv').load(document.URL +  ' #refreshDiv'); 
// 				        	 $('#refresh_').load(document.URL +  ' #refresh_'); 
				        	 document.location.reload();
				        	 return true;
				         }
				      });	
				});
			 }
			 else{
				 document.getElementById("rebtn1").style.display = "none";
// 				 document.getElementById("rebtn2").style.display = "none";
			 } 
		      
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
            rbyte += 4;                                         //한글2Byte
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
            rbyte += 4;                                         //한글2Byte
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
	   document.getElementById('byteInfo_1').innerText = rbyte;
	 }
}	
function submitFail(message){
	alert(message);
	return false;
}
</script>
</html>


