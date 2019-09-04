<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script> -->
<script type="text/javascript">
var flag = true;
$(function(){
// 	$('#bo_cont').summernote();

	// textarea 줄바꿈 그대로 저장
	var str = $('#bo_cont').val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#bo_cont').val(str);
    
	
    $('#goListBtn').click(function() {
		$(location).attr('href', '${pageContext.request.contextPath }/user/issuetracker/board/projectboardList.do?'
				+'currentPage=${param.currentPage}&pro_code=${param.pro_code}&search_keyword=' + encodeURI('${param.search_keyword}')+'&search_keycode=${param.search_keycode}&pro_name=${param.pro_name }');
	});
    
	$('form[name=proboardRegiForm]').submit(function() {
		
		var special_pattern = /[`@#$%&*|;:<>{}\/]/gi; 
		if(special_pattern.test($('#bo_title').val()) == true) { 
		   alert("제목에는 특수문자를 사용할 수 없습니다.")
		   return false; 
		} 
		
		// 입력값 검증
// 		th_title th_nickname th_pwd
		var title 		= $('#bo_title').val();
		var content		= $('#bo_cont').val();
		
		if(title==null||title==''){
			return submitFail('제목을 입력해주세요!');
		}
		if(content==''||content==null){
			return submitFail('내용을 입력해주세요!');
		}
		
// 		$('input[name=thumbfiles]').each(function(index, inputTag){
			
// 			if($(inputTag).val()==null||$(inputTag).val()==''){
// 				flag = false;
// 				return submitFail('첨부파일을 등록해주세요!');
// 			}else{
// 				if(!/\.(jpg|jpeg|png|gif)/.test($(inputTag).val().toLowerCase())){
// 					flag = false;
// 					return submitFail('첨부파일은 이미지만 가능합니다!');
// 				}else{
// 					flag = true;
// 				}
// 			}
			
// 		});
		
		
		$(this).attr('action', '${pageContext.request.contextPath }/user/issuetracker/board/insertProboard.do?pro_code=${param.pro_code}&pro_name=${param.pro_name }');
		$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_nick}"></input>');
		$(this).append('<input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id}"></input>');
		ws.send("team:${LOGIN_MEMBERINFO.mem_id}:${param.pro_code}:BOARD");
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
</script>
</head>
<body >
	<div class="card" >
       <div class="card-header">
           <h5>우리팀 자유게시판</h5>
       </div>
       <div class="card-block">
           <h4 class="sub-title">글쓰기</h4>
         	 <form name="proboardRegiForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">글 제목</label>
                   <div class="col-sm-10">
                       <input type="text" onKeyUp="javascript:fnChkByte_title(this,'200')" class="form-control"  id="bo_title" name="bo_title" 
                       placeholder="글 제목을 입력하세요.">
                   </div>
               </div>
               
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label" style="text-align: center">글 내용</label>
                   <div class="col-sm-10">
<!--                        <textarea id="bo_cont" name="bo_cont" style="height: 200px" rows="5" cols="5" class="form-control" -->
<!--                        placeholder="글 내용을 입력하세요."></textarea> -->
                       <textarea id="bo_cont" name="bo_cont" style="height: 200px" rows="5" cols="5" class="form-control"   
                       onKeyUp="javascript:fnChkByte(this,'1000')" placeholder="글 내용을 입력하세요."></textarea>
					   <span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes  
                       
                   </div>
               </div>
               
				<label class="control-label col-sm-2" for="file01">첨부파일1</label>
					 <input type="file" class="filestyle" id="files01" name="files" data-buttonName="btn-primary">
				</br>
				<label class="control-label col-sm-2" for="file02">첨부파일2</label>
					<input type="file" class="filestyle" id="files02" name="files" data-buttonName="btn-primary">
				
		</div>
		<div  style="text-align: right;">
			<button type="submit" id="regiBtn" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;등록</button>
			<button id="goListBtn" type="button" class="btn btn-inverse btn-sm" ><i class="ti-menu-alt"></i>&nbsp;목록</button>
		</div>
 			</form>
 	</div>
</body>
</html>


