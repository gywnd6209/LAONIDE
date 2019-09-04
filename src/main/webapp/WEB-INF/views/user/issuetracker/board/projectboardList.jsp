<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript">
$(function () {
	$('#proboardRegiBtn').click(function() {
		if(eval('${!empty LOGIN_MEMBERINFO}')){
			$(location).attr('href','${pageContext.request.contextPath }/user/issuetracker/board/projectboardForm.do'
					 +'?currentPage=${currentPage}&pro_code=${pro_code}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}&pro_name=${param.pro_name }');
		}else{
			alert('로그인을 하셔야 글쓰기가 가능합니다!');
		}
	});
	
	$('#projectboardTBL tr').click(function(){
		var bo_no 	= $(this).find('#bo_no').val();
		var rnum 	= $(this).find('#rnum').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/issuetracker/board/projectboardView.do?bo_no='+bo_no+'&rnum='+rnum
				+'&currentPage=${currentPage}&pro_code=${pro_code}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}&pro_name=${param.pro_name }');
	});
	
});
</script>
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
                 <h4>우리팀 자유게시판</h4>
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
                             </tr>
                         </thead>
                         <tbody id="projectboardTBL">
	                         <c:forEach items="${projectboardList }" var="projectboardList">
					            <tr>
					               <td><input type="hidden" id="bo_no" value="${projectboardList.bo_no }">
					               		<input type="hidden" id="rnum" value="${projectboardList.rnum }">
					               		${projectboardList.rnum }</td>
					               <td style="width: 450px;">
					               	<pre style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">${projectboardList.bo_title }</pre>
					               </td>
					               <td>${projectboardList.bo_writer }</td>
					               <td>${fn:substring(projectboardList.bo_date,0, 10) }</td>
					            </tr>
					         </c:forEach>
                         </tbody>
                     </table>
                 </div>
             </div>
  ${pageHtmls }           
             <!-- 검색시작 -->
<script type="text/javascript">
$(function(){
	if(eval('${!empty search_keyword}')){
		$('#search_keyword').val('${search_keyword}');
		var se_code = '${search_keycode}';
		$("#search_keycode").val(se_code).prop("selected", true);
	}
	
	
}); 
</script>            
<div style="margin-left: auto;">
	<form action="${pageContext.request.contextPath }/user/issuetracker/board/projectboardList.do?pro_code=${pro_code}&pro_name=${param.pro_name }" method="post" class="form-inline pull-right">
		<select class="form-control" style="height: 40px;"
			name="search_keycode" id="search_keycode">
			<option>검색조건</option>
			<option value="TOTAL" selected="selected">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
		&nbsp;&nbsp;
		<input height="30px" id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		&nbsp;&nbsp;<button type="submit" class="btn btn-info btn-sm"><i class="ti-search"></i>&nbsp;검색</button>
		&nbsp;&nbsp;<button  type="button" class="btn btn-inverse btn-sm" id="proboardRegiBtn"><i class="ti-pencil-alt"></i>&nbsp;글쓰기</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</form>
</div>
<br/>

             <!-- 검색끝 -->
             
         </div>
         <!-- Hover table card end -->
        </div>
        <!-- Page-body end -->
    </div>
</div>
</body>


</html>














