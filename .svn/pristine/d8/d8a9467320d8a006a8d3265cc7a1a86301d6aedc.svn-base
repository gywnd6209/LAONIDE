<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시판</title>
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
							<h4>FAQ 게시판</h4>
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table id="faqTable" class="table table-hover">
									<thead>
										<tr>
											<th>NO</th>
											<th>TITLE</th>
											<th>WRITER</th>
											<th>DATE</th>
											<th>HIT</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty faqboardList }">
											<tr>
												<td colspan="5" align="center"><font color="red">등록된 글이 없습니다.</font></td>
											</tr>
										</c:if>
										<c:forEach items="${faqboardList }" var="faqboardList">
											<tr>
												<td><input type="hidden" value="${faqboardList.bo_no }">${faqboardList.rnum}</td>
												<td>${faqboardList.bo_que_title }</td>
												<td>${faqboardList.bo_writer }</td>
												<td>${fn:substring(faqboardList.bo_date,0,10) }</td>
												<td>${faqboardList.bo_hit }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								 ${pageHtmls }
								<br/>
								<div>
									<form action="${pageContext.request.contextPath }/user/faqboard/faqList.do" method="post" class="form-inline pull-right">
										<select class="form-control" style="height: 40px;" name="search_keycode">
											<option>검색조건</option>
											<option value="TOTAL" selected="selected">전체</option>
											<option value="QUE_TITLE">질문 제목</option>
											<option value="QUE_CONTENT">질문 내용</option>
											<option value="ANS_CONTENT">답변 내용</option>
										</select>
										&nbsp;&nbsp;
									<input height="30px" id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> &nbsp;&nbsp;
									<button type="submit" class="btn btn-info btn-sm">
										<i class="ti-search"></i>&nbsp;검색
									</button>
									&nbsp;&nbsp;
									<!-- 관리자일때만 활성화하기/관리자 로그인 연동시 추가하기  -->
									<c:if test="${LOGIN_MEMBERINFO.mem_grade eq 'admin' }">
										<button type="button" class="btn btn-inverse btn-sm" id="btn_write">
											<i class="ti-pencil-alt"></i>&nbsp;글쓰기
										</button>
									</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</form>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<!-- Hover table card end -->
				</div>
				<!-- Page-body end -->
			</div>
		</div>
</body>
<script type="text/javascript">
var mem_grade	= '${LOGIN_MEMBERINFO.mem_grade}';

$(function() {
		
	//글쓰기 창으로 전환
	$("#btn_write").click(function() {
		$(location).attr("href","${pageContext.request.contextPath}/user/faqboard/faqForm.do");
	});
		
	//글보기
	$("#faqTable tr").click(function() {
		var bo_no = $(this).find("td:eq(0) input").val();
		$(location).attr("href","${pageContext.request.contextPath}/user/faqboard/faqView.do?bo_no="+ bo_no+"&currentPage=${currentPage}&search_keyword="+encodeURI("${search_keyword}")+"&search_keycode=${search_keycode}");
// 		$(location).attr("href","${pageContext.request.contextPath}/user/faqboard/faqView.do?bo_no="+ bo_no);
	});

});
</script>

</html>














