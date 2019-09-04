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
  left: 200px;
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
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
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
		                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control" 
		                       	id="bo_title" name="bo_title">
		                   </div>
		               </div>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" for="bo_content" style="text-align: center">개발 내용</label>
		                   <div class="col-sm-10">
		                   <script type="text/javascript">
					//등록된 바이트수 미리 계산 펑션
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
						var bo_cont_obj = $('#bo_content')[0]; 
						var byteRtn = fnChkByte_View(bo_cont_obj, '1000');
					// 	console.log('fnChkByte_View : ' +  byteRtn);
						document.getElementById('byteInfo').innerText = byteRtn;
					});
					</script>
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
		                         <input type='date' style="text-align: center; width:auto;" class="form-control" 
		                         name="bo_begin_date" id="bo_begin_date" required="required"/>
		                     </div>&nbsp;&nbsp;&nbsp;&nbsp;
		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp;
		                     <div class='col-sm-2 input-group date dateTimePicker' id="datepicker2" style="width: 170px">
		                         <input type='date' style="text-align: center; width:auto;" class="form-control" 
		                         name="bo_end_date" id="bo_end_date" required="required"/>
		                  	</div>
		               </div>
		               <!-- 댓글 -->
						<div class="card-block table-border-style">
		                 <div class="table-responsive" id="refreshDiv">
		                 
		                 <!-- 글쓴이 맞을 때 -->
		                 <c:if test="${LOGIN_MEMBERINFO.mem_id eq recruitboardInfo.mem_id }">
			                 <button type="button" class="btn waves-effect waves-light btn-success btn-outline-success" 
			                 		id="btn_team"><i class="ti-plus"></i>팀구성하기</button>
			                 <label>원하는 팀원을 체크하여 프로젝트 팀을 구성해보세요!</label>
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
					            	  <c:if test="${recruitReplyInfo.mem_id ne LOGIN_MEMBERINFO.mem_id}">
						            	  <td align="center">
						            	  	<input type="checkbox" name="ch_reply" value="${recruitReplyInfo.mem_id}">
						            	  	<input type="hidden" name="hidden_mem_nick" value="${recruitReplyInfo.bo_writer}">
						            	  </td>
					            	  </c:if>
					            	  <c:if test="${recruitReplyInfo.mem_id eq LOGIN_MEMBERINFO.mem_id}">
						            	  <td align="center">
						            	  </td>
					            	  </c:if>
					                  <td align="center">
					                  <span data-toggle="tooltip" title="">${recruitReplyInfo.bo_writer}&nbsp;&nbsp;&nbsp;&nbsp;<b>:</b>&nbsp;&nbsp;</span>
<%-- 					                  <span1>${recruitReplyInfo.bo_writer}&nbsp;&nbsp;&nbsp;&nbsp;<b>:</b>&nbsp;&nbsp;</span1> --%>
										<script type="text/javascript">
										// 툴팁 설정
										$('[data-toggle="tooltip"]').tooltip({
										    html: true,
										    animated : 'fade',
										    placement : 'top', // top, bottom, left, right 등으로 조정가능
										    container: "body",
										    title: "닉네임 : ${recruitReplyInfo.bo_writer}<br/> 가능 언어 : ${recruitReplyInfo.lang_code }<br/> 언어 레벨 : ${recruitReplyInfo.lang_level }"
										});
										</script>
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
					      </c:if>
					      
					     <!-- 글쓴이 아닐 때 -->
		                 <c:if test="${LOGIN_MEMBERINFO.mem_id ne recruitboardInfo.mem_id }">
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
					            	  </td>
					                  <td align="center">
					                  <span data-toggle="tooltip" title="" id="bo_writer">${recruitReplyInfo.bo_writer}&nbsp;&nbsp;&nbsp;&nbsp;<b>:</b>&nbsp;&nbsp;</span>
										<script type="text/javascript">
										// 툴팁 설정
										$('[data-toggle="tooltip"]').tooltip({
										    html: true,
										    animated : 'fade',
										    placement : 'top', // top, bottom, left, right 등으로 조정가능
										    container: "body",
										    title: "닉네임 : ${recruitReplyInfo.bo_writer}<br/> 가능 언어 : ${recruitReplyInfo.lang_code }<br/> 언어 레벨 : ${recruitReplyInfo.lang_level }"
										});
										</script>
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
					      </c:if>
		                 </div>
		             </div>
		             <c:if test="${!empty LOGIN_MEMBERINFO }">
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
					<c:if test="${LOGIN_MEMBERINFO.mem_id eq recruitboardInfo.mem_id }">
						<button type="submit" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
						<button type="button" id="btn2" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
					</c:if>		
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
   
// 닉네임 중복확인해서 체크박스 숨기기
   var chk_nick = document.getElementsByName("hidden_mem_nick"); // 체크박스객체를 담는다
   var chk = document.getElementsByName("ch_reply"); // 체크박스객체를 담는다
   var temp = "";
   var temp2 = "";

   for(var i = 0; i < chk_nick.length; i++){
   	   temp += chk_nick[i].value;
//    	   alert(temp);
   		if(temp==temp2){
//    			alert("중복");
   			chk[i].style.display = "none";
   			temp = "";
   		}else{
//    			alert("중복아님");
   			chk[i].style.display = "block";
   			temp2 += temp;
   			temp = "";
   		}
   }
});

	var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
	var mem_nick = $('#bo_writer').val();
	var bo_mem_id = '${recruitboardInfo.mem_id}';
	var flag = true;
	var bo_no;
	var bo_content;
	var pro_bo_no = '${proInfoInfo.bo_no}';
	
	if('${proInfoInfo.bo_no}' == null){
		pro_bo_no = "0"
	}
	
	// 체크된 아이디값 가져오기
	function selectDelRow() {
		var chk = document.getElementsByName("ch_reply"); // 체크박스객체를 담는다
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';          //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;                 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCnt++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = chk[i].value;
			if(checkCnt == 1){            	//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
			}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
		  }
			return rowid;   //'value1', 'value2', 'value3' 의 형태로 출력된다.
		}
	
	// 체크된 닉네임 값 가져오기
	function selectDelRow_nick() {
		var chk = document.getElementsByName("ch_reply"); // 체크박스객체를 담는다
		var ch_nick = document.getElementsByName("hidden_mem_nick"); // 댓글 닉네임 모두 담기
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';          //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;                 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCnt++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = ch_nick[i].value;
			if(checkCnt == 1){            	//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
			}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
		  }
			return rowid;   //'value1', 'value2', 'value3' 의 형태로 출력된다.
		}


	$(function() {
		var ch_values = document.getElementsByName("ch_reply");
		var checkCnt = 0;
		
		// 팀구성 버튼
		$('#btn_team').click(function() {
			for(var i=0; i<ch_values.length; i++){
				if(ch_values[i].checked == true){	
					checkCnt++;        //체크된 체크박스의 개수		
				}
			}
			if(checkCnt > 0){
				$.ajax({
			         type : 'POST',
			         url : '${pageContext.request.contextPath}/user/recruitboard/pro_count.do',
			         dataType : 'json', 
			         data : { 
			        	 mem_id : selectDelRow(),
			        	 bo_writer : mem_id
			        	 },
			         error : function(result){
			            alert(result.status + ' | ' + result.responseText);
			         },
			         success : function(andView){
			        	 if(andView.result == "success"){
			        		
							if(${proInfoInfo == null}){
								var url = '${pageContext.request.contextPath}/user/recruitboard/createTeam.do?bo_no=${recruitboardInfo.bo_no}'
									+ '&mem_id='+selectDelRow() + "&mem_nick=" + selectDelRow_nick();
								var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
											  'resizable=no, copyhistory=no, width=800px, height=700px, left=430px, top=130px';
								window.open(url, '프로젝트 팀 구성', options);
								
							}else if(${proInfoInfo != null}){
								if(pro_bo_no == ${recruitboardInfo.bo_no}){
									return submitFail("이미 팀구성이 완료된 프로젝트입니다.");
								}
							}
			        		 
			        	 }else{
			        		 alert(andView.result);
			        		 return;
			        	 }		        	  	
			        	 
			         }
			      });
			}else{
				return submitFail("팀원을 선택해주세요.");
			}
			
		});
		
		// 글 수정
		$('form[name=updateFrm]').submit(
				
				function() {
					var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
					if(special_pattern.test($('input[name=bo_title]').val()) == true) { 
						return submitFail("제목에는 특수문자를 사용할 수 없습니다.")
					}
					if ($('input[name=bo_title]').val() == ""
							|| $('input[name=bo_title]').val() == null) {
						return submitFail("개발 제목을 입력해주세요.");
					}
					if ($('textarea[name=bo_content]').val() == ""
							|| $('textarea[name=bo_content]').val() == null) {
						return submitFail("개발 내용을 입력해주세요.");
					}
					if ($('#bo_person').val() == ""
						|| $('#bo_person').val() == null) {
						return submitFail("모집 인원을 입력해주세요.");
					}
					var exptext = /^[0-9]+/;
					if(exptext.test($('input[name=bo_person]').val()) == false){
						return submitFail("모집 인원에는 숫자만 입력 가능합니다.");
					}
					if($('input[name=bo_person]').val() > 99){
						return submitFail("모집 인원이 너무 많습니다. 다시 입력해주세요.");
					}
			    	if($('#bo_end_date').val() < $('#bo_begin_date').val()){
			    		return submitFail("개발 기간이 잘못되었습니다. 완료일이 시작일보다 빠릅니다.");
			    	}
					
					 if (mem_id == bo_mem_id) { 
						$(this).attr('action','${pageContext.request.contextPath }/user/recruitboard/updateRecruitboard.do');
						$(this).append('<input type="hidden" name="bo_no" value="${recruitboardInfo.bo_no}"></input>');
						return true; //default
					 } else {
						 return submitFail("게시글 작성자만 수정할 수 있어요.");
					} 
					 
					 return flag;
				});
			
	
		$('#btn1').click(
			function() { // 목록
				$(location).attr('href', '${pageContext.request.contextPath }/user/recruitboard/recruitboardList.do?'+
									'&currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}');
			});
		
		$('#btn2').click(function() { // 삭제
				 if (mem_id == bo_mem_id) { 
					$(location).attr('href', '${pageContext.request.contextPath }/user/recruitboard/deleteRecruitboard.do?bo_no=${recruitboardInfo.bo_no}');
				 } else {
					 return submitFail("게시글 작성자만 삭제할 수 있어요.");
			 	}
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
	         url : '${pageContext.request.contextPath}/user/recruitboard/insertRecruitboardReply.do',
	         dataType : 'json', 
	         data : { 
	        	 bo_no : ${recruitboardInfo.bo_no},
	        	 bo_content : $('#bo_content_reply').val(),
	        	 bo_writer : '${LOGIN_MEMBERINFO.mem_nick}',
	        	 mem_id : '${LOGIN_MEMBERINFO.mem_id}',
	        	 lang_code : '${LOGIN_MEMBERINFO.lang_code}',
	        	 lang_level : '${LOGIN_MEMBERINFO.lang_level}',
	        	 bo_seq : ${recruitboardInfo.bo_seq},
	        	 bo_depth : ${recruitboardInfo.bo_depth},
	        	 bo_group : ${recruitboardInfo.bo_group}
	        	 },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
	        	 // 댓글부분만 재로딩하기
// 	        	 $('#refreshDiv').load(document.URL +  ' #refreshDiv'); 
// 	        	 $('#refresh_').load(document.URL +  ' #refresh_'); 
	        	 document.location.reload();  
	        	 return true;
	         }
	      });
			
		});
		
			
		$('#boardListTbody tr').click(function(){

			flag = false;
			
			 var bo_no = $(this).find('td:eq(1)').find('#bo_no').val();
			 var hidden_mem_id = $(this).find('td:eq(1)').find('#hidden_mem_id').val();
			 var bo_writer = $(this).find('td:eq(1)').text();
			 var bo_content = $(this).find('td:eq(2)').text();
			 
			 if(mem_id == hidden_mem_id){
				 document.getElementById("rebtn1").style.display = "inline-block";
				 document.getElementById("rebtn2").style.display = "inline-block";
				   
				 $('#bo_content_reply').val(bo_content);
				 
				 $('#rebtn1').click(function(){ // 댓글 수정
					$.ajax({
				         type : 'POST',
				         url : '${pageContext.request.contextPath}/user/recruitboard/updateRecruitboardReply.do',
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
				 
				 $('#rebtn2').click(function(){ // 댓글 삭제
						$.ajax({
					         type : 'POST',
					         url : '${pageContext.request.contextPath}/user/recruitboard/deleteRecruitboardReply.do',
					         dataType : 'json', 
					         data : { 
					        	 bo_no : bo_no
					        	 },
					         error : function(result){
					            alert(result.status + ' | ' + result.responseText);
					         },
					         success : function(andView){
// 					        	 $('#refreshDiv').load(document.URL +  ' #refreshDiv'); 
// 					        	 $('#refresh_').load(document.URL +  ' #refresh_'); 
					        	 document.location.reload();
					        	 return true;
					         }
					      });
				});
				 
			 }
			 else{
				 $('#bo_content_reply').val("");
				 document.getElementById("rebtn1").style.display = "none";
				 document.getElementById("rebtn2").style.display = "none";
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
function submitFail(message){
	alert(message);
	return false;
}
</script>
</html>


