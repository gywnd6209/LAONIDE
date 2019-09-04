<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table#alramBoardTB{
	border-collapse: separate;
	border-spacing: 0 10px;
}
table#alramBoardTB > tr{ height: 10px; } 

</style>
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
                 <h5><i class="ti-bell"></i>프로젝트 알림</h5>
                 <div class="card-header-right">
                 </div>
             </div>
             <div class="card-block table-border-style">
                 <div>
                     <table id="alramBoardTB">
<!--                          <thead> -->
<!--                              <tr> -->
<!--                                  <th>NO</th> -->
<!--                                  <th>TITLE</th> -->
<!--                              </tr> -->
<!--                          </thead> -->
                         <tbody >
	                         <c:forEach items="${alramboardList }" var="alramboardList">
					            <tr >
					                <td>
										<c:if test="${alramboardList.pri_code eq '0'}">
						                	<img height="15px" src="${pageContext.request.contextPath}/assets/images/priority/Urgency_board.png">
   									    </c:if>
										<c:if test="${alramboardList.pri_code eq '낮음'}">
						                	<img height="15px" src="${pageContext.request.contextPath}/assets/images/priority/Urgency_lowness.png">
   									    </c:if>
										<c:if test="${alramboardList.pri_code eq '보통'}">
						                	<img height="15px" src="${pageContext.request.contextPath}/assets/images/priority/Urgency_usually.png">
   									    </c:if>
										<c:if test="${alramboardList.pri_code eq '긴급'}">
						                	<img height="15px" src="${pageContext.request.contextPath}/assets/images/priority/Urgency_Emergency.png">
   									    </c:if>
					                </td>
					                <td>
						               	<font color="#D36C84"> &nbsp;&nbsp;@${alramboardList.bo_writer}&nbsp;</font>
						               	 님이 새로운 &nbsp;&nbsp;
						               	 
						               	 
										<c:if test="${alramboardList.alram_code eq 'ISSUE'}">
							               	<label class="label " style="background-color: #424C91;"><font size="2pt">이슈</font></label>
   									    </c:if>
   									    <c:if test="${alramboardList.alram_code eq 'ERROR'}">
							               	<label class="label " style="background-color: #D372A4;"><font size="2pt">결함</font></label>
   									    </c:if>
   									    <c:if test="${alramboardList.alram_code eq 'BOARD'}">
							               	<label class="label " style="background-color: #22A598;"><font size="2pt">게시글</font></label>
   									    </c:if>
   									    
						               	<label class="label " style="background-color: #3F4040;"><font size="2pt">"${fn:substring(alramboardList.alram_content, 0, 20)}"</font></label>
						               	 을/를 등록했습니다. 
						               	 <font size="1pt" color="gray">&nbsp;&nbsp;
						               	 <fmt:parseDate value="${alramboardList.alram_date}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						               	 <fmt:formatDate value="${noticePostDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/>
<%-- 						               	 <fmt:formatDate value="${noticePostDate}" type="date" dateStyle="full"/> --%>
						               	 </font>
									</td>
					            </tr>
					         </c:forEach>
                         </tbody>
                     </table>
                 </div>
             </div>
  ${pageHtmls }           
  <br/>
             
         </div>
         <!-- Hover table card end -->
        </div>
        <!-- Page-body end -->
    </div>
</div>
</body>


</html>














