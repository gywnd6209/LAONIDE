<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LAON IDE ::프로젝트 이슈트래커::</title>

<!-- <script type ='text/javascript' src='http://code.jquery.com/jquery-latest.js'></scrsipt> -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/fullcalendar.min.css" />
<link type='text/css' rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/vendor/css/select2.min.css' />
<link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/vendor/css/bootstrap-datetimepicker.min.css' />

<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/vendor/css/main.css' />
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"> --%>



</head>
<body>
<div width="100%" class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">닫기</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
<!--                             <div class="col-xs-12"> -->
<!--                                 <label class="col-xs-4" for="edit-allDay">하루종일</label> -->
<!--                                 <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label> -->
<!--                             </div> -->
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작일</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">마감일</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="일정등록">일정등록</option>
<!--                                     <option value="이슈">이슈</option> -->
<!--                                     <option value="결함">결함</option> -->
<!--                                     <option value="카테고리4">카테고리4</option> -->
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="일정등록">일정</option>
                            <option value="이슈">이슈</option>
                            <option value="결함">결함</option>
<!--                             <option value="카테고리2">카테고리2</option> -->
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                    		<input type="hidden" id="pro_code" value="${param.pro_code }"/>
                    		<input type="hidden" id="pro_name" value="${param.pro_name }"/>
                       	<c:forEach items="${crewList }" var="crewList">
	                        <label class="checkbox-inline">
	                        	<input id="mem_list" class='filter' type="checkbox" value="${crewList.mem_id }" checked>${crewList.mem_nick }
	                        </label>
	                     </c:forEach>
<!--                         <label class="checkbox-inline"><input id="mem_nick" class='filter' type="checkbox" -->
<!-- 	                        	 value="a001" checked>a001</label> -->
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

			
<%-- 	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/jquery.min.js"></script> --%>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.min.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/moment.min.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/fullcalendar.min.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/ko.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/select2.min.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/event/main.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/event/addEvent.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/event/editEvent.js"></script>
	<script type ='text/javascript' src="${pageContext.request.contextPath}/assets/vendor/event/etcSetting.js"></script>
</body>

<script type="text/javascript">

</script>

</html>