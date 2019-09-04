<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script type="text/javascript">
$(function(){
	
	$("form[name=registFrm]").submit(function(){
		
		var que_title 		= $("#bo_que_title").val();
		var que_content		= $("#bo_que_cont").val();
		var ans_content		= $("#bo_ans_cont").val();
		
		// 타이틀 특수 문자가 있나 없나 체크 
		var special_pattern = /[`@#$%&*|;:<>{}\/?]/gi; 
		if(special_pattern.test(que_title) == true) { 
			return messagePrt('제목에는 특수문자를 사용할 수 없습니다.');
		}
		
		if(que_title == "" || que_title == null){
			alert("질문 제목을 입력해주세요");
    		var message = "질문 제목을 입력해주세요.";
	        return messagePrt(message);
	    }
		
		if(que_content == "" || que_content == null){
			alert("질문 내용을 입력해주세요");
    		var message = "질문 내용을 입력해주세요.";
	        return messagePrt(message);
	    }
		
		if(ans_content == "" || ans_content == null){
			alert("답변 내용을 입력해주세요");
    		var message = "답변 내용을 입력해주세요.";
	        return messagePrt(message);
	    }
		
		// 입력값 검증 : validation.js
		$(this).attr("action", "${pageContext.request.contextPath }/user/faqboard/insertFaqInfo.do");
		$(this).append("<input type='hidden' name='mem_id' value ='${LOGIN_MEMBERINFO.mem_id}'></input>");
		$(this).append("<input type='hidden' name='bo_writer' value ='${LOGIN_MEMBERINFO.mem_nick}'></input>");
	});

	$("#btn_list").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/user/faqboard/faqList.do?currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}");
	});
	
});

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
	   document.getElementById('byteInfo1').innerText = rbyte;
	 }
}
function fnChkByte2(obj, maxByte){
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
	   document.getElementById('byteInfo2').innerText = rbyte;
	 }
}
function messagePrt(message) {
	alert(message);
	return false;
}
</script>
</head>
<body >
	<form action="" method="post" name="registFrm">
		<div class="card" style="height: 700px; margin: auto;">
			<div class="card-header">
				<h5>FAQ 궁금증 해결소</h5>
				<span>관리자가 작성하는 공간</span>
			</div>
			<div class="card-block">
				<h4 class="sub-title">글쓰기</h4>
<!-- 				<form class="form-horizontal" role="form" action="" method="post"> -->
					<div class="form-group row">
						<label class="col-sm-2 col-form-label" style="text-align: center">질문
							제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"
								placeholder="질문 제목을 입력하세요." name="bo_que_title" id="bo_que_title">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label" style="text-align: center">질문
							내용</label>
						<div class="col-sm-10">
							<textarea style="height: 200px" rows="5" cols="5"
								class="form-control" placeholder="질문 내용을 입력하세요." name="bo_que_cont" id="bo_que_cont" onKeyUp="javascript:fnChkByte1(this,'1000')"></textarea>
							<span id="byteInfo1">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label" style="text-align: center">답변
							내용</label>
						<div class="col-sm-10">
							<textarea style="height: 200px" rows="5" cols="5"
								class="form-control" placeholder="답변 내용을 입력하세요." name="bo_ans_cont" id="bo_ans_cont" onKeyUp="javascript:fnChkByte2(this,'1000')"></textarea>
							<span id="byteInfo2">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes	
						</div>
					</div>
<!-- 				</form> -->
				<div>
					<button type="submit" class="btn btn-inverse btn-sm"
						style="float: right; margin-right: 2px;">
						<i class="ti-pencil-alt"></i>&nbsp;등록
					</button>
					<button id="btn_list" type="button" class="btn btn-inverse btn-sm"
						style="float: right; margin-right: 2px;">
						<i class="ti-menu-alt"></i>&nbsp;목록
					</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>


