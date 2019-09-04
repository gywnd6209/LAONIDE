<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
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
							<h4>자료실</h4>
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>NO</th>
											<th>TITLE</th>
											<th>WRITER</th>
											<th>DATE</th>
											<th>HIT</th>
										</tr>
									</thead>
									<tbody id="libararyTable">
										<c:if test="${empty libraryList }">
											<tr>
												<td colspan="5" align="center"><font color="red">등록된 글이 없습니다.</font></td>
											</tr>
										</c:if>
										<c:if test="${!empty libraryList }">
											<c:forEach items="${libraryList }" var="libraryList">
												<tr>
													<td><input type="hidden" value="${libraryList.bo_no }">${libraryList.rnum}</td>
													<td>${libraryList.bo_title }</td>
													<td>${libraryList.bo_writer }</td>
													<td>${fn:substring(libraryList.bo_date,0,10) }</td>
													<td>${libraryList.bo_hit }</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								 ${pageHtmls }
								<br/>
								<div>
									<form action="${pageContext.request.contextPath }/user/library/libraryList.do" method="post" class="form-inline pull-right">
										<select class="form-control" style="height: 40px;" name="search_keycode">
											<option>검색조건</option>
											<option value="TOTAL" selected="selected">전체</option>
											<option value="TITLE">제목</option>
											<option value="CONTENT">내용</option>
											<option value="WRITER">작성자</option>
										</select>
										&nbsp;&nbsp;
									<input height="30px" id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> &nbsp;&nbsp;
									<button type="submit" class="btn btn-info btn-sm">
										<i class="ti-search"></i>&nbsp;검색
									</button>
									&nbsp;&nbsp;
									<c:if test="${!empty LOGIN_MEMBERINFO }">
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
$(function() {
		
	//글쓰기 창으로 전환
	$("#btn_write").click(function() {
		if(eval('${!empty LOGIN_MEMBERINFO}')){
			$(location).attr("href","${pageContext.request.contextPath}/user/library/libraryForm.do");
		}else{
			alert('로그인을 하셔야 글쓰기가 가능합니다!');
		}
	});
		
	//글보기
	$("#libararyTable tr").click(function() {
		var bo_no = $(this).find("td:eq(0) input").val();
		$(location).attr("href","${pageContext.request.contextPath}/user/library/libraryView.do?bo_no="+ bo_no +"&currentPage=${currentPage}&search_keyword="+encodeURI("${search_keyword}")+"&search_keycode=${search_keycode}");
	});

});
</script>

</html>














