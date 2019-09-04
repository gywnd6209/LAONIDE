<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀원모집 게시글 등록</title>
</head>
<body>
<div class="pcoded-inner-content">
    <!-- Main-body start -->
	<div class="main-body">
	    <div class="page-wrapper">
	        <!-- Page-body start -->
	        <div class="page-body">
			<div class="card">
		       <div class="card-header">
		           <h5>팀원모집 게시판</h5>
		       </div>
		       <div class="card-block">
		           <h4 class="sub-title">글쓰기</h4>
		         	 <form class="form-horizontal" name="registFrm" role="form" action="" method="post">
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="bo_title">개발 제목</label>
		                   <div class="col-sm-10">
		                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control" 
		                       					id="bo_title" name="bo_title" placeholder="개발 제목을 입력하세요.">
		                   </div>
		               </div>
		               
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="bo_content">개발 내용</label>
		                   <div class="col-sm-10">
		                       <textarea name="bo_content" style="height: 200px" rows="5" cols="5" class="form-control"
		                       placeholder="개발 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
		                       <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes  
		                   </div>
		               </div>
						
		               <div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center" for="bo_person">모집 인원</label>
		                   <div class="col-sm-10">
		                       <input type="text" class="form-control" id="bo_person" name="bo_person" placeholder="모집 인원을 입력하세요.">
		                   </div>
		               </div>
		               
						<div class="form-group row">
		                   <label class="col-sm-2 col-form-label" style="text-align: center">개발 시작일 ~ <br/>개발 완료일</label>
		                   	 <div class='col-sm-2 input-group date dateTimePicker' id="datepicker1" style="width: 170px">
		                         <input type='date' class="form-control" style="width:auto;" data-date-format="YYYY-MM-DD" 
		                         						name="bo_begin_date" id="bo_begin_date" required="required"/>
		                     </div>&nbsp;&nbsp;&nbsp;&nbsp;
		                         <h4 align="center"><b>~</b></h4>&nbsp;&nbsp;&nbsp;&nbsp;
		                     <div class='col-sm-2 input-group date dateTimePicker' id="datepicker2" style="width: 170px">
		                         <input type='date' class="form-control" style="width:auto;" data-date-format="YYYY-MM-DD" 
		                        						 name="bo_end_date" id="bo_end_date" required="required"/>
		                     </div>
		               </div>
				        <div style="text-align: right;">
							<button type="submit" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;등록</button>
							<button type="button" id="btn1" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
						</div>
		           </form>
				</div>
				</div>
			</div>
		 </div>
 	</div>
 </div>
</body>
<script type='text/javascript'>
$(document).ready( function() {
	// Date 최소날짜 현재날짜로 fix.
    var now = new Date();
 
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    
   document.getElementById("bo_begin_date").min = today;
   document.getElementById("bo_end_date").min = today;
});

var flag = true;
$(function(){
	// 목록
	$('#btn1').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath }/user/recruitboard/recruitboardList.do'
								+"?currentPage=${param.currentPage}&search_keyword=${param.search_keyword}&search_keycode=${param.search_keycode}");
		});
	// 등록
	$('form[name=registFrm]').submit(function(){
		// 타이틀 특수 문자가 있나 없나 체크 
		var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
		if(special_pattern.test($('input[name=bo_title]').val()) == true) { 
			return submitFail('제목에는 특수문자를 사용할 수 없습니다.');
		} 
		if($('input[name=bo_title]').val()==""||$('input[name=bo_title]').val()==null){
			return submitFail("개발 제목을 입력해주세요");
	      }
		if($('input[name=bo_person]').val()==""||$('input[name=bo_person]').val()==null){
			return submitFail("모집 인원을 입력해주세요");
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
    	
		$(this).attr('action', '${pageContext.request.contextPath }/user/recruitboard/insertRecruitboard.do');
		$(this).append('<input type="hidden" name="bo_writer" value ="${LOGIN_MEMBERINFO.mem_nick}"></input>');
		$(this).append('<input type="hidden" name="mem_id" value ="${LOGIN_MEMBERINFO.mem_id}"></input>');

		return flag;
	});
});

// 글 내용 바이트체크
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
// 	  alert("글 내용은 한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  alert("글 내용은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte(obj, maxByte);
	  
	 }else{
	   document.getElementById('byteInfo').innerText = rbyte;
	 }
}

//글 제목 바이트체크
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
// 	  alert("글제목은 한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
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


