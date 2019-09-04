<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 답변</title>

</head>
<body>
<form name="insertFrm" class="form-horizontal" role="form" action="" method="post">
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card" style="width: 60%; height: 600px; margin: auto;">
		       <div class="card-header">
		           <h5>Q&A 답변</h5>
		           <span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>
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
		                       <textarea id="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       placeholder="개발 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'100')"></textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;100bytes  
		                   </div>
		               </div>
		               
		               
				</div>
				<div>
					<button type="submit"  id="btn1" class="btn waves-effect waves-light btn-success" style="float: right"><i class="icofont icofont-check-circled"></i>등록</button>
					<button type="button" id="btn2" name="btn2"  class="btn waves-effect waves-light btn-inverse" style="float: right" ><i class="icofont icofont-exchange"></i>목록</button>
					<button type="button" id="btn3" class="btn waves-effect waves-light btn-info" style="float: right"><i class="icofont icofont-info-square"></i>취소</button>
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
            rbyte += 2;                                         //한글2Byte
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



	$(function(){

		$('#btn2').click(function(){
			location.href='${pageContext.request.contextPath}/user/qaboard/qaboardList.do';
		});
		
		$('#btn1').click(function(){
			
			 $('form[name=insertFrm]').submit(function(){
				 
				 	var title = $('#bo_title').val();			
					var content = $('#bo_content').val();	
					
			    	$(this).attr('action', '${pageContext.request.contextPath}/user/qaboard/insertQaboardReply.do'); 
					
			    	$(this).append('<input type="hidden" name="bo_title" value="'+title+'" ></input>' );
					$(this).append('<input type="hidden" name="bo_content" value="'+content+'" ></input>' );
					$(this).append('<input type="hidden" name="admin_id" value="admin" ></input>' );
					$(this).append('<input type="hidden" name="bo_group" value="${qaboardInfo.bo_group}" ></input>' );
					$(this).append('<input type="hidden" name="bo_depth" value="${qaboardInfo.bo_depth}" ></input>' );
// 					$(this).append('<input type="hidden" name="bo_no" value="${qaboardInfo.bo_no}" ></input>' );
			    	
			    });
		});
		
// 		$('#btn3').click(function(){
// 			location.href='${pageContext.request.contextPath}/user/qaboard/deleteQaboard.do?bo_no='+${qaboardInfo.bo_no};
// 		});
		
		
	});

</script>
</html>


