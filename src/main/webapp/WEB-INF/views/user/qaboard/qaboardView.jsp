<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글</title>

</head>
<body>
<form name="updateFrm" class="form-horizontal" role="form" action="" method="post">
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card" style=" height: 750px; margin: auto;">
		       <div class="card-header">
		           <h5>Q&A 게시판</h5>
		       </div>
		       <div class="card-block">
		           <h4 class="sub-title">글쓰기</h4>
<!-- 		         	 <form name="updateFrm" class="form-horizontal" role="form" action="" method="post"> -->
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 제목</label>
		                   <div class="col-sm-10">
		                       <input type="text"  id="bo_title" class="form-control"
		                       placeholder="질문 제목을 입력하세요." onKeyUp="javascript:fnChkByte1(this,'200')" value="${qaboardInfo.bo_title}">
		                   </div>
		               </div>
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 내용</label>
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
											var bo_cont_obj = $('#bo_content')[0]; 
											var byteRtn = fnChkByte_View(bo_cont_obj, '1000');
											document.getElementById('byteInfo').innerText = byteRtn;
										});
									</script>
									
		                       <textarea  id="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       placeholder="질문 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')">${qaboardInfo.bo_content}</textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes 
		                   </div>
		               </div>
		              
		               <c:if test="${not empty qaboardReplyInfo }">
			               	<div class="form-group row">
			                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 답변</label>
			                   <div class="col-sm-10">
			                       <textarea id="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
			                       placeholder="답변 내용을 입력하세요."  >${qaboardReplyInfo.bo_content}</textarea>
			                   </div>
			              	 </div>
		               </c:if>
		               
<!-- 						<div class="form-group row"> -->
<!-- 		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 시작일 ~ <br/>Q&A 완료일</label> -->
<!-- 		                   	 <div class='input-group date dateTimePicker' id="datepicker1" style="width: 170px"> -->
<!-- 		                         <input id="startDate" type='text' class="form-control" name="openDate" required="required"/> -->
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
<!-- 		                     </div>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		                     <div class='input-group date dateTimePicker' id="datepicker2" style="width: 170px"> -->
<!-- 		                         <input id="endDate" type='text' class="form-control" name="closeDate" required="required"/> -->
<!-- 		                         <span class="input-group-addon"> -->
<!-- 		                             <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 		                         </span> -->
<!-- 		                     </div> -->
<!-- 		               </div> -->
		               
<!-- 		 			</form> -->
				</div>
				<div style="text-align: right;">
<!-- 					<button type="button"  id="btn6" class="btn waves-effect waves-light btn-success" style="float: right"><i class="icofont icofont-check-circled"></i>답변삭제</button> -->
					<button id="btn3" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
<c:if test="${LOGIN_MEMBERINFO.mem_id eq qaboardInfo.mem_id or not empty LOGIN_ADMININFO}">
					<button type="submit" id="btn2" name="btn2" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
					<button type="button" id="btn4" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
			

</c:if>
				</div>
	 				</div>
	 			</div>
		 </div>
 	</div>
 </div>
 </form>
</body>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> -->
<!-- ​<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<%-- <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/datetimepickerstyle.css" /> --%>
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
     alert("질문 내용은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
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
     alert("질문 제목은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
     str2 = str.substr(0,rlen);                                  //문자열 자르기
     obj.value = str2;
     fnChkByte1(obj, maxByte);
//      $(obj).val("");
     
    }
}


	$(function(){
		
		
		
		
		
		
		
		

		var qa_mem_id = '${qaboardInfo.mem_id}';
		var bo_writer = '${qaboardInfo.bo_writer}';
// 		$('#startDate').val('${qaboardInfo.bo_date}');
// 		$('#endDate').val('${qaboardInfo.bo_date}');

	    var mem_id = '${LOGIN_MEMBERINFO.mem_id}';

	    // 목록
		$('#btn3').click(function(){
			var search_keyword = encodeURIComponent('${search_keyword }');;
	     	var search_keycode = '${search_keycode }';
	     	var currentPage = '${currentPage }';
			location.href='${pageContext.request.contextPath}/user/qaboard/qaboardList.do?search_keyword=' + search_keyword + '&search_keycode=' + search_keycode+ '&currentPage=' + currentPage;
		});
		
		// 수정
		$('#btn2').click(function(){
			
			//타이틀 특수 문자가 있나 없나 체크 
			var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
			if(special_pattern.test($('#bo_title').val()) == true) { 
			   alert("제목에는 특수문자를 사용할 수 없습니다.");
			   return; 
			} 
			
		 	var title = $('#bo_title').val();			
			var content = $('#bo_content').val();	
			
			if(title == '' || title == null){
	    		var message = '제목을 입력해주세요.';
		        return messagePrt(message);
		    }
			
			if(content == '' || content == null){
	    		var message = '내용을 입력해주세요.';
		        return messagePrt(message);
		    }
			
			 $('form[name=updateFrm]').submit(function(){
					
				 if(mem_id == qa_mem_id){
				 
			    	$(this).attr('action', '${pageContext.request.contextPath}/user/qaboard/updateQaboard.do'); 
					
			    	$(this).append('<input type="hidden" name="bo_title" value="'+title+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_content" value="'+content+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_no" value="'+${qaboardInfo.bo_no}+'" ></input>' );
					
				 }else{
					 alert("게시글 작성자만 수정할 수 있어요.");
					 var message = '작성자만 수정 가능';
					 messagePrt(message);
					 return false;
				 }
			    });
			
		});
		
		// 삭제
		$('#btn4').click(function(){
			 if(mem_id == qa_mem_id){
				 
			location.href='${pageContext.request.contextPath}/user/qaboard/deleteQaboard.do?bo_no='+${qaboardInfo.bo_no}+'&bo_group='+${qaboardInfo.bo_group};
			 }else{
				 alert("게시글 작성자만 삭제할 수 있어요.");
				 var message = '작성자만 수정 가능'
					 messagePrt(message);
			 }
		});
		
		// 답변등록
		$('#btn1').click(function(){
			
			if(eval('${empty qaboardReplyInfo}')){
				location.href='${pageContext.request.contextPath}/user/qaboard/qaboardReplyForm.do?bo_no='+${qaboardInfo.bo_no}+'&bo_group='+${qaboardInfo.bo_group};
			}else{
				alert("이미 답변이 등록 되어있습니다.");
			}
			
		});
		
		// 답변수정
		$('#btn5').click(function(){
			if(eval('${!empty qaboardReplyInfo}')){
			location.href='${pageContext.request.contextPath}/user/qaboard/qaboardReplyUpdateForm.do?bo_no='+${qaboardInfo.bo_no}+'&bo_group='+${qaboardInfo.bo_group};
// 			location.href='${pageContext.request.contextPath}/user/qaboard/qaboardReplyUpdateForm.do?bo_no='+${qaboardInfo.bo_depth}+'&bo_group='+${qaboardInfo.bo_group};
			}else{
				alert("수정할 답변이 없습니다.");
			}
		});
		
	});
	
	function messagePrt(message) {
		alert(message);
		return false;
	}

</script>
</html>


