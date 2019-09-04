<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 목록</title>
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
                 <h4>Q&A게시판</h4>
                 <div class="card-header-right">
                     <ul class="list-unstyled card-option">
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
                                 <th>TITLE</th>
                                 <th>WRITER</th>
                                 <th>DATE</th>
                                 <th>HIT</th>
                             </tr>
                         </thead>
						<tbody id="qaboardTBL">
						
					<c:if test="${empty qaboardList }">
			            <tr>
			               <td colspan ="5" align="center"><font color="red">등록된 글이 없습니다.</font></td>
			            </tr>
			         </c:if>
				
					<c:if test="${!empty qaboardList  }">   
						<c:forEach items="${qaboardList }" var="qaboardInfo">
						
		            	<c:if test="${qaboardInfo.bo_status =='n' and qaboardInfo.bo_depth == '0'}">
							<tr>
								<td><input type="hidden" value="${qaboardInfo.bo_no }" />${qaboardInfo.rnum }</td>
								<td>${qaboardInfo.bo_title }</td>
								<td>${qaboardInfo.bo_writer }</td>
								<td>${fn:substring(qaboardInfo.bo_date,0,10)  }</td>
								<td>${qaboardInfo.bo_hit }</td>
							</tr>
							</c:if>
						</c:forEach>
						
					</c:if>
						</tbody>
                     </table>
                     
                     ${pageHtmls }
                 </div>
             </div>
         </div>
         
        
       <!--검색 시작  -->  

<div>
<!--    <form name="searchFrm" action="" method="post" class="form-inline pull-right"> -->
   <form action="${pageContext.request.contextPath }/user/qaboard/qaboardList.do" method="post" class="form-inline pull-right">
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
      &nbsp;&nbsp;<button id="btn1" type="button" class="btn btn-inverse btn-sm" id=""><i class="ti-pencil-alt"></i>&nbsp;글쓰기</button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </form>
</div>
<br/>



       <!--검색 끝  -->  
         
         <!-- Hover table card end -->
        </div>

    
        <!-- Page-body end -->
    </div>
</div>



</body>
<script type="text/javascript">
$(function(){
	
	
	  if(eval('${!empty search_keyword}')){
	      $('#search_keyword').val('${search_keyword}');
	      var se_code = '${search_keycode}';
	      $("#search_keycode").val(se_code).prop("selected", true);
	   }
	
	
	$('#qaboardTBL tr').click(function(){
		var search_keyword = encodeURIComponent('${search_keyword }');;
     	var search_keycode = '${search_keycode }';
     	var currentPage = '${currentPage }';
     	
		var bo_no 	= $(this).find('td:eq(0)').find('input').val();
		 var bo_title = $(this).find('td:eq(1)').text();
		
		if(bo_title.indexOf("삭제된")>=0){
	    	  alert("삭제된 글입니다.");
	    	  BootstrapDialog.show({
	              title: '경고',
	              message: '삭제된 글입니다.'
	          });
	    	  return true;
	      }
		if(eval('${!empty LOGIN_MEMBERINFO}')){ 
		
			$(location).attr('href', '${pageContext.request.contextPath}/user/qaboard/qaboardView.do?bo_no='+bo_no+'&search_keyword=' + search_keyword 
					  + '&search_keycode=' + search_keycode+ '&currentPage=' + currentPage);
		}else{
      	  alert("로그인해주세요.");
          BootstrapDialog.show({
              title: '경고',
              message: '로그인해주세요.'
          });
          	$(location).attr('href', '${pageContext.request.contextPath }/login/loginForm.do');
    
       }
	});
	
	$('#btn1').click(function(){
		 if(eval('${!empty LOGIN_MEMBERINFO}')){  
			$(location).attr('href', '${pageContext.request.contextPath}/user/qaboard/qaboardForm.do');
		 }else{
	    	   alert("로그인해주세요.");
		         BootstrapDialog.show({
		             title: '경고',
		             message: '로그인해주세요'
		         }); 
	    	   		$(location).attr('href', '${pageContext.request.contextPath }/login/loginForm.do');
	      		}
	});
	
// 	$('#boardRegistBtn').click(function(){
// 		$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do');
// 	});

// 	$('#searchBtn').click(function(){
// 		 $('form[name=searchFrm]').submit(function(){
// 	 $(location).attr('href', '${pageContext.request.contextPath }/user/qaboard/recruitboardForm.do'
//     		  +"?currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}");
// 		    	$(this).attr('action', '${pageContext.request.contextPath}/user/qaboard/qaboardList.do'); 
// 		 });
// 	});
});
</script>

</html>














