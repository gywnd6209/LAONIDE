<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글</title>

</head>
<body>
<form name="insertFrm" class="form-horizontal" role="form" action="" method="post">
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card" style=" height: 600px; margin: auto;">
		       <div class="card-header">
		           <h5>Q&A 게시판</h5>
		       </div>
		       <div class="card-block">
		           <h4 class="sub-title">글쓰기</h4>
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 제목</label>
		                   <div class="col-sm-10">
		                       <input type="text" id="bo_title" class="form-control"
		                       placeholder="질문 제목을 입력하세요." onKeyUp="javascript:fnChkByte1(this,'200')">
		                   </div>
		               </div>
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">Q&A 내용</label>
		                   <div class="col-sm-10">
		                       <textarea id="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       placeholder="질문 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
		                      <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes  
		                    
		                   </div>
		               </div>
		               
		               
				</div>
				<div style="text-align: right;">
				<button type="submit" id="btn1" class="btn btn-sm btn-inverse " ><i class="ti-pencil"></i>&nbsp;등록</button>
				<button id="btn2" type="button" class="btn btn-inverse btn-sm"  ><i class="ti-menu-alt"></i>&nbsp;목록</button>
				
<!-- 					<button type="submit"  id="btn1" class="btn waves-effect waves-light btn-success" style="float: right"><i class="icofont icofont-check-circled"></i>등록</button> -->
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
		

	
		

		var mem_nick = '${LOGIN_MEMBERINFO.mem_nick}';
		var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
		
		$('#btn2').click(function(){
			location.href='${pageContext.request.contextPath}/user/qaboard/qaboardList.do';
		});
		
		$('#btn1').click(function(){
			
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
			
			 $('form[name=insertFrm]').submit(function(){
				 
				 	
					
			    	$(this).attr('action', '${pageContext.request.contextPath}/user/qaboard/insertQaboard.do'); 
					
			    	$(this).append('<input type="hidden" name="bo_title" value="'+title+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_content" value="'+content+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_writer" value="'+mem_nick+'" ></input>' );
					$(this).append('<input type="hidden" name="mem_id" value="'+mem_id+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_group" value="${param.bo_group}" ></input>' );
			    });
		});
		
// 		$('#btn3').click(function(){
// 			location.href='${pageContext.request.contextPath}/user/qaboard/deleteQaboard.do?bo_no='+${qaboardInfo.bo_no};
// 		});
		
		
	});
	
	function messagePrt(message) {
		alert(message);
		return false;
	}

</script>
</html>


