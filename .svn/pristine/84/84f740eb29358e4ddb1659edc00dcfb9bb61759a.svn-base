<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
							<h4>공지사항</h4>
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
											<th scope="col" width="5%" style="text-align: center;">NO</th>
											<th scope="col" width="65%" style="text-align: center;">TITLE</th>
											<th scope="col" width="10%" style="text-align: center;">WRITER</th>
											<th scope="col" width="10%" style="text-align: center;">DATE</th>
											<th scope="col" width="10%" style="text-align: center;">HIT</th>
										</tr>
									</thead>
									<tbody id="noticeTBL">
										<c:if test="${empty noticeList }">
											<tr>
												<td colspan="5" align="center"><font color="red"><em>등록된 공지사항이 없습니다.</em></font></td>
											</tr>
										</c:if>
										<c:if test="${!empty noticeList }">
											<c:forEach items="${noticeList }" var="noticeInfo">
												<tr>
													<td align="center"><input type="hidden" value="${noticeInfo.bo_no }" />${noticeInfo.rnum }</td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noticeInfo.bo_title }</td>
													<td align="center">${noticeInfo.bo_writer }</td>
													<td align="center">${noticeInfo.bo_date }</td>
													<td align="center">${noticeInfo.bo_hit }</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							<div>
								${pageHtmls }
							</div>
							
						</div>
	<div>
		<form name="searchFrm" action="${pageContext.request.contextPath }/admin/notice/noticeList.do" method="post"
			class="form-inline pull-right">
			<select class="form-control" style="height: 40px;" id="search_keycode" name="search_keycode">
				<option>검색조건</option>
				<option value="total" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> &nbsp;&nbsp; <input height="30px" id="search_keyword" name="search_keyword" 
				type="text" placeholder="검색어 입력" class="form-control" /> &nbsp;&nbsp;
			<button type="submit" class="btn btn-info btn-sm">
				<i class="ti-search"></i>&nbsp;검색
			</button>
			&nbsp;&nbsp;
			<c:if test="${!empty LOGIN_ADMININFO}">
				<button id="insert" type="button" class="btn btn-inverse btn-sm" i">
					<i class="ti-pencil-alt"></i>&nbsp;글쓰기
				</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</form>
	</div>
					</div>
					<!-- Hover table card end -->
				</div>
<!-- 				<div> -->
<!-- 					<button type="button" id="insert" class="btn waves-effect waves-light btn-success" style="float: right"> -->
<!-- 						<i class="icofont icofont-check-circled"></i>등록 -->
<!-- 					</button> -->
<!-- 				</div> -->
				<!-- Page-body end -->
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		if(eval('${!empty search_keyword}')){
			$('#search_keyword').val('${search_keyword}');
			var se_code = '${search_keycode}';
			$("#search_keycode").val(se_code).prop("selected", true);
		}
		
		
		$('#noticeTBL tr').click(function() {
			var search_keyword = encodeURIComponent("${search_keyword}");
			var search_keycode = "${search_keycode}";
			var currentPage = "${currentPage}";
			
			var bo_no = $(this).find('td:eq(0)').find('input').val();
			var rnum = $(this).find('td:eq(0)').text();
			
			$(location).attr('href','${pageContext.request.contextPath}/admin/notice/noticeView.do?bo_no='+ bo_no
					+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentpPage='+currentPage);
		});

		$('#insert').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/admin/notice/noticeForm.do');
		});
		
// 		$('form[name=searchFrm]').submit(function(){
// 			$(this).attr('action', '${pageContext.request.contextPath}/admin/notice/noticeList.do'); 
// 		});

	});
</script>

</html>