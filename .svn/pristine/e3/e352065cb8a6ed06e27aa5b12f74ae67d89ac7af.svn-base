<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀원모집 게시판 목록</title>
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
                 <h4>팀원모집 게시판</h4>
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
                                 <th style="text-align: center;">TITLE</th>
                                 <th style="text-align: center;">WRITER</th>
                                 <th style="text-align: center;">DATE</th>
                                 <th style="text-align: center;">HIT</th>
                             </tr>
                         </thead>
			         <tbody id = "boardListTbody">
			         <c:if test="${empty recruitboardList }">
			            <tr>
			               <td colspan ="5" align="center"><font color="red">등록된 글이 없습니다.</font></td>
			            </tr>
			         </c:if>
			         <c:if test="${!empty recruitboardList  }">   
			            <c:forEach items="${recruitboardList }" var="recruitboardInfo">
			            	<tr>
			                  <td align="center"><input type="hidden" value="${recruitboardInfo.bo_no}"/>${recruitboardInfo.rnum}</td>
			                  <td align="left">${recruitboardInfo.bo_title}</td>
			                  <td align="center">${recruitboardInfo.bo_writer}<input type="hidden" value="${recruitboardInfo.mem_id }"></td>
			                  <td align="center">${recruitboardInfo.bo_reg_date}</td>
			                  <td align="center">${recruitboardInfo.bo_hit}</td>
			               </tr>
			             </c:forEach>
			         </c:if>
			         </tbody>
			      </table>
			      ${pageHtmls }
                 </div>
             </div>
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
				<form action="${pageContext.request.contextPath }/user/recruitboard/recruitboardList.do" method="post" class="form-inline pull-right">
					<select class="form-control" style="height: 40px;"
						name="search_keycode" id="search_keycode">
						<option>검색조건</option>
						<option value="TOTAL" selected="selected">전체</option>
				        <option value="TITLE">제목</option>
				        <option value="NICK">작성자 닉네임</option>
				        <option value="ID">작성자 아이디</option>
					</select>
					&nbsp;&nbsp;
					<input height="30px" id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
					&nbsp;&nbsp;<button type="submit" class="btn btn-info btn-sm"><i class="ti-search"></i>&nbsp;검색</button>
					&nbsp;&nbsp;<button  type="button" class="btn btn-inverse btn-sm" id="boardRegistBtn"><i class="ti-pencil-alt"></i>&nbsp;글쓰기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</form>
			</div>

         </div>
         <!-- Hover table card end -->
        </div>
        <!-- Page-body end -->
    </div>
</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	
    $('#boardRegistBtn').click(function(){
    if(eval('${!empty LOGIN_MEMBERINFO}')){  
    	$.ajax({
	         type : 'POST',
	         url : '${pageContext.request.contextPath}/user/recruitboard/pro_count.do',
	         dataType : 'json', 
	         data : { 
	        	 bo_writer : '${LOGIN_MEMBERINFO.mem_id}',
	        	 mem_id : ""
	        	 },
	         error : function(result){
	            alert(result.status + ' | ' + result.responseText);
	         },
	         success : function(andView){
	        	 if(andView.result == "success"){
        		 
	        		 $(location).attr('href', '${pageContext.request.contextPath }/user/recruitboard/recruitboardForm.do'
	        	    		  +"?currentPage=${currentPage}&search_keyword=${search_keyword}&search_keycode=${search_keycode}");
	        		 
	        	 }else{
	        		 alert(andView.result);
	        		 return;
	        	 }		   
	         }
	      });
    	
       }else{
    	   alert("로그인해주세요.");
    	   $(location).attr('href', '${pageContext.request.contextPath }/login/loginForm.do');
      	}
   }); 
    
   $('#boardListTbody tr').click(function(){
	  var bo_title = $(this).find('td:eq(1)').text();
	 
      var bo_no = $(this).find('td:eq(0)').find('input').val();
      var rnum = $(this).find('td:eq(0)').text();
    	  
       if(eval('${!empty LOGIN_MEMBERINFO}')){ 
            $(location).attr('href', '${pageContext.request.contextPath}/user/recruitboard/recruitboardView.do?bo_no=' + bo_no+'&rnum='+rnum
            								+"&currentPage=${currentPage}&search_keyword=" + encodeURI('${search_keyword}') + "&search_keycode=${search_keycode}");
          }else{
        	  alert("로그인해주세요.");
            	$(location).attr('href', '${pageContext.request.contextPath }/login/loginForm.do');
      
         }
          
      });
      
});
</script>
</html>














