<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결함 등록</title>
<script type="text/javascript">
$(document).ready( function() {
    var now = new Date();
 
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    
   document.getElementById("err_goal_end_date").min = today;
});

var flag = true;
$(function(){
	
	// textarea 줄바꿈 그대로 저장
	var str = $('#err_cont').val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#err_cont').val(str);
    
	
    $('#goListBtn').click(function() {
		$(location).attr('href', '${pageContext.request.contextPath }/user/issuetracker/errboard/errboardList.do?'
				+'currentPage=${param.currentPage}&pro_code=${param.pro_code}&search_keyword=' + encodeURI('${param.search_keyword}')+'&search_keycode=${param.search_keycode}&pro_name=${param.pro_name }');
	});
    
	$('form[name=errboardRegiForm]').submit(function() {
		// 입력값 검증
// 		th_title th_nickname th_pwd
		
		var title 		= $('#err_title').val();
		var content		= $('#err_cont').val();
		var date 		= $('#err_goal_end_date').val();
		var radio 		= $('input[name=err_priority]:checked').val();
		
		if(title==null||title==''){
			return submitFail('결함 제목을 입력해주세요!');
		}
		if(content==''||content==null){
			return submitFail('결함 내용을 입력해주세요!');
		}
		if(date==''||date==null){
			return submitFail('결함 해결예정일을 선택해주세요!');
		}
		var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
		if(special_pattern.test($('input[name=err_title]').val()) == true) { 
			return submitFail('제목에는 특수문자를 사용할 수 없습니다.');
		}
		$(this).attr('action', '${pageContext.request.contextPath }/user/issuetracker/errboard/insertErrboard.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }');
		$(this).append('<input type="hidden" name="err_writer" value="${LOGIN_MEMBERINFO.mem_nick}"></input>');
		$(this).append('<input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id}"></input>');
// 		$(this).append('<input type="hidden" name="isu_priority" value="'+radio+'"></input>');

		// 은혜 추가
		ws.send("team:${LOGIN_MEMBERINFO.mem_id}:${param.pro_code}:ERROR");

		return flag;
	});
});
function submitFail(message){
	alert(message);
	return false;
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
<body >
	<div class="card">
       <div class="card-header">
           <h5>우리팀 결함게시판</h5>
       </div>
       <div class="card-block">
           <h4 class="sub-title">글쓰기</h4>
         	 <form name="errboardRegiForm" class="form-horizontal" role="form" action="" method="post">
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">결함 제목</label>
                   <div class="col-sm-10">
                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control"  id="err_title" name="err_title" 
                       placeholder="결함 제목을 입력하세요.">
                   </div>
               </div>
               
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">결함 내용</label>
                   <div class="col-sm-10">
                       <textarea id="err_cont" name="err_cont" style="height: 200px" rows="5" cols="5" class="form-control"
                       placeholder="결함 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
                   </div>
               </div>
               
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">결함 담당자</label>
                   <div class="col-sm-10">
                      <select name='err_manager' style="height: 30px; width: 100px">
						  	<option value='선택' selected>----- 선택 -----</option>
						  <c:forEach items="${crewList }" var="crewInfo">
						  		<option value='${crewInfo.mem_nick }'>${crewInfo.mem_nick }&nbsp;&nbsp;|&nbsp;&nbsp;${crewInfo.grand_code }</option>
						  </c:forEach>
					  </select>
                   </div>
               </div>
               
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">결함 우선순위</label>
                   <div class="col-sm-10">
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_lowness.png">
                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_usually.png">
                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	<img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_Emergency.png"><br>
                    	<input type='radio' name='err_priority' value='낮음' checked/>낮음
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='err_priority' value='보통'/>보통
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type='radio' name='err_priority' value='긴급'/>긴급
                   </div>
               </div>
               
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">해결 예정일</label>
                   <div class='col-sm-3 input-group date dateTimePicker' id="datepicker" style="width: 170px">
	                  <input type='date' style="width:auto;" class="form-control" data-date-format="YYYY-MM-DD" name="err_goal_end_date" id="err_goal_end_date" required="required"/>
	               </div>
               </div>
				
			<div style="text-align: right;">
				<button type="submit" id="regiBtn" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;등록</button>
				<button id="goListBtn" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
			</div>
				
		</div>
 			</form>
 	</div>
</body>
</html>


