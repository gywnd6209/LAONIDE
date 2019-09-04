<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
</head>
<body>

<div class="pcoded-inner-content">
	<!-- Main-body start -->
<div class="main-body">
	<div class="page-wrapper">
		<!-- Page-body start -->
		<div class="page-body">
		<!-- Hover table card start -->
		<div class="card">
			<div class="card-header">
				<h4>자유게시판</h4>
				<div class="card-header-right">
					<ul class="list-unstyled card-option">
						<li><i class="fa fa fa-wrench open-card-option"></i></li>
						<li><i class="fa fa-window-maximize full-card"></i></li>
						<li><i class="fa fa-minus minimize-card"></i></li>
						<li><i class="fa fa-refresh reload-card"></i></li>
						<li><i class="fa fa-trash close-card"></i></li>
					</ul>
				</div>
			</div>
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>NO</th>
								<th style="text-align:center">TITLE</th>
								<th>WRITER</th>
								<th style="text-align:center">DATE</th>
								<th style="text-align:center">HIT</th>
							</tr>
						</thead>
						<tbody id="freeboardTbody">
							<c:if test="${empty freeboardList }">
								<tr>
									<td colspan="5" align="center"><font color="red"><em>등록 된 글이 없습니다.</em></font></td>
								</tr>
							</c:if>
							<c:if test="${!empty freeboardList }">
								<c:forEach items="${freeboardList }" var="freeboardInfo">
<%-- 									<c:if test="{freeboardInfo.bo_status == 'n'}"> --%>
										<tr>
											<td ><input type="hidden" value="${freeboardInfo.bo_no }"/>${freeboardInfo.rnum }</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${freeboardInfo.bo_title }</td>
											<td ><input type="hidden" value="${freeboardInfo.mem_id }"/>${freeboardInfo.bo_writer }</td>
											<td  style="text-align:center">${freeboardInfo.bo_date }</td>
											<td  style="text-align:center">${freeboardInfo.bo_hit }</td>
										</tr>
<%-- 									</c:if> --%>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					${pageHtmls}
				</div>
			</div>
			
			<div>
				<form name="searchFrm" action="${pageContext.request.contextPath }/user/freeboard/freeboardList.do" method="post"
					class="form-inline pull-right">
					<select class="form-control" style="height: 40px;" id="search_keycode" name="search_keycode">
						<option>검색조건</option>
						<option value="total" selected="selected">전체</option>
						<option value="title" text-align="center">제목</option>
						<option value="content">내용</option>
						<option value="nick">작성자 닉네임</option>
						<option value="id">작성자 ID</option>
					</select> &nbsp;&nbsp; <input height="30px" id="search_keyword" name="search_keyword" 
						type="text" placeholder="검색어 입력" class="form-control" /> &nbsp;&nbsp;
					<button type="submit" class="btn btn-info btn-sm">
						<i class="ti-search"></i>&nbsp;검색
					</button>
					&nbsp;&nbsp;
					<button id="insert" type="button" class="btn btn-inverse btn-sm" i">
						<i class="ti-pencil-alt"></i>&nbsp;글쓰기
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</form>
			</div>
			
		</div>
		<!-- Hover table card end -->
		</div>
		<!-- Page-body end -->
	</div>
</div>
</body>

<script type="text/javascript">
console.log("${freeboardInfo }")

$(function(){
	
	if(eval('${!empty search_keyword}')){
	      $('#search_keyword').val('${search_keyword}');
	      var se_code = '${search_keycode}';
	      $("#search_keycode").val(se_code).prop("selected", true);
	   }
	
	$('#insert').click(function(){
		if (eval('${!empty LOGIN_MEMBERINFO}')) {
// 			$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do'
// 				+"?currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}");
			$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do');
		}else {
			alert("로그인 후 작성 가능합니다.");
			BootstrapDialog.show({
				title:'경고',
				message:'로그인해 주세요'
			});
			$(location).attr('href', '${pageContext.request.contextPath}/login/loginForm.do');
		}
	});
	
	$('#freeboardTbody tr').click(function(){
// 		var bo_title = $(this).find('td:eq(1)').text();
		var bo_no = $(this).find('td:eq(0)').find('input').val();
		var rnum = $(this).find('td:eq(0)').text();
		
		var search_keyword = encodeURIComponent('${search_keyword}');
		var search_keycode = '${search_keycode}';
		var currentPage = '${currentPage}';
		
		$(location).attr("href","${pageContext.request.contextPath}/user/freeboard/freeboardView.do?bo_no="+ bo_no +"&currentPage=${currentPage}&search_keyword=" + encodeURI('${search_keyword}')+"&search_keycode=${search_keycode}");
// 		if (eval('${!empty LOGIN_MEMBERINFO}')) {
// 			$(location).attr("href","${pageContext.request.contextPath}/user/freeboard/freeboardView.do?bo_no="+ bo_no
// 					+"&search_keyword="+search_keyword+"&search_keycode="+search_keycode+"&currentpPage="+currentPage);
// 		}else {
// 			alert("로그인 해 주세요");
// 			BootstrapDialog.show({
// 				title:'경고',
// 				message:'로그인 해 주세요.'
// 			});
// 			$(location).attr('href', '${pageContext.request.contextPath}/login/loginForm.do');
// 		}
	});
});

</script>

</html>