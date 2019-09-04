/**
 * ide 내 팀원과 채팅을 위한 자바스크립트 부분
 */

function getTimeStamp() {
	var d = new Date();
	var s = leadingZeros(d.getFullYear(), 4) + '-'
			+ leadingZeros(d.getMonth() + 1, 2) + '-'
			+ leadingZeros(d.getDate(), 2) + ' ' +

			leadingZeros(d.getHours(), 2) + ':'
			+ leadingZeros(d.getMinutes(), 2) + ':'
			+ leadingZeros(d.getSeconds(), 2);

	return s;
}

function nick() {
	  document.getElementById('nick').style.opacity = '0';
	}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}


$(function() {
	$("#laon_chat_con").scrollTop($("#laon_chat_con")[0].scrollHeight);
	ws_teamchat.onopen = function() {
	};

	ws_teamchat.onmessage = function(server_msg) {
		
		// json으로 넘어온 객체 처리
		var jsonMsg = JSON.parse(server_msg.data);
		
		var type = jsonMsg.type;
		// 종운
		if(type == 'livecode' && islive){
			var jsonMsg1 = JSON.parse(server_msg.data);
			
//			if(jsonMsg1.Enter == 'true'){
//	            javaEditor.replaceSelection("\n" ,"end");
//				return CodeMirror.Pass;
//			}
			
			javaEditor.getDoc().setValue(jsonMsg1.code);
//			javaEditor.focus();
//			javaEditor.setCursor({line: jsonMsg1.cline, ch: jsonMsg1.cch});
//			javaEditor.replaceRange (jsonMsg1.hl, {line : jsonMsg1.getline, ch : 0}, {line : jsonMsg1.getline, ch : 1000000});
//			console.log("test :" + jsonMsg1.hl);
			
			$('#nick').replaceWith('<div id="nick" style="float: right;"><span class="blink" >' +jsonMsg1.mem_nick +'님이 입력중 </span></div>');
			window.setTimeout(nick, 1000);
			
		}else if(type == 'teamchat'){
			// 은혜
			var chat_cont 		= jsonMsg.chat_cont;
			var msg_mem_id		= jsonMsg.mem_id;
			var msg_mem_nick	= jsonMsg.mem_nick;
			var chat_time 		= jsonMsg.chat_time;
			
//			var pro_link	= jsonMsg.pro_link;
			
			if(msg_mem_id == mem_id){
				var self_html = "<div class='talk row'>"
					+"	<div class='media-body chat_message_content my_message'>"
					+"		<h5 class='media-heading'>"
					+"			<span class='chat_msg_author'></span><span class='chat_msg_time' style='font-size:9pt;'>"+chat_time+"</span>"
					+"		</h5>"
					+"		<div class='cm-s-default triangle-border right'>"
					+"			<div class='continue_message'>"
					+"				<div class='unread_box'>"
					+"					<span class='unread_area badge' style='font-family: &amp; amp;'></span>"
					+"				</div>"
					+"				<div class='msg_body' style='max-width: 250px;  font-size: 10pt;'>"+chat_cont+"</div>"
					+"			</div>"
					+"		</div>"
					+"	</div>"
					+"</div>";
				$('#laon_chat_con').append(self_html);
			}else{
				var other_html ="<div class='talk media'>"
					+"	<div class='media-body chat_message_content other_message'"
					+"		style='padding-left: 15px;'>"
					+"		<h5 class='media-heading left'>"
					+"			<span class='chat_msg_author' style='font-size:9pt;'>"+msg_mem_nick+"</span><span class='chat_msg_time' style='font-size:9pt;'>"+chat_time+"</span>"
					+"		</h5>"
					+"		<div class='cm-s-default triangle-border left'>"
					+"			<div class='continue_message' >"
					+"				<div class='msg_body' style='max-width: 250px;  font-size: 10pt;'>"+chat_cont+"</div>"
					+"				<div class='unread_box'>"
					+"					<span class='unread_area badge' style='font-family: &amp; amp;'></span>"
					+"				</div>"
					+"			</div>"
					+"		</div>"
					+"	</div>"
					+"</div>";
				$('#laon_chat_con').append(other_html);
			}
			$("#laon_chat_con").scrollTop($("#laon_chat_con")[0].scrollHeight);
		}
	};
	

	$("#input_chat_message").on("keypress", function(e) {
		if ((e.keyCode == 10 || e.keyCode == 13)) {
			e.preventDefault();
			
			// 임시 프로링크
//			var tmp_pro = "BWJASK54AR";
			
			var chatmsg = {
				type		: 'teamchat',
				chat_cont 	: $("#input_chat_message").val(),
				mem_id		: mem_id,
				mem_nick	: mem_nick,
//				chat_time 	: new Date(Date.now()).toLocaleString(),
				chat_time 	: getTimeStamp(),
				pro_link	: pro_link
//				pro_link	: tmp_pro
			};
	
			ws_teamchat.send(JSON.stringify(chatmsg));
			$("#input_chat_message").val("");
		}
	});

});

