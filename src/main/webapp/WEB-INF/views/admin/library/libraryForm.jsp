<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 등록</title>
<style type="text/css">
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>
<script type="text/javascript">

$(function() {

	$('form[name=registFrm]').submit(function(){
		
		var title 		= $('#bo_title').val();
		var content		= $('#bo_cont').val();
		
		var fileCheck1 = document.getElementById("file01").value;
		var fileCheck2 = document.getElementById("file02").value;
		
	    if(!fileCheck1 || !fileCheck2){
	        alert("파일을 첨부해 주세요");
	        return false;
	    }
		
		// 타이틀 특수 문자가 있나 없나 체크 
		var special_pattern = /[`@#$%&*|;:<>{}\/?]/gi; 
		if(special_pattern.test(title) == true) { 
			return messagePrt('제목에는 특수문자를 사용할 수 없습니다.');
		}
		
		if(title == '' || title == null){
			alert("제목을 입력해주세요");
    		var message = '제목을 입력해주세요.';
	        return messagePrt(message);
	    }
		
		if(content == '' || content == null){
			alert("내용을 입력해주세요");
    		var message = '내용을 입력해주세요.';
	        return messagePrt(message);
	    }
			
		// 입력값 검증 : validation.js
		$(this).attr('action', '${pageContext.request.contextPath }/admin/library/insertLibraryInfo.do');
		$(this).append('<input type="hidden" name="bo_writer" value ="${LOGIN_ADMININFO.mem_nick}"></input>');
		$(this).append('<input type="hidden" name="mem_id" value ="${LOGIN_ADMININFO.mem_id}"></input>');

	});

	$("#btn_list").click(function() {
		$(location).attr("href","${pageContext.request.contextPath}/admin/library/libraryList.do");
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

/* 업로드 체크 */
/* 업로드 체크 */
function sizeCheck1() {

	var size1 = document.getElementById("file01").files[0].size;
	var maxSize = 5 * 1024 * 1024;//5MB
	if(size1 != 0){
		var cal_size = size1 / 1024 / 1024; 
	}
	
    if(size1 > maxSize){
       alert("현재 첨부된 파일 사이즈는 " + cal_size.toFixed(2) + "MB입니다. 첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
       return;
    }else if(size1 == 0){
    	alert("파일을 첨부해주세요!");
        return;
    }

}
function sizeCheck2() {

	var size2 = document.getElementById("file02").files[0].size;
	var maxSize = 5 * 1024 * 1024;//5MB
	if(size2 != 0){
		var cal_size = size2 / 1024 / 1024; 
	} 
	 
    if(size2 > maxSize){
       alert("현재 첨부된 파일 사이즈는 " + cal_size.toFixed(2) + "MB입니다. 첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
       return;
    }else if(size2 == 0){
    	alert("파일을 첨부해주세요!");
        return;
    }
}
function messagePrt(message) {
	alert(message);
	return false;
}
</script>
</head>
<body >
	<form name="registFrm" action="" 
		  method="post" enctype="multipart/form-data">
		<div class="card" style="height: 700px; margin: auto;">
			<div class="card-header">
				<h5>자료실</h5>
				<span>필요한 자료를 공유하는 공간입니다 :)</span>
			</div>
			<div class="card-block">
				<h4 class="sub-title">글쓰기</h4>
<!-- 				<form class="form-horizontal" role="form" action="" method="post"> -->
					<div class="form-group row">
						<label class="col-sm-2 col-form-label" style="text-align: center">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"
								placeholder="제목을 입력하세요." name="bo_title" id="bo_title">
						</div>
					</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="text-align: center">내용</label>
					<div class="col-sm-10">
						<textarea style="height: 200px" rows="5" cols="5"
							class="form-control" placeholder="글 내용을 입력하세요." name="bo_cont" id="bo_cont" onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
						<span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes	
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
					<div class="col-sm-10">
						<input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
						<input type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary btn-sm" value="upload" onclick="sizeCheck1()">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
					<div class="col-sm-10">
						<input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
						<input type="button" class="btn waves-effect waves-light btn-primary btn-outline-primary btn-sm" value="upload" onclick="sizeCheck2()">	
					</div>
				</div>
				<!-- 				</form> -->
				<div>
					<button type="submit" class="btn btn-inverse btn-sm"
						style="float: right; margin-right: 2px;" onclick="fileCheck( this.form.files )">
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


