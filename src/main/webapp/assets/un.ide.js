


//================================================ 종운================================================

function  compile() {
	console.log("compiling");
	if(document.getElementById("javacode")==""){
		alert("Insert some code please !");
	}
	else{
		//code = maincode
		//classname = class
			var code= encodeURIComponent(javaEditor.getValue());
			var title1= encodeURIComponent(node.title);
//			var path1 = encodeURIComponent("\\" + getPath);
			var path1 = encodeURIComponent(getPath);
//			var code= javaEditor.getValue();
			console.log(code);
			console.log( "타이틀 : " +node.title);
			console.log( "경로 : "+ getPath);
			
			// 경로
//			console.log(getPath);
			// node.title 현재 노드

		$.ajax({
			url : contextPath + "/laonide/Compile.do",
			type: "POST",
			datatype: "text",
			data : { // 파라미터
				code : javaEditor.getValue(),
				className : node.title,
				cpath : getPath
				
			},
			success : function(data) {
				console.log('data ::::: ' + data);
				if(data.indexOf("Compiled Successfully") != -1){
					console.log("런런");
					run();
				}else{
					console.log("실패");
					var data2 = data.replace("\\n", '<br/>');
					console.log(data2);
					
					$("#output").text(data2);
					
				}
				
			},
			error: function (error) {
				console.log(error);
			}
		});

	}
	console.log("compiled !!");
}


function run() {
	
//		var url = "Run?classname=" + document.getElementById("class").value;
		var title1= encodeURIComponent(node.title);
			var path1 = encodeURIComponent(getPath);
			
			$.ajax({
				url : contextPath + "/laonide/Run.do",
				type: "POST",
				datatype: "text",
				data : { // 파라미터
					classname : node.title,
					cpath : getPath
					
				},
				success : function(data) {
// 					console.log(data);
					var data2 = data.replace("\\n", '<br/>');
					console.log(data2);
					$("#output").text(data2);
					
					//오비가 오류발생시 콘솔에 뿌려주기
					if($("input[name='input_obi']").prop('checked')){
						if($("#output").text().includes("Exception")){
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
							 html2	 +=							'<div class="msg_body" style="max-width: 233px;" >';
							 //콘솔 결과창 연동 필요한 부분
							 var cmdResult = $("#output").text();
//							 alert(cmdResult);
							 var first_site = cmdResult.indexOf("(");
	//						 var middle_site = cmdResult.indexOf(".java:");
							 var last_site = cmdResult.indexOf(")");
							 
							 err_site = cmdResult.substring(first_site, last_site+1);
//							 alert(err_site);
	//						 var err_site = "("+ cmdResult.split("(");
								 
							 if(cmdResult.includes("Pointer")){
								 html2	 +=								'<font style="color: red">오류가 발생했습니다.</font><br/>';
								 html2	 +=									'<li><input type="hidden" id="err_name" value="NullPointerException" style="text-decoration: line-through;"/>';
								 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
								 html2	 +=											'NullPointerException' + err_site;
								 html2	 +=										'</a>';
								 html2	 +=									'</li>';
								 html2	 +=									'<br/>';
								 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px;">결함 자동저장</div>';
							 }else if(cmdResult.includes("ArithmeticException")){
								 html2	 +=								'<font style="color: red">오류가 발생했습니다.</font><br/>';
								 html2	 +=									'<li><input type="hidden" id="err_name" value="ArithmeticException" style="text-decoration: line-through;"/>';
								 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
								 html2	 +=											'ArithmeticException' + err_site;
								 html2	 +=										'</a>';
								 html2	 +=									'</li>';
								 html2	 +=									'<br/>';
								 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px;">결함 자동저장</div>';
							 }else if(cmdResult.includes("ArrayIndexOutOfBoundsException")){
								 html2	 +=								'<font style="color: red">오류가 발생했습니다.</font><br/>';
								 html2	 +=									'<li><input type="hidden" id="err_name" value="ArrayIndexOutOfBoundsException" style="text-decoration: line-through;"/>';
								 html2	 +=										'<a onclick="popupOpen();return false;" target="_blank"	>';
								 html2	 +=											'ArrayIndexOutOfBoundsException' + err_site;
								 html2	 +=										'</a>';
								 html2	 +=									'</li>';
								 html2	 +=									'<br/>';
								 html2	 +=									'<div class="button_base b01_simple_rollover" id="btn_autoSave" onclick="err_regist();" style="padding: 5px;">결함 자동저장</div>';
							 }else{
								 html2	 +=								'콘솔을 먼저 실행해주세요~!';
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
								 $("#obi_Container").append(html2);
							 
							 $("#final_span").attr('id','NoID'); 
							 $("#interim_span").attr('id','NoID2');
						}
					}
				},
				error: function (error) {
					console.log(error);
				}
			});

}



function server() {
//		console.log("서버 filefullpath : " + filefullpath);
	var title1= encodeURIComponent(node.title);
//		var path = encodeURIComponent('D:\A_TeachingMaterial\6.JspSpring\eGovFrameDev-3.2.0-64bit');
console.log(pro_link);

			$.ajax({
				url : contextPath + "/laonide/Server.do",
				type: "POST",
				datatype: "text",
				data : { // 파라미터
					classname : node.title,
					cpath : getPath,
					pro_link : pro_link
					
				},
				success : function(data) {
					console.log("야야야양");
					console.log(data);
//					$("#output").text(data);
//					window.open("http://localhost:3030/workspace/LAONIDE/src/main/webapp/"+node.title);
					
				}
				
			});
			console.log(getPath);
//			window.open("http://localhost:3030/"+getPath);
			$("#output").text( "서버가 배포되었습니다. 여기로 접속하세요. " +" http://localhost:3030/"+getPath);
}

function StopServer(){
	console.log("왜 안되");
	$.ajax({
		url : contextPath + "/laonide/StopServer.do",
		type: "POST",
		datatype: "text",
		success : function(data) {
//				$("#output").text(data);
			console.log(data);
		},
		error: function (error) {
			console.log(error);
		}
	});
	$("#output").text("서버가 정지 되었습니다.");
}
var node = $("#tree").fancytree("getActiveNode");

function fn_save(){
	var author = node.data.author;
	
	console.log("저장저장");
	var title = node.title;
	var nno = title.split(".");
	var titleno = 'class ' + nno[0];
	var codetext = javaEditor.getValue();
	
	console.log(node);
	
	if(codetext.indexOf(titleno) == -1){
		var start = codetext.indexOf('class'); // 7
		var end = codetext.indexOf('{'); // 16
		var subtitle = codetext.substring(start+6, end-1);
		console.log(start);
		console.log(end);
		console.log(subtitle);
		
		$.ajax({
			url : contextPath + "/laonide/fancyRename.do",
			type : 'POST',
			datatype: "text",
			data: {
				Name : subtitle +'.'+nno[1],
				path : author,
				orgTitle : title
			},success : function(data2){
				console.log(data2.result);
				var var_rtnFancySrc2 = fn_rtnFancySrc2();
				var var_tree = $("#tree").fancytree("getTree");
				var_tree.reload(var_rtnFancySrc2);
			}
		});
		
		
	}
	
	console.log("저장 경로 : " +author);
	
	
		$.ajax({
			url : contextPath + "/laonide/codeSave.do",
			type: 'POST',
			datatype : 'text',
			data:{
				codesave: javaEditor.getValue(),
				path : author
			},
			success: function(data2){
				var var_rtnFancySrc2 = fn_rtnFancySrc2();
				var var_tree = $("#tree").fancytree("getTree");
				var_tree.reload(var_rtnFancySrc2);
				
			},error: function (error) {
					console.log(error);
			}
			
		});
}
//================================================ 종운================================================
