<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온IDE 오늘 하루도 화이팅♥</title>
<script type="text/javascript">

//팀장일 경우

// var mem_nick 	= '${LOGIN_MEMBERINFO.mem_nick}';

$(function(){
	
	if(eval('${!empty param.message}')){
		alert('${param.message}');
	}
	
	var sel_memId   = ""; //PL 지정하기
	var sel_memNick = "";
	var pro_link 	= $("input[name=pro_link]").val();
	var crew_grade  = "";
	var join_date  = "";
	
	var rowData = new Array();
	var tdArr = new Array();
	var checkbox = $("input[name=ch_memId]:checked");
	
	function selectDelRow_nick() {
		var chk = document.getElementsByName("ch_memId"); // 체크박스객체를 담는다
		var ch_nick = document.getElementsByName("ch_memNick"); // 댓글 닉네임 모두 담기
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';          //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;                 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCnt++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = ch_nick[i].value;
			if(checkCnt == 1){            	//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
			}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
		  }
			return rowid;   //'value1', 'value2', 'value3' 의 형태로 출력된다.
		}
	
	//선택된 회원 아이디 가져오기
	$("input[name=ch_memId]").change(function(){
		for(var i=0; i<$("input[name=ch_memId]").length;i++){
			if($("input[name=ch_memId]")[i].checked == true){  //체크가 되어있는 값 구분
				sel_memId = $("input[name=ch_memId]")[i].value;
			}
		}
		
		// 체크된 체크박스 값을 가져온다
		$("input[name=ch_memId]:checked").each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = $("input[name=ch_memId]:checked").parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			sel_memNick = td.eq(1).text();
			crew_grade  = td.eq(2).text();
			join_date   = td.eq(3).text();
			
			// 가져온 값을 배열에 담는다.
			tdArr.push(sel_memNick);
			tdArr.push(crew_grade);
			tdArr.push(join_date);
			
		});
    });
	
	var chk = document.getElementsByName("ch_memId"); // 체크박스객체를 담는다
	var len = chk.length;    //체크박스의 전체 개수
	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
	var checkCnt = 0;        //체크된 체크박스의 개수
	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';          //체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0;                 
		
	var checkCntCrew = 0;        //선택된 회원 수
	var checkCntGrade = 0;        //선택된 회원 직책 지정
	var checkCntPL = 0;          //선택된 PL
	
	//선택된 회원 아이디 가져오기
	function selectID() {

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCnt++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = chk[i].value;
			if(checkCnt == 1){            	//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
			}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
		 }
			return rowid;   //'value1', 'value2', 'value3' 의 형태로 출력된다.
			
	}//selectDelRow() 끝
	
	//팀원 제거하기
	$('#btn_delTeamwon').click(function() {
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCntCrew++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 
		
		if(crew_grade != 'PL'){
			if(checkCntCrew > 0){
				var url 	= '${pageContext.request.contextPath }/user/issuetracker/crew/crewChange.do?mem_id='+ selectID()
							   + '&pro_code=${pro_code}';
				var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
				  			  'resizable=no, copyhistory=no, width=400px, height=200px';
				window.open(url, '잘가요..T_T', options);
				checkCntCrew = 0;
			}else{
				alert("제거할 팀원을 체크해주세요!");
				checkCntCrew = 0;
				return;
			}
			
		}else{
			alert("본인을 팀원에서 제거할 수 없어요!");
			checkCntCrew = 0;
			return;
		}
		
	});
	
	//PL 위임하기
	$('#btn_PLteamwon').click(function() {
		
		alert("PL을 지정하실 경우, 마지막으로 체크한 사람만 지정됩니다!");
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCntPL++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 
		
		if(crew_grade != 'PL'){
			if(checkCntPL > 0){
				var url 	= '${pageContext.request.contextPath }/user/issuetracker/crew/crewPLChange.do?mem_id='+sel_memId
							   +'&mem_nick=' + sel_memNick + '&pro_code=${pro_code}';
		// 					   프로젝트 코드 세션? 또는 어떤방식으로 넣어주기.. + pro_code;
				var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
							  'resizable=no, copyhistory=no, width=400px, height=200px';
				window.open(url, '우리 팀장', options);
				checkCntPL = 0;
			}else{
				alert("팀원을 체크해주세요!");
				checkCntPL = 0;
				return;
			}
		}else{
			alert("이미 PL로 지정되어있어요.");
			checkCntPL = 0;
			return;
		}
		
	});
	
	//직책 지정하기
	$('#btn_updateTeamwon').click(function() {
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){	
				checkCntGrade++;        //체크된 체크박스의 개수		
				checkLast = i;     //체크된 체크박스의 인덱스	
			}
		} 
		
		if(checkCntGrade > 0){
			if(checkCntGrade == 1){
				var url 	= '${pageContext.request.contextPath }/user/issuetracker/crew/crewUpdate.do?mem_id='+sel_memId
							   + '&mem_nick=' + selectDelRow_nick() + '&pro_code=${pro_code}';
				var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
							  'resizable=no, copyhistory=no, width=500px, height=260px';
				window.open(url, '', options);
				checkCntGrade = 0;
			}else{
				alert("팀원은 한명만 선택해주세요.");
				checkCntGrade = 0;
				return;
			}
		}else{
			alert("팀원을 체크해주세요!");
			checkCntGrade = 0;
			return;
		}
		
	});
	
	//초대하기
	$('#btn_invite').click(function() {
		var url 	= '${pageContext.request.contextPath }/user/issuetracker/crew/popLink.do?pro_link='+pro_link+'&pro_code=${pro_code}';
		var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
					  'resizable=no, copyhistory=no, width=500px, height=270px';
		window.open(url, '우리 팀장', options);
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
							<h4>팀원관리 <i class="ti-user"></i></h4>
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table id="crewInfoTable" class="table table-hover">
									<thead >
										<tr >
											<th>선택</th>
											<th>닉네임</th>
											<th>직책</th>
											<th>합류날짜</th>
										</tr>
									</thead>
									<tbody>
									<!--로그인한 멤버가 본인일 경우 체크박스 해제  -->
										<c:if test="${!empty crewList }">
											<c:forEach items="${crewList }" var="crewList">
												<tr>
													<td><input name="ch_memId" type="checkbox" value="${crewList.mem_id }"/></td>
														<td><input name="ch_memNick" type="hidden" value="${crewList.mem_nick }"/>${crewList.mem_nick }
															<c:if test="${crewList.grand_code eq 'PL' }">
																<label class="label label-danger">팀장</label>
															</c:if>
														</td>
													<td><input name="ch_grade" type="hidden" value="${crewList.grand_code }"/>${crewList.grand_code }</td>
													<td>${fn:substring(crewList.team_join_date,0,10) }</td>
													<input name="pro_link" type="hidden" value="${crewList.pro_link }"/>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<br/>
								<div align="right">
								<!-- 팀장일 경우에만 제거, 위임 버튼 출력하기 -->
								<!-- 로그인한 살마이 PL인사람....... -->
									<c:forEach items="${crewList }" var="crewList">
										<c:if test="${crewList.grand_code eq 'PL'}">
											<c:if test="${crewList.mem_id eq LOGIN_MEMBERINFO.mem_id }">
												<button id="btn_updateTeamwon" type="button" class="btn btn-inverse btn-sm" ><i class="ti-hand-point-up"></i>직책</button>
												<button id="btn_delTeamwon" type="button" class="btn btn-inverse btn-sm" ><i class="ti-cut"></i>제거</button>
												<button id="btn_PLteamwon"  type="button" class="btn btn-inverse btn-sm" ><i class="ti-stamp"></i>위임</button>
											</c:if>
										</c:if>
										
									</c:forEach>
									<button id="btn_invite" class="btn btn-inverse btn-sm" type="button"><i class="ti-link"></i>프로젝트 초대코드</button>
								</div>
								<br/>
								<div>
								</div>
								<br/>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- div page-wrapper 태그 끝-->
		</div>
		<!-- div main-body 태그 끝 -->
		</div>
		<!-- div pcoded-inner-content 태그 끝 -->
</body>
<script type="text/javascript">
$(function() {
		
	//글보기
	$("#crewInfoTable tr").click(function() {
// 		var bo_no = $(this).find("td:eq(0) input").val();
// 		$(location).attr("href","${pageContext.request.contextPath}/user/library/libraryView.do?bo_no="+ bo_no +"&currentPage=${currentPage}&search_keyword=' + encodeURI('${search_keyword}')+'&search_keycode=${search_keycode}");
	});
	
});
</script>

</html>














