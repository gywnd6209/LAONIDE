<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
​
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/datetimepickerstyle.css" />

<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
	<div class="pcoded-inner-content" style="overflow: scroll;">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					<div class="card">
						<div class="card-header">
							<h5>공지사항</h5>
						</div>
						<div class="card-block">
							<h4 class="sub-title">글쓰기</h4>
							<form class="form-horizontal" name="registFrm" role="form" action="" method="post">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label"
										style="text-align: center">글 제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bo_title"
											name="bo_title" placeholder="글 제목을 입력하세요." onKeyUp="javascript:fnChkByte1(this,'200')">
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-2 col-form-label"
										style="text-align: center">공지사항 내용</label>
									<div class="col-sm-10">
										<textarea id="bo_content" name="bo_content"style="height: 200px" rows="5"
											cols="5" class="form-control" placeholder="글 내용을 입력하세요." onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
											<span id="byteInfo">0 &nbsp;</span>&nbsp;/&nbsp;1000bytes
									</div>
								</div>

								<div style="text-align: right;">
								<button type="submit" id="insert" class="btn btn-sm btn-inverse " ><i class="ti-pencil"></i>&nbsp;등록</button>
								<button id="list" type="button" class="btn btn-inverse btn-sm"  ><i class="ti-menu-alt"></i>&nbsp;목록</button>
<!-- 									<button type="submit" id="insert" class="btn waves-effect waves-light btn-success" style="float: right"> -->
<!-- 										등록 -->
<!-- 									</button> -->
<!-- 									<button type="button" id="list" class="btn waves-effect waves-light btn-info" style="float: right"> -->
<!-- 										목록 -->
<!-- 									</button> -->
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
     alert("글 제목은 최대 " + maxByte + "byte를 초과할 수 없습니다.");
     str2 = str.substr(0,rlen);                                  //문자열 자르기
     obj.value = str2;
     fnChkByte1(obj, maxByte);
//      $(obj).val("");
     
    }else{
      document.getElementById('byteInfo').innerText = rbyte;
    }
}


	$(function(){
		$('#list').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath }/admin/notice/noticeList.do'
					+"?currentPage=${param.currentPage}&search_keyword=${param.search_keyword}&search_keycode=${param.search_keycode}");
		});
		
		$('#insert').click(function(){
			

			//타이틀 특수 문자가 있나 없나 체크 
			var special_pattern = /[`@#$%&*|;:<>{}\/?]/gi; 
			if(special_pattern.test($('#bo_title').val()) == true) { 
			   alert("제목에는 특수문자를 사용할 수 없습니다.");
			   return; 
			} 
			
			$('form[name=registFrm]').submit(function(){
				
// 				if ($('input[name=bo_title]').val() == ""||$('input[name=bo_title]').val() == null) {
// 					alert("글 제목을 입력하세요");
// 					var message = '개발 제목을 입력해주세요.';
// 					return messagePrt(message);
// 				}
				
				var title = $('#bo_title').val();
				var content = $('#bo_content').val();
				console.log(title)
				console.log(content)
				
				$(this).attr('action', '${pageContext.request.contextPath }/admin/notice/insertNotice.do');
				
				$(this).append('<input type="hidden" name="bo_hit" value="'+title+'"></input>');
// 				$(this).append('<input type="hidden" name="bo_title" value="'+title+'"></input>');
// 				$(this).append('<input type="hidden" name="bo_content" value="'+content+'"></input>');
				$(this).append('<input type="hidden" name="bo_writer" value ="${LOGIN_ADMININFO.mem_nick}"></input>');
				$(this).append('<input type="hidden" name="mem_id" value ="${LOGIN_ADMININFO.mem_id}"></input>');
			});
		});
	});
	
	function messagePrt(message) {
		BootstrapDialog.show({
			title : '경고',
			message : message
		});
		
		return false;
	}
</script>
</html>


