<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var mem_id 		= '${LOGIN_MEMBERINFO.mem_id}';
var mem_nick 	= '${LOGIN_MEMBERINFO.mem_nick}';
var bo_mem_id 	= '${faqboardInfo.mem_id}';
var bo_writer 	= '${faqboardInfo.bo_writer}';

$(function(){
	
	//목록으로 돌아가기
	$('#btn_list').click(function() {
		$(location).attr('href', '${pageContext.request.contextPath}/user/faqboard/faqList.do?'
				 + '&currentPage=${currentPage}&search_keyword='+encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}');
	});
	
	//삭제하기
	$('#btn_del').click(function(){
		if(mem_id == bo_mem_id){
			$(location).attr('href','${pageContext.request.contextPath}/user/faqboard/deleteFaqInfo.do?bo_no=${faqboardInfo.bo_no}');
		}else{
			alert('게시글 작성자만 삭제 가능합니다!');
		}
	});
	
	//수정하기
	$('form[name=updateFaq]').submit(function(){
		
		if(mem_id == bo_writer){
			
			$(this).attr('action', '${pageContext.request.contextPath }/user/faqboard/updateFaqInfo.do'); 
			
			var boQueTitle = $('#bo_que_title').val();
			var boQueCont  = $('#bo_que_cont').val();
			var boAnsCont  = $('#bo_ans_cont').val();
			
			$(this).append('<input type="hidden" name="bo_content" value="'+boQueTitle+'" ></input>' );
			$(this).append('<input type="hidden" name="bo_content" value="'+boQueCont+'" ></input>' );
			$(this).append('<input type="hidden" name="bo_content" value="'+boAnsCont+'" ></input>' );
		
		}else{
			BootstrapDialog.show({
		 	    title	: '경고',
		 	    message : '게시글 작성자만 수정할 수 있어요.'
	 		});
			return false;
		}	
	});
	
});

</script>
</head>
<body>
	<form name="updateFaq" method="post" role="form">
	<input type="hidden" name="bo_no" value="${faqboardInfo.bo_no}"/>
		<div class="card" style="height: 700px; margin: auto;">
			<div class="card-header">
				<h5>FAQ 궁금증 해결소</h5>
				<span>라온 서비스와 관련된 자주 묻는 질문과 답변</span>
			</div>
			<div class="card-block">
				<h4 class="sub-title">글 상세보기</h4>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="text-align: center">질문
						제목</label>
					<div class="col-sm-10">
						<input name="bo_que_title" type="text" class="form-control" placeholder="글 제목을 입력하세요."
							value="${faqboardInfo.bo_que_title}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="text-align: center">질문
						내용</label>
					<div class="col-sm-10">
						<textarea name="bo_que_cont" style="height: 200px" rows="5" cols="5"
							class="form-control" placeholder="글 내용을 입력하세요.">${faqboardInfo.bo_que_cont}</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="text-align: center">답변
						내용</label>
					<div class="col-sm-10">
						<!-- 						<label></label> -->
						<textarea name="bo_ans_cont" style="height: 200px" rows="5" cols="5"
							class="form-control" placeholder="글 내용을 입력하세요.">${faqboardInfo.bo_ans_cont}</textarea>
					</div>
				</div>
				<div style="text-align: right;">
					<button id="btn_list" type="button" class="btn btn-inverse btn-sm"><i class="ti-menu-alt"></i>&nbsp;목록	</button>
					<!-- 관리자일 경우에만 수정할 수 있도록 설정하기 -->
					<c:if test="${LOGIN_MEMBERINFO.mem_id eq faqboardInfo.mem_id}">
						<button type="submit" id="btn_update" class="btn btn-sm btn-inverse "><i class="ti-pencil"></i>&nbsp;수정</button>
						<button type="button" id="btn_del" class="btn btn-sm btn-inverse "><i class="fa fa-trash close-card"></i>&nbsp;삭제	</button>
					</c:if>
					&nbsp;
				</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>