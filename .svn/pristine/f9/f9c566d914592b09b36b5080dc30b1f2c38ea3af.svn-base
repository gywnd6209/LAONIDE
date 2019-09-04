/* 음성인식 메서드 */
var searchNode;
var searchGetPath;
var searchAuthor = "";

(function(e, p) {
	var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
	e.id = (m && m[1])
			|| (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p
					.indexOf('Windows') > -1 ? 'win'
					: p.indexOf('Mac') > -1 ? 'mac'
							: p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
	e.className = e.className.replace(/\bno-js\b/, 'js');
})(document.documentElement, window.navigator.userAgent)

//여기서부터 
new gweb.analytics.AutoTrack({
	profile : 'UA-26908291-1'
});



$(function(){
	
	if (!('webkitSpeechRecognition' in window)) {
		upgrade();
	} else {
		var start_button = document.getElementById("start_button");
		start_button.style.display = "inline-block";
		//라온 IDE로
		//var recognition = new webkitSpeechRecognition();
		recognition.continuous = true;
		recognition.interimResults = true;

		recognition.onstart = function() {
			recognizing = true;
			showInfo('info_speak_now');
			
		};

		recognition.onerror = function(event) {
			if (event.error == 'no-speech') {
				showInfo('info_no_speech');
				ignore_onend = true;
			}
			if (event.error == 'audio-capture') {
				showInfo('info_no_microphone');
				ignore_onend = true;
			}
			if (event.error == 'not-allowed') {
				if (event.timeStamp - start_timestamp < 5) {
					showInfo('info_blocked');
				} else {
					showInfo('info_denied');
				}
				ignore_onend = true;
			}
		};

		recognition.onend = function() {
			recognizing = false;
			if (ignore_onend) {
				return;
			}
			if (!final_transcript) {
				showInfo('info_start');
				return;
			}
			showInfo('');
			if (window.getSelection) {
				window.getSelection().removeAllRanges();
				var range = document.createRange();
				range.selectNode(document.getElementById('final_span'));
				window.getSelection().addRange(range);
			}
		};

		recognition.onresult = function(event) {
			var interim_transcript = '';
			if (typeof (event.results) == 'undefined') {
				recognition.onend = null;
				recognition.stop();
				upgrade();
				return;
			}
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					final_transcript += event.results[i][0].transcript;
				} else {
					interim_transcript += event.results[i][0].transcript;
				}
			}
			final_transcript = capitalize(final_transcript);
			final_span.innerHTML = linebreak(final_transcript);
			interim_span.innerHTML = linebreak(interim_transcript);
			if (final_transcript || interim_transcript) {
				showButtons('inline-block');
			}
		};
		
		
		
		
	}
	
	
});
function upgrade() {
	start_button.style.visibility = 'hidden';
	showInfo('info_speak_now');
}

var two_line = /\n\n/g;
var one_line = /\n/g;
function linebreak(s) {
	return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}

var first_char = /\S/;
function capitalize(s) {
	return s.replace(first_char, function(m) {
		return m.toUpperCase();
	});
}

function startButton(event) {
	if (recognizing) {
		recognition.stop();
		return;
	}
	 var final_span = $('#final_span');
	final_transcript = '';
	recognition.lang = 'ko-KR';
	recognition.start();
	ignore_onend = false;
	final_span.innerHTML = '';
	interim_span.innerHTML = '';
//	showInfo('info_start');
	showInfo('info_allow');
	showButtons('none');
	start_timestamp = event.timeStamp;
}

function showInfo(s) {
	if (s) {
		for (var child = info.firstChild; child; child = child.nextSibling) {
			if (child.style) {
				child.style.display = child.id == s ? 'inline' : 'none';
				
				if(s.indexOf('info_speak_now') != -1){
					$("#stop_rec").click(function(){
						recognition.stop();
						showInfo('info_start');
					});
				}
				
			}
		}
		info.style.visibility = 'visible';
	} else {
		info.style.visibility = 'visible';
	}
}

var current_style;

$(function(){
	
/* 오비 토글버튼 작동 부분 */
	
	var obi_check = $("input[name='input_obi']");
	var obi_input = $("#obi_ment");
	
    //오비 컨테이너
    var obi_cont = $("#obi_Container");
    
    //오비 OFF 상태
    var obi_stat = $("#obi_off_status");
    
    var user_ment = "";
    
	obi_check.click(function(){
		
		if($(this).is(":checked") ==  true){
			
			$("#info_start").attr("style", "display:block");
			$(".mic_cont").attr("style", "display:block");
			obi_stat.hide();
//			alert("오비 ON");
			
			 //오비 말 셋팅하기
			 var html = '<br>';
			 html 	 += '<div class="talk media">';
			 html	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
			 html	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
			 html	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
			 html	 +=					'<div class="cm-s-default triangle-border left">';
			 html	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
			 html	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
			 //오비 메세지 출력하기
			 html	 +=						'안녕하세요 :) '+mem_nick+'님';
			 html	 +=						'<br/>';
			 html	 +=						'오비 사용법을 알고싶다면 "매뉴얼"이라는 명령어를 말씀해주세요~';
			 html	 +=						'</div>';
			 html	 +=						'<div class="unread_box">';
			 html	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
			 html	 +=						'</div>';
			 html	 +=					'</div>';
			 html	 +=				'</div>';
			 html	 +=			'</div>';
			 html	 +=	'</div>';
			 obi_cont.append(html);
			 
			 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
		
			
		//checked if 끝 	
		}else{
//			alert("오비 OFF");
			obi_stat.show();
			$("#info_start").attr("style", "display:none");
	         $("#info_speak_now").attr("style", "display:none");
	         $("#info_no_speech").attr("style", "display:none");
	         
			$("#final_span").attr('id','NoID'); 
			$("#interim_span").attr('id','NoID2'); 
		}
	});//오비 ON/OFF 라디오 버튼 클릭했을 경우 
	
	// 결함 자동저장시 필요한 파라미터 자바스크립트 상단에 기재함~~ 
	// pro_code는 연결됐을 때 다시 수정할것!
	
	
	////
	
	 $("#start_button").click(function(){
		 if($("input[name='input_obi']").is(":checked") ==  true){
		 //사용자 채팅 말
		 var html1 = '<div class="talk row">';
		 html1	  +=		'<div class="media-body chat_message_content my_message" value="warble_ee_j4j5zmfwz">';
		 html1	  +=			'<div class="cm-s-default triangle-border right">';
		 html1	  +=				'<div class="continue_message" time="1560492211568" index="13">';
		 html1	  +=					'<div class="unread_box">';
		 html1	  +=						'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
		 html1	  +=					'</div>';
		 //사용 자 음성인식 텍스트 출력 부분
		 html1	  +=					'<div class="msg_body" style="max-width: 233px; font-size: 10pt;">';
		 html1	  +=						'<span class="final" id="final_span"></span>';
		 html1	  +=						'<span class="interim" id="interim_span"></span>';
		 html1	  +=					'</div>';
		 html1	  +=				'</div>';
		 html1	  +=			'</div>';
		 html1	  +=		'</div>';
		 html1	  +=	'</div>';
		 obi_cont.append(html1);
		 
		 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
		 }
		 
	 });
	 
	 //받은 메세지 출력하기
	$("#stop_rec").click(function(){
		 if($("input[name='input_obi']").is(":checked") ==  true){
		user_ment = $("#interim_span").text();
//		alert(user_ment);
		
		if(user_ment != null || user_ment != ""){
			//오류 목록 출력하기
			if(user_ment.includes("오류") || user_ment.includes("결함")){
				//오비 말 셋팅하기
				
				 var html2= '<div class="talk media">';
				 html2	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
				 html2	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
				 html2	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
				 html2	 +=					'<div class="cm-s-default triangle-border left" style="background-color: ">';
				 html2	 +=						'<style type="text/css">';
				 html2	 +=							'.cm-s-default triangle-border.left::after {';
				 html2	 +=								'border-color:#BCA9F5; ';
				 html2	 +=							'}';
				 html2	 +=						'</style> ';
				 html2	 += 					'<div class="continue_message" time="1560492199914"  index="14">';
				 html2	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" >';
				 //콘솔 결과창 연동 필요한 부분
				 var cmdResult = $("#output").text();
//				 alert(cmdResult);
				 var first_site = cmdResult.indexOf("(");
//				 var middle_site = cmdResult.indexOf(".java:");
				 var last_site = cmdResult.indexOf(")");
				 
				 err_site = cmdResult.substring(first_site, last_site+1);
//				 alert(err_site);
//				 var err_site = "("+ cmdResult.split("(");
					 
				 if(cmdResult.includes("Pointer")){
					 html2	 +=								'<font style="color: red; size:10pt;">오류가 발생했습니다.</font><br/>';
					 html2	 +=									'<li><input type="hidden" id="err_name" value="NullPointerException" style="text-decoration: line-through;"/>';
					 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
					 html2	 +=											'NullPointerException' + err_site;
					 html2	 +=										'</a>';
					 html2	 +=									'</li>';
					 html2	 +=									'<br/>';
					 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px; font-size: 10pt;">결함 자동저장</div>';
				 }else if(cmdResult.includes("ArithmeticException")){
					 html2	 +=								'<font style="color: red; size:10pt; ">오류가 발생했습니다.</font><br/>';
					 html2	 +=									'<li><input type="hidden" id="err_name" value="ArithmeticException" style="text-decoration: line-through;"/>';
					 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
					 html2	 +=											'ArithmeticException' + err_site;
					 html2	 +=										'</a>';
					 html2	 +=									'</li>';
					 html2	 +=									'<br/>';
					 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px; font-size: 10pt;">결함 자동저장</div>';
				 }else if(cmdResult.includes("ArrayIndexOutOfBoundsException")){
					 html2	 +=								'<font style="color: red; size:10pt;">오류가 발생했습니다.</font><br/>';
					 html2	 +=									'<li><input type="hidden" id="err_name" value="ArrayIndexOutOfBoundsException" style="text-decoration: line-through;"/>';
					 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
					 html2	 +=											'ArrayIndexOutOfBoundsException' + err_site;
					 html2	 +=										'</a>';
					 html2	 +=									'</li>';
					 html2	 +=									'<br/>';
					 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px; font-size:10pt;">결함 자동저장</div>';
				 }else if(cmdResult.includes("") || cmdResult == null){
					 html2	 +=								'<font style="color: red; size:10pt;">오류를 발견하지 못했어요 T.T</font>';
				 }
					 html2	 +=								'</div>';
				 html2	 +=									'<div class="unread_box">';
				 html2	 +=										'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
				 html2	 +=									'</div>';
				 html2	 +=							'</div>';
				 html2	 +=						'</div>';
				 html2	 +=					'</div>';
				 html2	 +=			   '</div>';
				 html2	 +=	'</div>';
				 obi_cont.append(html2);
				 
				 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
				 
				 $("#final_span").attr('id','NoID'); 
				 $("#interim_span").attr('id','NoID2'); 
				 
				 $("#btn_autoSave").click(function(){
						err_regist();
						
					});
				 
			}else if(user_ment.includes("자동") || user_ment.includes("저장")){
//				alert(pro_code);
				
				var cmdResult = $("#output").text();
				
					//오비 말 셋팅하기
					var html3= '<div class="talk media">';
					html3	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
					html3	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
					html3	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
					html3	 +=					'<div class="cm-s-default triangle-border left">';
					html3	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
					html3	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
					if(cmdResult.includes("Exception")){
						err_regist();
						$("#err_name").attr('id','NoID3'); 
					//오비 메세지 출력하기
						html3	 +=						'결함 저장 완료!!';
					}else{
						html3	 +=						'오류가 발생해야 저장이가능해요 :)';
					}
					html3	 +=						'</div>';
					html3	 +=						'<div class="unread_box">';
					html3	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
					html3	 +=						'</div>';
					html3	 +=					'</div>';
					html3	 +=				'</div>';
					html3	 +=			'</div>';
					html3	 +=	'</div>';
					obi_cont.append(html3);
					
					obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
					
					$("#final_span").attr('id','NoID'); 
					$("#interim_span").attr('id','NoID2');
				
			}else if(user_ment.includes("오비")){
				
				//오비 말 셋팅하기
				 var html3= '<div class="talk media">';
				 html3	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
				 html3	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
				 html3	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
				 html3	 +=					'<div class="cm-s-default triangle-border left">';
				 html3	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
				 html3	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
				 //오비 메세지 출력하기
				 html3	 +=						'안녕하세요 :) 좋은하루예요.';
				 html3	 +=						'</div>';
				 html3	 +=						'<div class="unread_box">';
				 html3	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
				 html3	 +=						'</div>';
				 html3	 +=					'</div>';
				 html3	 +=				'</div>';
				 html3	 +=			'</div>';
				 html3	 +=	'</div>';
				 obi_cont.append(html3);

				 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
				 
				$("#final_span").attr('id','NoID'); 
				$("#interim_span").attr('id','NoID2'); 
				
			}else if(user_ment.includes("우비") || user_ment.includes("호비") || user_ment.includes("포비")){
				
				//오비 말 셋팅하기
				 var html3= '<div class="talk media">';
				 html3	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
				 html3	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
				 html3	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
				 html3	 +=					'<div class="cm-s-default triangle-border left">';
				 html3	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
				 html3	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
				 //오비 메세지 출력하기
				 html3	 +=						'제 이름은 오비예요 T_T';
				 html3	 +=						'</div>';
				 html3	 +=						'<div class="unread_box">';
				 html3	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
				 html3	 +=						'</div>';
				 html3	 +=					'</div>';
				 html3	 +=				'</div>';
				 html3	 +=			'</div>';
				 html3	 +=	'</div>';
				 obi_cont.append(html3);

				 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
				 
				$("#final_span").attr('id','NoID'); 
				$("#interim_span").attr('id','NoID2'); 
			}else if(user_ment.includes("매뉴얼") || user_ment.includes("메뉴얼") || user_ment.includes("메뉴") || user_ment.includes("매뉴")){
				//오비 말 셋팅하기
				 var html3= '<div class="talk media">';
				 html3	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
				 html3	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
				 html3	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
				 html3	 +=					'<div class="cm-s-default triangle-border left">';
				 html3	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
				 html3	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
				 //오비 메세지 출력하기
				 html3   += '■ 오비 매뉴얼(음성으로 말씀해주세요 :D)';
				 html3   += '<br/>';
				 html3   += '- 오류/결함 : 콘솔에 발생한 오류 확인';
				 html3   += '<br/>';
				 html3   += '- 저장/자동 : 결함 저장하기';
				 html3   += '<br/>';
				 html3   += '- 오비      : 인삿말';
				 html3	 +=						'</div>';
				 html3	 +=						'<div class="unread_box">';
				 html3	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
				 html3	 +=						'</div>';
				 html3	 +=					'</div>';
				 html3	 +=				'</div>';
				 html3	 +=			'</div>';
				 html3	 +=	'</div>';
				 obi_cont.append(html3);
				 
				 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
				 
				$("#final_span").attr('id','NoID'); 
				$("#interim_span").attr('id','NoID2'); 
				
			}else{
				
				//오비 말 셋팅하기
				 var html3= '<div class="talk media">';
				 html3	 +=		'<a class="media-left padding-0px" href="#" style="float: left;">';
				 html3	 +=			'<img class="user_profile_image" src="'+ img_obi2 +'"></a>';
				 html3	 +=				'<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
				 html3	 +=					'<div class="cm-s-default triangle-border left">';
				 html3	 +=						'<div class="continue_message" time="1560492199914" index="14" i>';
				 html3	 +=							'<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="obi_ment">';
				 //오비 메세지 출력하기
				 html3	 +=						'다시 한번 말씀해주세요.';
				 html3	 +=						'</div>';
				 html3	 +=						'<div class="unread_box">';
				 html3	 +=							'<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
				 html3	 +=						'</div>';
				 html3	 +=					'</div>';
				 html3	 +=				'</div>';
				 html3	 +=			'</div>';
				 html3	 +=	'</div>';
				 obi_cont.append(html3);

				 obi_cont.scrollTop($("#obi_Container")[0].scrollHeight);
				 
				$("#final_span").attr('id','NoID'); 
				$("#interim_span").attr('id','NoID2'); 
			}
			
			}
		 }
	});
	
	
	
	
}); // $(function(){}끝


function err_regist(){
	
//	alert("저장 메서드");
	
	var err_title = $("#err_name").val() +" "+err_site;
//	alert("결함 저장완료!");
	
//	alert("err_title : "+ err_title);
	
	$.ajax({
		type 		: 'post',
		url 		: contextPath+'/laonide/insErr.do',
		dataType 	: 'json', 
		data 		: { mem_id 		: mem_id,
						err_title  	: err_title,
						err_cont  	: err_title,
						mem_nick 	: mem_nick,
						pro_code  	: pro_code  },
				error : function(result){
					alert(result.status + ' | ' + result.responseText);
					return false;
				},
				success : function(andView){
//					alert(andView.result);
//					obi_exeResult = true;
					$("#btn_autoSave").attr('id','saveComplete'); 
					return true;
				}
		});
	
//	var pro_code = "777";
	
	
}

function popupOpen(){
	
	$("#modal_err").draggable();
	   
	$("#modal_err").attr("style", "display:block");
	   
	$("#modal_err_close").click(function() {
	      $("#modal_err").attr("style", "display:none");
	 });
    
	var err_name = $("#err_name").val();
	
    if($("#find_errName").length != 0){
    	$("#label_errName").remove();
    	$("#label_errSol").remove();
    	$("#errName").remove();
    	$("#errSol").remove();
    }
    
    $.ajax({
		type 		: 'post',
		url 		: contextPath+'/laonide/findErrSol.do',
		dataType 	: 'json', 
		data 		: { err_name 		: err_name  },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
				return false;
			},
			success : function(andView){
//				alert(andView.errName);
				
				var html1 = "<label id='label_errName' class='col-md-3 control-label' style='font-size: 10pt;'>에러명</label><br>"
							+"<label id='errName' class='col-md-9' style='font-size: 13px;color:white;margin-left:10px;margin-top:2px;'>"
							+andView.errName+"</label>";
				var	html2 = "<label id='label_errSol' class='col-md-3 control-label' style='font-size: 10pt;'>해결방법</label><br>"
							+"<label id='errSol' class='col-md-11' style='font-size: 13px;color:white;margin-left:10px;margin-top:2px;'>"
							+andView.errSol+"</label>";
					
				$("#find_errName").append(html1);
				$("#find_errSol").append(html2);
//				$("#find_err").text(andView.errSol);
				
				return true;
			}
	});
    return false;
}

