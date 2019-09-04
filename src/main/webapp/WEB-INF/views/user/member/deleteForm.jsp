<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
​
<meta charset="UTF-8">

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
<title>탈퇴 사유</title>
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
							<h5>탈퇴 사유</h5>
							<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code>
								tag
							</span>
						</div>
						<div class="card-block">
							<h4 class="sub-title">글쓰기</h4>
							<form class="form-horizontal" name="registFrm" role="form" action="" method="post" enctype="multipart/form-data">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label"
										style="text-align: center">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bo_title"
											name="bo_title" placeholder="글 제목을 입력하세요.">
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-2 col-form-label"
										style="text-align: center">내용</label>
									<div class="col-sm-10">
										<textarea id="bo_cont" name="bo_cont" style="height: 200px" rows="5"
											cols="5" class="form-control" placeholder="글 내용을 입력하세요."></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
									<div class="col-sm-10">
										<input type="file" class="filestyle" id="file01" name="files"
											data-buttonName="btn-primary">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
									<div class="col-sm-10">
										<input type="file" class="filestyle" id="file02" name="files"
											data-buttonName="btn-primary">
									</div>
								</div>
								
								<div>
									<button type="submit" id="insert" class="btn waves-effect waves-light btn-success" style="float: right">
										등록
									</button>
									<button type="button" id="list" class="btn waves-effect waves-light btn-info" style="float: right">
										목록
									</button>
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

	$(function(){
		$('#list').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath }/user/freeboard/freeboardList.do'
					+"?currentPage=${param.currentPage}&search_keyword=${param.search_keyword}&search_keycode=${param.search_keycode}");
		});
		
		$('#insert').click(function(){
			$('form[name=registFrm]').submit(function(){
				var content = $('#bo_cont').val();
				var title = $('#bo_title').val();
				
				if (title == ""||title == null) {
					alert("제목을 입력하세요");
					var message = '제목을 입력해주세요.';
					return messagePrt(message);
				}
				if (content==''||content==null) {
					alert("내용을 입력하세요");
					var message = '내용을 입력해주세요.';
					return messagePrt(message);
				}
				
				console.log(title)
				console.log(content)
				
				$(this).attr('action', '${pageContext.request.contextPath }/user/freeboard/insertFreeboard.do');
				
				$(this).append('<input type="hidden" name="bo_writer" value ="${LOGIN_MEMBERINFO.mem_nick}"></input>');
				$(this).append('<input type="hidden" name="mem_id" value ="${LOGIN_MEMBERINFO.mem_id}"></input>');
				
				return true;
			});
		});
	});
	
	$("#list").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/user/freeboard/freeboardList.do")
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


