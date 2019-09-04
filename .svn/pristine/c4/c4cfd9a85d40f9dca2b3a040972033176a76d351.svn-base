<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 답변</title>

</head>
<body>
<form name="updateFrm" class="form-horizontal" role="form" action="" method="post">
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card" style="height: 750px; margin: auto;">
		       <div class="card-header">
		           <h5>Q&A 답변</h5>
		       </div>
		       <div class="card-block">
		           <h4 class="sub-title">글쓰기</h4>
<!-- 		               <div class="form-group row"> -->
<!-- 		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 답변 제목</label> -->
<!-- 		                   <div class="col-sm-10"> -->
<!-- 		                       <input type="text" id="bo_title" class="form-control" -->
<!-- 		                       placeholder="개발 제목을 입력하세요."> -->
<!-- 		                   </div> -->
<!-- 		               </div> -->
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 답변 내용</label>
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
									
		                       <textarea id="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       placeholder="답변 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')">${qaboardReplyInfo.bo_content}</textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes 
		                   </div>
		               </div>
		               
		               
				</div>
				<div style="text-align: right;">
				
				<button type="submit" id="btn1" name="btn1" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
				<button type="button" id="btn4" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제</button>
				<button id="btn2" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>



<!-- 					<button type="submit"  id="btn1" class="btn waves-effect waves-light btn-success" style="float: right"><i class="icofont icofont-check-circled"></i>수정</button> -->
<!-- 					<button type="button"  id="btn4" class="btn waves-effect waves-light btn-success" style="float: right"><i class="icofont icofont-check-circled"></i>삭제</button> -->
<!-- 					<button type="button" id="btn2" name="btn2"  class="btn waves-effect waves-light btn-inverse" style="float: right" ><i class="icofont icofont-exchange"></i>목록</button> -->
<!-- 					<button type="button" id="btn3" class="btn waves-effect waves-light btn-info" style="float: right"><i class="icofont icofont-info-square"></i>취소</button> -->
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
     alert("답변 내용은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
     str2 = str.substr(0,rlen);                                  //문자열 자르기
     obj.value = str2;
     fnChkByte(obj, maxByte);
     
    }else{
      document.getElementById('byteInfo').innerText = rbyte;
    }
}

	$(function(){
		
		$('#bo_title').val('${qaboardReplyInfo.bo_title}');

		$('#btn2').click(function(){
			location.href='${pageContext.request.contextPath}/admin/qaboard/qaboardList.do';
		});
		
		$('#btn1').click(function(){
			
			var content1 = $('#bo_content').val();	
			
			if(content1 == '' || content1 == null){
	    		var message = '내용을 입력해주세요.';
		        return messagePrt(message);
		    }
		
			
			 $('form[name=updateFrm]').submit(function(){
				 
			 	var title = $('#bo_title').val();			
				var content = $('#bo_content').val();	
		    	$(this).attr('action', '${pageContext.request.contextPath}/admin/qaboard/updateQaboard.do'); 
				
		    	$(this).append('<input type="hidden" name="bo_title" value="'+title+'" ></input>' );
				$(this).append('<input type="hidden" name="bo_content" value="'+content+'" ></input>' );
				$(this).append('<input type="hidden" name="bo_no" value="'+${qaboardReplyInfo.bo_no}+'" ></input>' );
		    });
		});
		
		
		$('#btn4').click(function(){
// 			location.href='${pageContext.request.contextPath}/user/qaboard/deleteQaboardReply.do?bo_no='+${qaboardInfo.bo_no};
			location.href='${pageContext.request.contextPath}/admin/qaboard/deleteQaboardReply.do?bo_no='+${qaboardReplyInfo.bo_no};
		});
		
		
	});
	
	function messagePrt(message) {
		alert(message);
		return false;
	}

</script>
</html>


