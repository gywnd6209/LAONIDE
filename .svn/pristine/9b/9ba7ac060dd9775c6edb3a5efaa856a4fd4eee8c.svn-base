<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결함관리 게시판 목록</title>
<script type="text/javascript">
$(function () {
	$('#errboardRegiBtn').click(function() {
		if(eval('${!empty LOGIN_MEMBERINFO}')){
			$(location).attr('href','${pageContext.request.contextPath }/user/issuetracker/errboard/errboardForm.do'
					 +'?currentPage=${currentPage}&pro_code=${pro_code}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}&pro_name=${param.pro_name }');
		}else{
			alert('로그인을 하셔야 글쓰기가 가능합니다!');
		}
	});
	
	$('#errboardTBL tr').click(function(){
		var err_no 	= $(this).find('#err_no').val();
		var rnum 	= $(this).find('#rnum').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/issuetracker/errboard/errboardView.do?err_no='+err_no+'&rnum='+rnum
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
                 <h4>결함관리</h4>
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
                                 <th style="text-align: center;">NO</th>
                                 <th style="text-align: center;">PRIORITY</th>
                                 <th style="text-align: center;">TITLE</th>
                                 <th style="text-align: center;">WRITER</th>
                                 <th style="text-align: center;">MANAGER</th>
                                 <th style="text-align: center;">DATE</th>
                                 <th style="text-align: center;">COMPLETED</th>
                             </tr>
                         </thead>
                         <tbody id="errboardTBL">
                         	 <c:if test="${!empty errboardList }">
		                         <c:forEach items="${errboardList }" var="errboardList">
						            <tr style="text-align: center;">
						               <td><input type="hidden" id="err_no" value="${errboardList.err_no }">
						               		<input type="hidden" id="rnum" value="${errboardList.rnum }">
						               		${errboardList.rnum }</td>
							              <c:if test="${errboardList.err_rank eq '낮음'}">
							               <td><img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_lowness.png" style="height: 20px"></td>
							              </c:if>
							              <c:if test="${errboardList.err_rank eq '보통'}">
							               <td><img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_usually.png" style="height: 20px"></td>
							              </c:if>
							              <c:if test="${errboardList.err_rank eq '긴급'}">
							               <td><img src="${pageContext.request.contextPath }/assets/images/priority/Urgency_Emergency.png" style="height: 20px"></td>
							              </c:if>
						               <td>${errboardList.err_title }</td>
						               <td>${errboardList.err_writer }</td>
						               <td>${errboardList.err_manager }</td>
						               <td>${fn:substring(errboardList.err_reg_date,0, 10) }</td>
						               <td>${errboardList.err_end_ok }</td>
						            </tr>
						         </c:forEach>
					         </c:if>
					         <c:if test="${empty errboardList }">
					         		<tr>
						               <td></td>
						               <td><font style="color: red">등록된 결함이 없습니다.</font></td>
						            </tr>
					         </c:if>
                         </tbody>
                     </table>
                 </div>
             </div>
             <div style="margin-left: 40px">
                 <font size="2">
	                 <label>우선순위 :</label>
	                 <img height="15px" src="${pageContext.request.contextPath }/assets/images/priority/Urgency_lowness.png">
	                 <label>낮음</label>&nbsp;&nbsp;/&nbsp;&nbsp;
	                 <img height="15px" src="${pageContext.request.contextPath }/assets/images/priority/Urgency_usually.png">
	                 <label>보통</label>&nbsp;&nbsp;/&nbsp;&nbsp;
	                 <img height="15px" src="${pageContext.request.contextPath }/assets/images/priority/Urgency_Emergency.png">
	                 <label>긴급</label>
                 </font>
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
	<form action="${pageContext.request.contextPath }/user/issuetracker/errboard/errboardList.do?pro_code=${pro_code}&pro_name=${param.pro_name }" method="post" class="form-inline pull-right">
		<select class="form-control" style="height: 40px;"
			name="search_keycode" id="search_keycode">
			<option>검색조건</option>
			<option value="TOTAL" selected="selected">전체</option>
			<option value="TITLE">제목</option>
			<option value="WRITER">작성자</option>
			<option value="MANAGER">담당자</option>
			<option value="PRIORITY">우선순위</option>
			<option value="COMPLETED">완료여부</option>
		</select>
		&nbsp;&nbsp;
		<input height="30px" id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		&nbsp;&nbsp;<button type="submit" class="btn btn-info btn-sm"><i class="ti-search"></i>&nbsp;검색</button>
		&nbsp;&nbsp;<button  type="button" class="btn btn-inverse btn-sm" id="errboardRegiBtn"><i class="ti-pencil-alt"></i>&nbsp;글쓰기</button>
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














