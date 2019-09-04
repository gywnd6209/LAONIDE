<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google" value="notranslate" />
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#467dc6">
<!-- 혜영 음성API-->
<meta content="initial-scale=1, minimum-scale=1, width=device-width" name="viewport">
<meta content="Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier." name="description">

<title>:: 코딩을 즐겁게! LAONIDE ::</title>
<style>
 .CodeMirror { 
 	font-size: 16px;
 } 
</style>
<style type="text/css">

/*
	컨트롤러  : /java/kr/or/ddit/laonide/controller/LaonIDEController.java
	진입 주소 : localhost/laonide/laonide.do

*/

/* 상단 버튼 색 지정*/
.btn-default {
	background-color: #151515;
}

/* 코비오비 토글버튼 */
.switch {
  position: relative;
  display: inline-block;
  width: 28px;
  height: 16px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider, .slider_cobi, .slider_livecode {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before, .slider_cobi:before, .slider_livecode:before {
  position: absolute;
  content: "";
  height: 11px;
  width: 11px;
  left: 2px;
  bottom: 0px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #B870CC;
}

input:focus + .slider {
  box-shadow: 0 0 1px #B870CC;
}

input:checked + .slider_cobi {
  background-color: #F6C104;
}

input:focus + .slider_cobi {
  box-shadow: 0 0 1px #F6C104;
}

input:checked + .slider_livecode {
  background-color: #33FF33;
}

input:focus + .slider_livecode {
  box-shadow: 0 0 1px #CC0000;
}


input:checked + .slider:before, input:checked + .slider_cobi:before, input:checked + .slider_livecode:before{
  -webkit-transform: translateX(16px);
  -ms-transform: translateX(16px);
  transform: translateX(16px);
}

.slider.round, .slider_cobi.round, .slider_livecode.round {
  border-radius: 24px;
}

.slider.round:before, .slider_cobi.round:before, .slider_livecode.round:before  {
  border-radius: 50%;
}

/* 우클릭 */
.ui-menu { 
 	width: 180px; 
 	font-size: 63%; 
} 
.ui-menu kbd { /* Keyboard shortcuts for ui-contextmenu titles */ 
 	float: right; 
} 
#nick {
  opacity: 1;
  transition: 1s opacity;
  text-align: center;
	color: white;
}
.fancytree-edit-input{
	color: black;
}

/* 오비 코비 마이크 플레이부분  고정시키기*/
.mic_cont, .mic_cont_cobi{
	position:fixed;
	z-index:1200;
	background-color: black !important;
    border: 1px solid black !important;
    margin: -2px;
    margin-left: 1px;
    display: none;
}
.ai_span_cont{
	display:inline-block;
	width:360px;
}
</style>

<!-- 주의 : 필요한 스타일 시트, js는 가장 아래부터 추가할 것, .js는 body 하단에 있음. 추가하고 기능 이상해지지 않는지 메뉴, 우클릭, 탭화면 눌러가며 확인할 것
	html 내 주석은 쓸 수도 있는 코드라 지우지 않음.-->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/font/font.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/lib/codemirror.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/addon/hint/show-hint.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/addon/tern/tern.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/addon/merge/merge.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/addon/fold/foldgutter.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/codemirror/addon/dialog/dialog.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap-formhelpers.min.css" />
	
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap-dark.css"
	attr="theme_css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap-tour.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/com.jqueryui.code/themes/default/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/com.jqueryui.code/jquery-ui-1.10.3.custom.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/xterm/xterm.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/com.jqueryui.code/jquery.Jcrop.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/gitgraphjs/gitgraph.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/com.jquery.code/plugins/jquery.treetable.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/com.jquery.code/plugins/jquery.treetable.theme.goorm.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/github_markdown.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/fonticon/grm-icon.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/goorm-common.css"
	attr="theme_css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/goorm-dark.css"
	attr="theme_css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/lib/codemirror/theme/darcula.css">
<!-- 팬시트리 -->
<link href="${pageContext.request.contextPath}/assets/fancytree/src/skin-win8/ui.fancytree.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/fancytree/lib/prettify.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/fancytree/demo/sample.css" rel="stylesheet">
<!-- 혜영 음성 API-->
<link href="https://plus.google.com/100585555255542998765" rel="publisher">
<link href="//www.google.com/images/icons/product/chrome-32.png" rel="icon" type="image/ico">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">
<link href="/intl/en/chrome/assets/common/css/chrome.min.css" rel="stylesheet">
<style id="custom_stylesheet" type="text/css"></style>



<!-- 위로 옮겨보는 중 -->
 
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/lib/codemirror.js"></script>
	
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/addon/hint/show-hint.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/clike/clike.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/js.progressbar.code/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/gitgraphjs/gitgraph.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/addon/prettier/lib/prettier.1.6.1.ie11.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/addon/prettier/lib/js-beautify.1.7.5.js"></script>
<script src='${pageContext.request.contextPath}/assets/goorm.min.js?v=1561122801'></script>
<script src="${pageContext.request.contextPath}/assets/lib/codemirror/addon/lint/dep/jshint.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/xterm/xterm.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/yaml/yaml.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/smoothie/smoothie.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/fuzzaldrin-plus/fuzzaldrin-plus.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/diff/diff.min.js"></script>
<script src='${pageContext.request.contextPath}/assets/lib/google_analytics/trace.js?v=1561122801'></script>

<!-- 팬시트리 -->
	
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.dnd5.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.edit.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.grid.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.gridnav.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/src/jquery.fancytree.table.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/lib/prettify.js"></script>
<script src="${pageContext.request.contextPath}/assets/fancytree/demo/sample.js"></script>
	
<script type="text/javascript">
/* 전역변수부분 */
var contextPath = '${pageContext.request.contextPath}';
var pro_link 	= '${param.pro_link}';
var pro_code 	= '${param.pro_code}';
var mem_id   	= '${LOGIN_MEMBERINFO.mem_id}';
var mem_nick 	= '${LOGIN_MEMBERINFO.mem_nick}';
/* 음성 API 전역변수 */
var final_transcript = '';
var recognizing = false;
var ignore_onend;
var start_timestamp;
var recognition = new webkitSpeechRecognition();
var img_obi1 = '${pageContext.request.contextPath}/assets/images/AI/obiwaiting.png';
var img_obi2 = '${pageContext.request.contextPath}/assets/images/AI/OBI.PNG';
/*은지 코비 음성API 전역변수*/
var final_transcript_cobi = '';
var recognizing_cobi = false;
var ignore_onend_cobi;
var start_timestamp_cobi;
var recognition_cobi = new webkitSpeechRecognition();
var cobi_img = "${pageContext.request.contextPath}/assets/images/AI/cobi.jpg";

/* 은혜 팀원간 채팅을 위한 웹소켓 선언 */
// var ws_teamchat = new WebSocket("ws://192.168.201.43/${pageContext.request.contextPath}/chatting");
var ws_teamchat = new WebSocket("ws://localhost/${pageContext.request.contextPath}/chatting");
var javaEditor;

/* 종운  */
var islive = false;
</script>
<!-- 혜영 음성 API-->
<script src="http://www.google.com/js/gweb/analytics/autotrack.js"></script>
<script src="http://www.google.com/intl/en/chrome/assets/common/js/chrome.min.js"></script>
<!-- 우클릭 -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.ui-contextmenu.js"></script>
<!-- 은혜부분 js -->
<script src="${pageContext.request.contextPath}/assets/fancytree/projectex.fancy.js"></script>
<script src="${pageContext.request.contextPath}/assets/eun.ide.js"></script>
<script src="${pageContext.request.contextPath}/assets/eun.ide.chat.js"></script>
<!-- 은지부분js -->
<script src="${pageContext.request.contextPath}/assets/ji.ide.js"></script>
<!-- 혜영 js -->
<script src="${pageContext.request.contextPath}/assets/young_ide.js"></script>
<!-- 종운 js -->
<script src="${pageContext.request.contextPath}/assets/un.ide.js"></script>

<!-- 혜영 음성 API-->
<script>

var chrmMenuBar = new chrm.ui.MenuBar();
	chrmMenuBar.decorate('nav');
var chrmLogo = new chrm.ui.Logo('logo');
var chrmscroll = new chrm.ui.SmoothScroll('scroll');
    chrmscroll.init();

  window.___gcfg = { lang: 'en' };
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript';
    po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();

      var doubleTracker = new gweb.analytics.DoubleTrack('floodlight', {
          src: 2542116,
          type: 'clien612',
          cat: 'chrom0'
      });
      doubleTracker.track();

      doubleTracker.trackClass('doubletrack', true);
</script>
<!-- 카카오 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
/* 로그아웃을 위한 펑션추가 */
function fn_logout() {
	
	Kakao.init("987ca50780e720d7d11572130e47bfed");
	
	if('${LOGIN_MEMBERINFO.mem_pass}' == null){
		Kakao.Auth.logout();
		$(location).attr('href', '${pageContext.request.contextPath }/login/logout.do');
	}else{
		$(location).attr('href', '${pageContext.request.contextPath }/login/logout.do');
	}
	
}
$(function(){	
	
	var codelive_check = $("input[name='input_livecode']");
	
	codelive_check.click(function(){
			if($(this).prop('checked')){
// 				alert('실시간 코딩 on');
				islive = true;
			}else{
// 				alert('실시간 코딩 off');
				islive = false;
			}
	});
	
	var Enter='false';
	var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;

	CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
	
	javaEditor = CodeMirror.fromTextArea(document.getElementById("javacode"), {
	  lineNumbers: true,
	  matchBrackets: true,
	  mode: "text/x-java",
	  keyMap: "sublime",           // 괄호강조
	  theme: "darcula",            // 테마
	  tabSize: 2,                  // 탭키 간격
	  lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
	  highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true}, // 같은단어강조
	  extraKeys: {
		    "Ctrl-S": function(instance) { 
		     fn_save();
		     
		    }
// 	  ,
// 	          "Enter": function(e){
// 	              console.log(e);
// 	              Enter = 'true';
// 	              javaEditor.replaceSelection("\n" ,"end");
// 	           }
		  }  
	});
	
	var movedByMouse = false;
	javaEditor.on("keydown", function () {
	    movedByMouse = true;
	});

	javaEditor.on("cursorActivity", function (e) {
	    if (movedByMouse) {
	        movedByMouse = false;
	       if (!javaEditor.getSelection()) {
	            console.log("줄 :: " + javaEditor.getCursor().line);
	            var getline = javaEditor.getCursor().line;
	            

				
	            hlLine = javaEditor.addLineClass(javaEditor.getCursor().line, "activeline");
	            console.log("hlLine ::");
	            console.log(hlLine);
	            
if(islive){            
				var cursor = javaEditor.getCursor();
				console.log("커서위치");
				console.log(cursor.line );
				console.log(cursor.ch );
	            postToServer(hlLine.text , getline, cursor.line, cursor.ch, Enter);
	            Enter = false;
}
	        }
	    }
	            

	});
	
// 		var tmp_pro = "BWJASK54AR";
function postToServer(hl , getline, cline, cch, Enter) {
		// 일반 문자열 전송(default 인코딩 타입 UTF-8 적용)
	 var msg = {
 		type 	: 'livecode',
    	hl		: hl,
    	getline	: getline,
    	pro_link: pro_link,
    	mem_id 	: mem_id,
    	cline	: cline,
    	cch		: cch,
    	mem_nick: mem_nick,
    	Enter   : Enter,
    	code	: javaEditor.getValue()
    	
  	};
	
// 	 ws.send(JSON.stringify(msg));
	 ws_teamchat.send(JSON.stringify(msg));
	}
	
	
	
});

</script>	
</head>
<body class="main-color" style="">
<form name="Frm"  action="" method="post" enctype="multipart/form-data">
<div>
		<div style="z-index: 3;">
			<nav id="goorm-mainmenu" class="navbar navbar-default navbar-static" role="navigation">
			<div class="collapse navbar-collapse bs-js-navbar-collapse">
				<ul id="main_menu_bar" class="nav navbar-nav">
					<li id="main-menu-file" class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" localization_key="file"> File </a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
							<li class="dropdown-submenu"><a id="parent_new_menu" child="child_new_menu" localization_key="file_new">New...</a>
								<ul id="child_new_menu" parent="parent_new_menu" class="dropdown-menu">
									<li><a href="#" action="new_file_file" localization_key="file_new_file">File</a></li>
									<li><a href="#" action="new_file_folder" localization_key="file_new_folder">Folder</a></li>
									<li><a href="#" action="new_file_textfile" localization_key="file_new_untitled_text_file">Untitled
											Text File</a></li>
									<li class="divider" style="display: none;"></li>
									<li style="display: none;"><a href="#" localization_key="file_new_other">Other...</a></li>
								</ul></li>
							<li><a href="#" action="open_file" name="preference.shortcut.file.open_file" localization_key="file_open_file"> Open File... <em class="helptext">Ctrl + O</em>
							</a></li>

							<li class="divider"></li>
							<li class="dropdown-submenu"><a id="parent_open_recent_files_menu" child="child_open_recent_files_menu" localization_key="open_recent_files">Open Recent Files...</a>
								<ul id="child_open_recent_files_menu" parent="parent_open_recent_files_menu" class="dropdown-menu file_dropdown">
									<li class="disabled reopen_closed_file"><a href="#" action="reopen_closed_file" class="menu_pull_left" name="preference.shortcut.file.reopen_closed_file" localization_key="reopen_closed_file">Reopen Closed File <em class="helptext">Alt + Ctrl + T</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="open_recent_file" data="0" class="menu-open-recent-file menu_pull_left"></a></li>
									<li><a href="#" action="open_recent_file" data="1" class="menu-open-recent-file menu_pull_left"></a></li>
									<li><a href="#" action="open_recent_file" data="2" class="menu-open-recent-file menu_pull_left"></a></li>
									<li><a href="#" action="open_recent_file" data="3" class="menu-open-recent-file menu_pull_left"></a></li>
									<li><a href="#" action="open_recent_file" data="4" class="menu-open-recent-file menu_pull_left"></a></li>
									<li class="divider menu-open-recent-file recent_file_clear"></li>
									<li class="disabled"><a href="#" class="menu-open-recent-file recent_file_empty menu_pull_left" localization_key="recent_empty">Empty</a></li>
									<li><a href="#" action="open_recent_file_clear" class="menu-open-recent-file recent_file_clear menu_pull_left" localization_key="recent_clear">Clear</a></li>
								</ul></li>

							<li class="divider"></li>
							<li><a href="#" action="close_file" name="preference.shortcut.file.close" localization_key="close">
									Close <em class="helptext">Alt + X</em>
							</a></li>
							<li><a href="#" action="close_all" name="preference.shortcut.file.close_all" localization_key="file_close_all"> Close All <em class="helptext">Alt + Shift + X</em>
							</a></li>
							<li class="divider"></li>
							<li><a href="#" action="save_file" name="preference.shortcut.file.save" localization_key="file_save"> Save... <em class="helptext">Ctrl
										+ S</em>
							</a></li>
							<li><a href="#" action="save_as_file" name="preference.shortcut.file.save_as" localization_key="file_save_as"> Save As... <em class="helptext">Ctrl + Shift + S</em>
							</a></li>
							<li><a href="#" action="save_all_file" name="preference.shortcut.file.save_all" localization_key="file_save_all"> Save All <em class="helptext">Alt + Ctrl + S</em>
							</a></li>
							<li class="divider"></li>
							<li><a href="#" action="rename_file" name="preference.shortcut.file.rename" localization_key="file_rename"> Rename <em class="helptext">Ctrl
										+ Shift + R</em>
							</a></li>
							<li><a href="#" action="duplicate_file" name="preference.shortcut.file.duplicate" localization_key="file_duplicate"> Duplicate <em class="helptext">Ctrl + Shift + A</em>
							</a></li>
							<li><a href="#" action="delete_file" name="preference.shortcut.file.delete" localization_key="file_delete"> Delete <em class="helptext">Alt
										+ Shift + D</em>
							</a></li>

							<li><a href="#" action="property" localization_key="file_properties">Properties</a></li>
							<li class="divider"></li>
							<li><a href="#" action="print" name="preference.shortcut.file.print" localization_key="file_print"> Print <em class="helptext">Ctrl
										+ P</em>
							</a></li>
							<li class="divider"></li>
							<li><a href="#" action="compress_file" localization_key="compress_file">Compress</a></li>
							<li><a href="#" action="decompress_file" localization_key="decompress_file">Extract File</a></li>

							<li class="divider"></li>
							<li><a href="#" action="import_file" localization_key="file_import">Import File</a></li>

							<li><a href="#" action="upload_folder" localization_key="folder_upload">Upload Folder</a></li>

							<li><a href="#" action="export_file" localization_key="file_export">Export File</a></li>
						</ul></li>
					<li id="main-menu-edit" class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" localization_key="edit"> Edit </a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="drop2">
							<li id="menu_cut" style="display: none;"><a href="#" action="do_cut" name="preference.shortcut.edit.cut" localization_key="edit_cut"> Cut <em class="helptext">Ctrl
										+ X</em>
							</a></li>
							<li id="menu_copy" style="display: none;"><a href="#" action="do_copy" name="preference.shortcut.edit.copy" localization_key="edit_copy"> Copy <em class="helptext">Ctrl
										+ C</em>
							</a></li>
							<li style="display: none;"><a href="#" action="do_paste" name="preference.shortcut.edit.paste" localization_key="edit_paste"> Paste <em class="helptext">Ctrl
										+ V</em>
							</a></li>
							<li id="menu_copy_terminal" style="display: none;"><a href="#" action="do_copy_terminal" name="preference.shortcut.edit.copy_terminal"> Copy
									(Terminal) <em class="helptext">Ctrl + Shift + C</em>
							</a></li>
							<li class="divider" style="display: none;"></li>
							<li class="disabled"><a href="#" action="do_undo" name="preference.shortcut.edit.undo" localization_key="edit_undo"> Undo <em class="helptext">Ctrl
										+ Z</em>
							</a></li>
							<li class="disabled"><a href="#" action="do_redo" name="preference.shortcut.edit.redo" localization_key="edit_redo"> Redo <em class="helptext">Ctrl
										+ Y</em>
							</a></li>
							<li class="divider"></li>

							<li class="dropdown-submenu"><a id="parent_text_menu" child="child_text_menu" href="#" localization_key="edit_text">
									Text </a>
								<ul id="child_text_menu" parent="parent_text_menu" class="dropdown-menu">
									<li><a href="#" action="do_delete" name="preference.shortcut.edit.delete" localization_key="edit_delete"> Delete <em class="helptext">Backspace</em>
									</a></li>
									<li><a href="#" action="delete_line_left" localization_key="edit_delete_line_left"> Delete Line Left
											<em class="helptext">Ctrl + Backspace</em>
									</a></li>
									<li><a href="#" action="delete_line_right" localization_key="edit_delete_line_right"> Delete Line
											Right <em class="helptext">Ctrl + K + K</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="do_downcase_cursor" localization_key="edit_downcase_cursor"> Downcase at
											Cursor <em class="helptext">Ctrl + K + L</em>
									</a></li>
									<li><a href="#" action="do_upcase_cursor" localization_key="edit_upcase_cursor"> Upcase at Cursor <em class="helptext">Ctrl + K + U</em>
									</a></li>
									<li><a href="#" action="do_transpose" localization_key="edit_transpose"> Transpose <em class="helptext">Ctrl + Alt + T</em>
									</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a href="#" id="parent_line_menu" child="child_line_menu" localization_key="edit_line"> Line </a>
								<ul id="child_line_menu" parent="parent_line_menu" class="dropdown-menu">
									<li><a href="#" action="toggle_use_line_wrapping" name="preference.editor.line_wrapping" localization_key="dialog_preference_editor_line_wrapping" applied=""> Use Line Wrapping <span class="menu-applied">
												<span id="use_line_wrapping" class="gi gi-ok"></span>
										</span>
									</a></li>
									<li><a href="#" action="do_convert_indentation" localization_key="edit_convert_indentation"> Convert
											Indentation </a></li>
									<li class="divider"></li>
									<li><a href="#" action="do_join_lines" localization_key="edit_join_lines"> Join Lines <em class="helptext">Ctrl + J</em>
									</a></li>
									<li><a href="#" action="do_duplicate_line" localization_key="edit_duplicate_line"> Duplicate Line <em class="helptext">Shift + Ctrl + D</em>
									</a></li>
									<li><a href="#" action="do_delete_line" localization_key="edit_delete_line"> Delete Line <em class="helptext">Shift + Ctrl + K</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="insert_line_before" localization_key="edit_insert_line_before"> Insert Line
											Before <em class="helptext">Shift + Ctrl + Enter</em>
									</a></li>
									<li><a href="#" action="insert_line_after" localization_key="edit_insert_line_after"> Insert Line
											After <em class="helptext">Ctrl + Enter</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="swap_line_down" localization_key="edit_swap_line_down"> Swap Line Down <em class="helptext">Shift + Ctrl + Down</em>
									</a></li>
									<li><a href="#" action="swap_line_up" localization_key="edit_swap_line_up"> Swap Line Up <em class="helptext">Shift + Ctrl + Up</em>
									</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a href="#" id="parent_selection_menu" child="child_selection_menu" localization_key="edit_selection"> Selection </a>
								<ul id="child_selection_menu" parent="parent_selection_menu" class="dropdown-menu">
									<li><a href="#" action="select_all" name="preference.shortcut.edit.select_all" localization_key="edit_select_all"> Select All <em class="helptext">Ctrl + A</em>
									</a></li>
									<li><a href="#" action="select_word" localization_key="edit_select_word"> Select Word <em class="helptext">Ctrl + D</em>
									</a></li>
									<li><a href="#" action="select_line" localization_key="edit_select_line"> Select Line <em class="helptext">Ctrl + L</em>
									</a></li>
									<li><a href="#" action="select_scope" localization_key="edit_select_scope"> Select Scope <em class="helptext">Shift + Ctrl + Space</em>
									</a></li>
									<li><a href="#" action="select_between_brackets" localization_key="edit_select_between_brackets"> Select
											Between Brackets <em class="helptext">Shift + Ctrl + M</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="do_single_selection" localization_key="edit_single_selection"> Single Selection
											<em class="helptext">Esc</em>
									</a></li>
									<li><a href="#" action="add_previous_line" localization_key="edit_select_add_previous_line"> Add
											Previous Line <em class="helptext">Alt + Shift + I</em>
									</a></li>
									<li><a href="#" action="add_next_line" localization_key="edit_select_add_next_line"> Add Next
											Line <em class="helptext">Alt + Shift + K</em>
									</a></li>
									<li><a href="#" action="do_split_into_lines" localization_key="edit_split_into_lines"> Split Selection
											by Line <em class="helptext">Shift + Ctrl + L</em>
									</a></li>
								</ul></li>

							<li class="dropdown-submenu"><a href="#" id="parent_codefolding_menu" child="child_codefolding_menu" localization_key="edit_codefolding"> Code Folding </a>
								<ul id="child_codefolding_menu" parent="parent_codefolding_menu" class="dropdown-menu">
									<li><a href="#" action="do_fold" localization_key="edit_fold"> Fold <em class="helptext">Ctrl
												+ Alt + [</em>
									</a></li>
									<li><a href="#" action="do_unfold" localization_key="edit_unfold"> Unfold <em class="helptext">Ctrl + Alt + ]</em>
									</a></li>
									<li><a href="#" action="do_fold_all" localization_key="edit_fold_all"> Fold All <em class="helptext">Ctrl + K + 1</em>
									</a></li>
									<li><a href="#" action="do_unfold_all" localization_key="edit_unfold_all"> Unfold All <em class="helptext">Ctrl + K + 0</em>
									</a></li>
								</ul></li>
							<li class="divider"></li>
							<li class="dropdown-submenu"><a href="#" id="parent_goto_menu" child="child_goto_menu" localization_key="edit_goto"> Goto </a>
								<ul id="child_goto_menu" parent="parent_goto_menu" class="dropdown-menu">
									<li><a href="#" action="do_go_to_line" name="preference.shortcut.edit.go_to_line" localization_key="edit_go_to_line"> Go to Line <em class="helptext">Alt + Ctrl + L</em>
									</a></li>
									<li><a href="#" action="go_to_bracket" localization_key="edit_go_to_bracket"> Go to Bracket <em class="helptext">Ctrl + M</em>
									</a></li>
									<li><a href="#" action="go_subword_left" localization_key="edit_go_subword_left"> Go Subword Left <em class="helptext">Alt + Left</em>
									</a></li>
									<li><a href="#" action="go_subword_right" localization_key="edit_go_subword_right"> Go Subword Right
											<em class="helptext">Alt + Right</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="scroll_line_up" localization_key="edit_scroll_line_up"> Scroll Line Up <em class="helptext">Ctrl + Up</em>
									</a></li>
									<li><a href="#" action="scroll_line_down" localization_key="edit_scroll_line_down"> Scroll Line Down
											<em class="helptext">Ctrl + Down</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="show_in_center" localization_key="edit_show_in_center"> Show in Center <em class="helptext">Ctrl + K + C</em>
									</a></li>
									<li class="divider"></li>
									<li><a action="nav_history_back" localization_key="edit_nav_history_back"> Go back <em class="helptext">Alt + Ctrl + Down</em>
									</a> <a action="nav_history_forward" localization_key="edit_nav_history_forward"> Go forward <em class="helptext">Alt + Ctrl + Up</em>
									</a></li>

									<li class="divider"></li>
									<li><a href="#" action="do_jump_to_definition" localization_key="edit_definition_edit_context"> Jump to
											Definition <em class="helptext">Ctrl + E</em>
									</a></li>

								</ul></li>

							<li id="main-submenu-bookmark" class="dropdown-submenu"><a id="parent_bookmark_menu" child="child_bookmark_menu" href="#Bookmark" localization_key="edit_bookmark">Bookmark...</a>
								<ul id="child_bookmark_menu" parent="parent_bookmark_menu" class="dropdown-menu">
									<li><a href="#" action="toggle_bookmark" name="preference.shortcut.edit.toggle_bookmark" localization_key="edit_toggle_bookmark"> Toggle Bookmark <em class="helptext">Ctrl + F2</em>
									</a></li>
									<li><a href="#" action="next_bookmark" name="preference.shortcut.edit.next_bookmark" localization_key="edit_next_bookmark"> Next Bookmark <em class="helptext">F2</em>
									</a></li>
									<li><a href="#" action="prev_bookmark" name="preference.shortcut.edit.prev_bookmark" localization_key="edit_prev_bookmark"> Previous Bookmark <em class="helptext">Shift + F2</em>
									</a></li>
									<li><a href="#" action="clear_bookmark" name="preference.shortcut.edit.clear_bookmark" localization_key="edit_clear_bookmark"> Clear Bookmarks <em class="helptext">Ctrl + Shift + F2</em>
									</a></li>
								</ul></li>

							<li class="divider"></li>
							<li class="dropdown-submenu"><a href="#" id="parent_find_menu" child="child_find_menu" localization_key="edit_find"> Find </a>
								<ul id="child_find_menu" parent="parent_find_menu" class="dropdown-menu">
									<li><a href="#" action="do_find" name="preference.shortcut.edit.find_and_replace" localization_key="edit_find_and_replace"> Find <em class="helptext">Ctrl + F</em>
									</a></li>
									<li><a href="#" action="do_find_next" name="preference.shortcut.edit.find_next" localization_key="edit_find_next"> Find Next <em class="helptext">Ctrl + G</em>
									</a></li>
									<li><a href="#" action="do_find_previous" name="preference.shortcut.edit.find_previous" localization_key="edit_find_previous"> Find Previous <em class="helptext">Ctrl + Shift + G</em>
									</a></li>
								</ul></li>
							<li><a href="#" action="do_replace" name="preference.shortcut.edit.replace" localization_key="edit_replace"> Replace <em class="helptext">Alt + Ctrl + F</em>
							</a></li>
							<li><a href="#" action="search" name="preference.shortcut.edit.search" localization_key="edit_search"> Search <em class="helptext">Alt
										+ H</em>
							</a></li>
							<li class="divider"></li>



							<li><a href="#" action="comment_selected" name="preference.shortcut.edit.comment_selected" localization_key="edit_comment_selected"> Toggle Comment
									Selected <em class="helptext">Ctrl + /</em>
							</a></li>
							<li class="divider"></li>


							<li class="dropdown-submenu"><a id="parent_reformat_code_in_section" child="child_reformat_code_in_section" action="reformat_code_switcher" localization_key="edit_reformat_code_in_section"> Reformat
									Code <em class="helptext">Alt+Shift+P</em>
							</a>
								<ul id="child_reformat_code_in_section" parent="parent_reformat_code_in_section" class="dropdown-menu">
									<li><a href="#" action="reformat_code_in_section_with_type" reformat_type="html" localization_key="edit_reformat_code_html"> html format
											(.html) </a></li>
									<li><a href="#" action="reformat_code_in_section_with_type" reformat_type="css" localization_key="edit_reformat_code_css">
											css format (.css .scss) </a></li>
									<li><a href="#" action="reformat_code_in_section_with_type" reformat_type="js" localization_key="edit_reformat_code_javascript">
											javascript format (.js .jsx) </a></li>
									<li><a href="#" action="reformat_code_in_section_with_type" reformat_type="ts" localization_key="edit_reformat_code_typescript">
											typescript format (.ts) </a></li>
									<li><a href="#" action="reformat_code_in_section_with_type" reformat_type="json" localization_key="edit_reformat_code_json"> json format
											(.json) </a></li>
								</ul></li>
							<li><a href="#" action="sort_lines" localization_key="edit_sort_lines"> Sort Lines <em class="helptext">F9</em>
							</a></li>
							<li id="main-submenu-merge" class="dropdown-submenu"><a id="parent_merge_menu" child="child_merge_menu" href="#Merge" localization_key="edit_merge" class="">Merge</a>
								<ul id="child_merge_menu" parent="parent_merge_menu" class="dropdown-menu">
									<li><a href="#" action="do_merge_view" name="preference.shortcut.edit.merge_view" localization_key="edit_merge_view"> Merge View <em class="helptext">Alt + Shift + M</em>
									</a></li>
									<li><a href="#" action="do_next_diff" name="preference.shortcut.edit.next_diff" localization_key="edit_next_diff" class=""> Next Diff <em class="helptext">Alt + Shift + =</em>
									</a></li>
									<li><a href="#" action="do_prev_diff" name="preference.shortcut.edit.prev_diff" localization_key="edit_prev_diff" class=""> Previous Diff
											<em class="helptext">Alt + Shift + -</em>
									</a></li>
									<li><a href="#" action="do_merge_diff" name="preference.shortcut.edit.merge_diff" localization_key="edit_merge_diff" class=""> Merge Diff <em class="helptext">Alt + Shift + /</em>
									</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a id="parent_refactor_menu" child="child_refactor_menu" href="#Refactor" localization_key="edit_refactor" class="">Refactor</a>
								<ul id="child_refactor_menu" parent="parent_refactor_menu" class="dropdown-menu">
									<li><a href="#" action="do_safe_delete_search" localization_key="edit_safe_delete"> Safe Delete </a></li>
								</ul></li>


							<li class="divider"></li>

							<li class="dropdown-submenu"><a id="parent_font_menu" child="child_font_menu" href="#" localization_key="edit_font">
									Font Size </a>
								<ul id="child_font_menu" parent="parent_font_menu" class="dropdown-menu">
									<li><a href="#" action="do_magnify_font" name="preference.shortcut.edit.magnify_font" localization_key="edit_magnify_font"> Magnify Font Size <em class="helptext">Ctrl + =</em>
									</a></li>
									<li><a href="#" action="do_minify_font" name="preference.shortcut.edit.minify_font" localization_key="edit_minify_font"> Minify Font Size <em class="helptext">Ctrl + -</em>
									</a></li>
									<li class="divider"></li>
									<li><a href="#" action="do_default_font" localization_key="edit_default_font"> Default Font Size <em class="helptext">Ctrl + 0</em>
									</a></li>
								</ul></li>
							<li><a href="#" action="toggle_rulers" name="preference.editor.rulers" localization_key="dialog_preference_editor_rulers" applied="">
									Show Rulers <span class="menu-applied"> <span id="use_rulers" class="gi gi-ok"></span>
								</span>
							</a></li>
						</ul></li>
					<li id="main-menu-project" class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" localization_key="project" aria-expanded="false"> Project </a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
							<li class="dropdown-submenu"><a id="project-context__parent-common-menu" child="project-context__child-common-menu" action="do_common" name="preference.shortcut.project.common_project" localization_key="command_context_common"> Common </a>

								<ul id="project-context__child-common-menu" parent="project-context__parent-common-menu" class="dropdown-menu child-command-menu child-common-menu" tool_type="common">
									<li class="divider add-command-divider"></li>
									<li><a action="add_common_command" localization_key="add_common_command">Add common command</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a id="project-context__parent-build-menu" child="project-context__child-build-menu" action="do_build" name="preference.shortcut.project.build_project" localization_key="command_context_build"> Build <em class="helptext">F5</em>
							</a>

								<ul id="project-context__child-build-menu" parent="project-context__parent-build-menu" class="dropdown-menu child-command-menu child-build-menu" tool_type="build">
									<li class="divider add-command-divider"></li>
									<li><a action="add_build_command" localization_key="add_build_command">Add build command</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a id="project-context__parent-run-menu" child="project-context__child-run-menu" action="do_run" name="preference.shortcut.project.run" localization_key="command_context_run"> Run <em class="helptext">Shift + F5</em>
							</a>

								<ul id="project-context__child-run-menu" parent="project-context__parent-run-menu" class="dropdown-menu child-command-menu child-run-menu" tool_type="build">
									<li class="divider add-command-divider"></li>
									<li><a action="add_run_command" localization_key="add_run_command">Add run command</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a id="project-context__parent-test-menu" child="project-context__child-test-menu" action="do_test" name="preference.shortcut.project.test_project" localization_key="command_context_test"> Test </a>

								<ul id="project-context__child-test-menu" parent="project-context__parent-test-menu" class="dropdown-menu child-command-menu child-test-menu" tool_type="test">
									<li class="divider add-command-divider"></li>
									<li><a action="add_test_command" localization_key="add_test_command">Add test command</a></li>
								</ul></li>
							<li><a href="#" action="stop" name="preference.shortcut.project.stop" localization_key="project_stop"> Stop </a></li>
							<li class="divider"></li>

							<li><a href="#" action="show_url_port" localization_key="running_port_url"> Running URL and Port </a></li>

							<li><a href="#" action="build_configuration" localization_key="project_build_configuration">Build
									Configuration</a></li>
							<li class="divider"></li>

							<li><a href="#" action="refresh_project_directory" name="preference.shortcut.project.refresh" localization_key="project_refresh"> Refresh Project <em class="helptext">Ctrl + R</em>
							</a></li>
							<li class="divider"></li>
							<li><a href="#" action="find_file" name="preference.shortcut.navigation.open" localization_key="find_file"> Find File <em class="helptext">Alt
										+ Shift + F</em>
							</a></li>
							<li><a href="#" action="refresh_navigation" name="preference.shortcut.navigation.refresh" localization_key="refresh_navigation"> Refresh Navigation </a></li>
							<li class="divider"></li>

							<li><a href="#" action="share_project" localization_key="project_share">Share This Project</a></li>

							<li><a href="#" action="do_share_cursor" localization_key="edit_share_cursor" applied=""> Toggle
									Cursor Sharing <span class="menu-applied"> <span id="toggle_cursor_checker" class="gi gi-ok"></span>
								</span>
							</a></li>

							<li><a href="#" action="do_rt_lint" localization_key="edit_realtime_lint" applied=""> Toggle
									Real-time Lint <span class="menu-applied"> <span id="toggle_realtime_lint_checker" class="gi gi-ok"></span>
								</span>
							</a></li>
							<li class="divider"></li>
							<li><a id="project_property_open" href="#" action="show_properties" localization_key="file_properties">Properties</a>
							</li>

						</ul></li>

<!-- 					<li id="main-menu-debug" class="dropdown"><a href="#" id="debug_parent" role="button" class="dropdown-toggle" data-toggle="dropdown" localization_key="debug"> Debug </a> -->
<!-- 						<ul class="dropdown-menu" role="menu" aria-labelledby="drop4"> -->
<!-- 							<li class="dropdown-submenu"><a id="parent_debug_menu" child="child_debug_menu" href="#" name="preference.shortcut.debug.start" localization_key="debug_start"> Debug Start <em class="helptext">Alt + F5</em> -->
<!-- 							</a> -->
<!-- 								<ul id="child_debug_menu" parent="parent_debug_menu" class="dropdown-menu project_list" tool_type="debug"></ul></li> -->
<!-- 							<li><a href="#" action="debug_continue" name="preference.shortcut.debug.continue" localization_key="debug_continue"> Continue <em class="helptext">Ctrl + Shift + Y</em> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" action="debug_stop" name="preference.shortcut.debug.terminate" localization_key="debug_terminate"> Terminate <em class="helptext">F4</em> -->
<!-- 							</a></li> -->
<!-- 							<li class="divider"></li> -->
<!-- 							<li><a href="#" action="debug_step_over" name="preference.shortcut.debug.step_over" localization_key="debug_step_over"> Step over <em class="helptext">F6</em> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" action="debug_step_in" name="preference.shortcut.debug.step_in" localization_key="debug_step_in"> Step into <em class="helptext">F7</em> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" action="debug_step_out" name="preference.shortcut.debug.step_out" localization_key="debug_step_out"> Step out <em class="helptext">F8</em> -->
<!-- 							</a></li> -->
<!-- 							<li class="divider"></li> -->
<!-- 							<li><a href="#" action="toggle_breakpoint" name="preference.shortcut.debug.toggle_breakpoint" localization_key="debug_toggle_breakpoint"> Toggle -->
<!-- 									breakpoint <em class="helptext">Ctrl + B</em> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 						</li> -->

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="fat-menu" class="dropdown"><a id="account_menu_dropdown" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <span id="user-email-container">${LOGIN_MEMBERINFO.mem_nick} </span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="account_menu_dropdown">

							<li><a role="menuitem" tabindex="-1" href="#" action="account_profile" localization_key="account_profile">프로필</a>
							</li>
<!-- 							<li><a role="menuitem" tabindex="-1" href="#" action="account_container" localization_key="dlg_auth_container">이슈트래커</a> -->
<!-- 							</li> -->
<!-- 							<li class="divider"></li> -->
							<li><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath }/user/project/pro_main.do" action="container_close" localization_key="container_close" data-original-title="" title="">라온IDE 나가기</a></li>

							<li><a role="menuitem" tabindex="-1" onclick="javascript:fn_logout();" action="account_logout" localization_key="account_logout">로그아웃</a>
							</li>
						</ul></li>
				</ul>
			</div>
			</nav>
			<!-- 상위 2층 버튼 시작-->
			<nav id="goorm_main_toolbar" class="navbar navbar-default toolbar-container" role="navigation">
			<div id="main_toolbar" class="collapse navbar-collapse" style="background-color: #151515; border-bottom: 1px solid #151515;">
				<ul class="nav navbar-nav" style="width: 100%">
					<div id="main_file_toolbar" class="btn-group grm_toolbar">
						<button type="button" onclick="fn_open_addFile(ide_no, folder_name, author, split);" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="new_file_file" tooltip="file_new_file">
							<i class="gi gi-new_file"></i><span><font size="2pt" style="font-weight: bold">&nbsp;새 파일</font></span>
						</button>
<!-- 						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="open_file" tooltip="file_open_file"> -->
<!-- 							<i class="gi gi-open_file"></i> -->
<!-- 						</button> -->

<!-- 						<div class="btn-group"> -->
<!-- 							<button type="button" class="btn btn-default btn-caret-solo dropdown-toggle btn-caret" data-toggle="dropdown" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="open_recent_files"> -->
<!-- 								<span class="caret"></span> -->
<!-- 							</button> -->
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li class="disabled reopen_closed_file"><a href="#" action="reopen_closed_file" name="preference.shortcut.file.reopen_closed_file" localization_key="reopen_closed_file">Reopen Closed File <em class="helptext" style="padding-left: 0px;">Alt + Ctrl + -->
<!-- 											T</em> -->
<!-- 								</a></li> -->
<!-- 								<li class="divider"></li> -->
<!-- 								<li><a href="#" action="open_recent_file" data="0" class="menu-open-recent-file"></a></li> -->
<!-- 								<li><a href="#" action="open_recent_file" data="1" class="menu-open-recent-file"></a></li> -->
<!-- 								<li><a href="#" action="open_recent_file" data="2" class="menu-open-recent-file"></a></li> -->
<!-- 								<li><a href="#" action="open_recent_file" data="3" class="menu-open-recent-file"></a></li> -->
<!-- 								<li><a href="#" action="open_recent_file" data="4" class="menu-open-recent-file"></a></li> -->
<!-- 								<li class="divider menu-open-recent-file recent_file_clear"></li> -->
<!-- 								<li class="disabled"><a href="#" class="menu-open-recent-file recent_file_empty" localization_key="recent_empty">Empty</a></li> -->
<!-- 								<li><a href="#" action="open_recent_file_clear" class="menu-open-recent-file recent_file_clear" localization_key="recent_clear">Clear</a></li> -->

<!-- 							</ul> -->
<!-- 						</div> -->

<!-- 종운 -->	

						<button onclick="fn_fileSave()" type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="" tooltip="">
							<i class="gi gi-save"></i><span><font size="2pt" style="font-weight: bold">&nbsp;저장</font></span>
						</button>
</form>
<!-- 						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="save_as_file" tooltip="file_save_as"> -->
<!-- 							<i class="gi gi-save_as"></i> -->
<!-- 						</button> -->
<!-- 종운 -->
						<!-- 은혜 임포트 위해 수정 -->
						<button onclick="fn_import();" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="import_file" tooltip="file_import">
							<i class="gi gi-upload"></i><span><font size="2pt" style="font-weight: bold">&nbsp;Import</font></span>
						</button>
						<!-- 은혜 임포트 위해 수정 끝 -->
						<!-- 종운 export  -->
						<button onclick="fn_export();"  type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="export_file" tooltip="file_export">
							<i class="gi gi-download"></i><span><font size="2pt" style="font-weight: bold">&nbsp;Export</font></span>
						</button>
						<!-- 종운 export  -->
					</div>
					<div id="main_edit_toolbar" class="btn-group grm_toolbar">
						<!-- 은혜 파일 검색 수정 온클릭 -->
						<button type="button" onclick="searchFile()" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-container="body" action="do_find" tooltip="edit_find_and_replace">
							<i class="gi gi-find text"></i><span localization_key="edit_find_and_replace"><font size="2pt" style="font-weight: bold">&nbsp;파일 검색</font></span>
						</button>
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-container="body" action="search" tooltip="edit_search"> -->
						<!-- 							<i class="gi gi-search"></i> -->
						<!-- 						</button> -->
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-container="body" action="preference" tooltip="edit_preference"> -->
						<!-- 							<i class="gi gi-preference"></i> -->
						<!-- 						</button> -->
					</div>
					<div id="main_project_toolbar" class="btn-group grm_toolbar">

						<!--                         <div class="btn-group"> -->
						<!--                             <span class="dropdown-toggle common_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
						<!-- 								<button type="button" class="btn btn-default" action="do_common" data-toggle="tooltip" data-placement="top" data-original-title="Common" data-container="body" tooltip="command_context_common"> -->
						<!-- 									<i class="gi gi-common text"></i>&nbsp;<span localization_key="command_context_common">Common</span><span class="caret" style="margin-left: 3px;"></span> -->
						<!--                             </button> -->
						<!--                             </span> -->

						<!--                             <ul tool_type="run" id="toolbar-context__child-common-menu" class="dropdown-menu child-command-menu child-common-menu"> -->
						<!--                                 <li class="divider add-command-divider"></li> -->
						<!--                                 <li> -->
						<!--                                     <a action="add_common_command" localization_key="add_common_command">Add common command</a> -->
						<!--                                 </li> -->
						<!--                             </ul> -->
						<!--                         </div> -->
						<div class="btn-group">
							<span class="dropdown-toggle build_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

								<button type="button"  onclick="server()" class="btn btn-default" action="do_build" data-toggle="tooltip" data-placement="top" data-original-title="Build" data-container="body" tooltip="command_context_build">
									<i class="gi gi-gears text"></i>&nbsp;<span localization_key="command_context_build"><font size="2pt" style="font-weight: bold">빌드</font></span>
								</button>
							</span>
<!--종운 서버실행  -->
<!-- 							<ul tool_type="build" id="toolbar-context__child-build-menu" class="dropdown-menu child-command-menu child-build-menu"> -->
<!-- 								<li class="divider add-command-divider"></li> -->
<!-- 								<li><a onclick="server()" action="add_build_command" localization_key="add_build_command">Add build command</a></li> -->
<!-- 							</ul> -->
<!--종운 서버실행  -->
						</div>
						<div class="btn-group">
							<span class="dropdown-toggle run_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<button type="button" onclick="compile()" class="btn btn-default" action="do_run" data-toggle="tooltip" data-placement="top" data-original-title="Run" data-container="body" tooltip="command_context_run">
									<i class="gi gi-run text"></i>&nbsp;<span localization_key="command_context_run"><font size="2pt" style="font-weight: bold">실행</font></span>
								</button>
							</span>

<!-- 							<ul tool_type="run" id="toolbar-context__child-run-menu" class="dropdown-menu child-command-menu child-run-menu"> -->
<!-- 								<li class="divider add-command-divider"></li> -->
<!-- 								<li><a onclick="compile()" action="add_run_command"  localization_key="add_run_command">Add run command</a></li> -->
<!-- 							</ul> -->
						</div>
						

					</div>

					<div id="main_debug_toolbar" class="btn-group grm_toolbar">
<!-- 						<div class="btn-group"> -->
<!-- 							<span class="dropdown-toggle debug_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 								<button type="button" class="btn btn-default" action="debug" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="debug_start" name="preference.shortcut.debug.start"> -->
<!-- 									<i class="gi gi-debug text"></i>&nbsp;<span localization_key="debug">디버그</span><span class="caret multi_project" style="margin-left: 3px; display: none;"></span> -->
<!-- 								</button> -->
<!-- 							</span> -->
<!-- 							<ul class="dropdown-menu project_list multi_project" tool_type="debug" style="display: none;"></ul> -->
<!-- 						</div> -->
<!-- 종운 서버 정지  -->
						<button onclick="StopServer()" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_stop" tooltip="debug_terminate">
							<i class="gi gi-stop text"></i>&nbsp;<span localization_key="debug_terminate"><font size="2pt" style="font-weight: bold">정지</font></span>
						</button>
<!-- 종운 서버 정지  -->
<!-- 						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_continue" tooltip="debug_continue"> -->
<!-- 							<i class="gi gi-continue"></i> -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_over" tooltip="debug_step_over"> -->
<!-- 							<i class="gi gi-jump"></i> -->
<!-- 						</button> -->
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_in" tooltip="debug_step_in"> -->
						<!-- 							<i class="gi gi-step_in"></i> -->
						<!-- 						</button> -->
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_out" tooltip="debug_step_out"> -->
						<!-- 							<i class="gi gi-step_out"></i> -->
						<!-- 						</button> -->
					</div>
					<!--                     <div id="main_project_sub_toolbar" class="btn-group grm_toolbar"> -->
					<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="share_project" tooltip="project_share"> -->
					<!-- 							<i class="gi gi-project_share text"></i>&nbsp;<span localization_key="project_share">SHARE</span> -->
					<!-- 						</button> -->
					<!--                         <button type="button" class="btn btn-default active" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="do_share_cursor" tooltip="edit_share_cursor"> -->
					<!-- 							<i class="gi gi-eye"></i> -->
					<!-- 						</button> -->
					<!--                     </div> -->
<!-- 					<div id="main_scm_toolbar" class="btn-group grm_toolbar"> -->
<!-- 						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Commit" data-container="body" action="scm_commit" tooltip="scm_commit"> -->
<!-- 							<i class="gi gi-commit text"></i> <span>커밋</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
					<!-- 오비 코비 토글 시작 -->
					<div id="main_scm_toolbar" class="btn-group grm_toolbar" style="float: right; text-align:center;">
						<button type="button" class="btn btn-default">
                            <span><font style="font-weight: bold" size="2px">오비
							<label class="switch">
								<input type="checkbox" name="input_obi" onclick="obi_switch()">
								<span class="slider round" style="margin-bottom : 5px;"></span>
                            </label></font>
                            </span>
						</button>
					</div>
					<!-- 오비 코비 토글 끝 -->
					
					<!-- 은지 -->
					<!-- 코비 토글 시작 -->
					<div id="main_scm_toolbar" class="btn-group grm_toolbar" style="float: right; text-align:center;">
						<button type="button" class="btn btn-default">
                            <span><font style="font-weight: bold" size="2px">코비
							<label class="switch" style="">
								<input type="checkbox" name="input_cobi">
								<span class="slider_cobi round" style="margin-bottom : 5px;"></span>
                            </label></font>
                            </span>
						</button>
					</div>
					<!-- 코비 토글 끝 -->
					
					
					<!-- 종운 -->
					<!-- 실시간코딩 토글 시작 -->
					<div id="main_scm_toolbar" class="btn-group grm_toolbar" style="float: right; text-align:center;">
						<button type="button" class="btn btn-default">
                            <span><font style="font-weight: bold" size="2px">실시간코딩
							<label class="switch" style="">
								<input type="checkbox" name="input_livecode">
								<span class="slider_livecode round" style="margin-bottom : 5px;"></span>
                            </label></font>
                            </span>
						</button>
					</div>
					<!-- 실시간코딩 토글 끝 -->
					<div id="nick" style="float: right;">

					</div>
					
					<div class="btn-group" id="toolbar_more_button_group" style="display: none;">
						<button id="toolbar_more_button" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-container="body" action="">
							<div class="toolbar_button more_button">
								<span>More<b class="caret caret_padding"></b></span>
							</div>
						</button>
					</div>
					<!--                     <button type="button" id="north_tab_toggle_btn" class="btn btn-default"> -->
					<!-- 						<i class="gi gi-caret-up"></i> -->
					<!-- 					</button> -->
				</ul>
			</div>
			<div id="bubble_toolbar" class="bubble_toolbar" style="display: none;">
				<ul id="bubble_toolbar_sub" class="nav navbar-nav">
					<div id="bubble_file_toolbar" class="btn-group grm_bubble_toolbar bubble_file_toolbar" style="display: none;">
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="new_file_file" tooltip="file_new_file">
							<i class="gi gi-new_file"></i>
						</button>
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="open_file" tooltip="file_open_file">
							<i class="gi gi-open_file"></i>
						</button>

						<div class="btn-group">
							<button type="button" class="btn btn-default btn-caret-solo dropdown-toggle" data-toggle="dropdown" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="open_recent_files">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#" action="open_recent_file" data="0" class="menu-open-recent-file"></a></li>
								<li><a href="#" action="open_recent_file" data="1" class="menu-open-recent-file"></a></li>
								<li><a href="#" action="open_recent_file" data="2" class="menu-open-recent-file"></a></li>
								<li><a href="#" action="open_recent_file" data="3" class="menu-open-recent-file"></a></li>
								<li><a href="#" action="open_recent_file" data="4" class="menu-open-recent-file"></a></li>
								<li class="divider menu-open-recent-file recent_file_clear"></li>
								<li class="disabled"><a href="#" class="menu-open-recent-file recent_file_empty" localization_key="recent_empty">Empty</a></li>
								<li><a href="#" action="open_recent_file_clear" class="menu-open-recent-file recent_file_clear" localization_key="recent_clear">Clear</a></li>
							</ul>
						</div>

<!-- 종운 -->	

						<button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="" tooltip="">
							<i class="gi gi-save"></i>
						</button>
						
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="save_as_file" tooltip="file_save_as">
							<i class="gi gi-save_as"></i>
						</button>
<!-- 종운 -->
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="import_file" tooltip="file_import">
							<i class="gi gi-upload"></i>
						</button>
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="export_file" tooltip="file_export">
							<i class="gi gi-download"></i>
						</button>
					</div>
					<div id="bubble_edit_toolbar" class="btn-group grm_bubble_toolbar bubble_edit_toolbar" style="display: none;">
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="do_find" tooltip="edit_find_and_replace">
							<i class="gi gi-find"></i>&nbsp;<span localization_key="edit_find_and_replace">FIND</span>
						</button>
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="search" tooltip="edit_search"> -->
						<!-- 							<i class="gi gi-search"></i> -->
						<!-- 						</button> -->
						<!--                         <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="preference" tooltip="edit_preference"> -->
						<!-- 							<i class="gi gi-preference"></i> -->
						<!-- 						</button> -->
					</div>
					<div id="bubble_project_toolbar" class="btn-group grm_bubble_toolbar bubble_project_toolbar" style="display: none;">

						<div class="btn-group">
							<span class="dropdown-toggle run_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<button type="button" class="btn btn-default" action="do_run" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="project_run">
									<i class="gi gi-run text"></i>&nbsp;<span localization_key="project_run">RUN</span>
								</button>
							</span>
							<ul class="dropdown-menu project_list" tool_type="run"></ul>
						</div>

						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="project_upload" tooltip="project_upload">
							<i class="gi gi-run text"></i>&nbsp;<span localization_key="project_upload">UPLOAD</span>
						</button>

						<div class="btn-group">
							<span class="dropdown-toggle build_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<button type="button" class="btn btn-default" action="build_project" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="project_build">
									<i class="gi gi-gears text"></i>&nbsp;<span localization_key="project_build_project">BUILD</span>
								</button>
							</span>
							<ul class="dropdown-menu project_list" tool_type="build_project"></ul>
						</div>

						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="info_goormduino" tooltip="info_goormduino">
							<i class="gi gi-goormduino text"></i>&nbsp;<span localization_key="info_goormduino">GOORMDUINO</span>
						</button>
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="info_goormusbconnector" tooltip="info_goormusbconnector">
							<i class="gi gi-goormduino text"></i>&nbsp;<span localization_key="info_goormusbconnector">GOORMUSBCONNECTOR</span>
						</button>
						<div id="bubble_debug_toolbar" class="btn-group grm_bubble_toolbar bubble_debug_toolbar" style="display: none;">
							<div class="btn-group">
								<span class="dropdown-toggle debug_toolbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<button type="button" class="btn btn-default" action="debug" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on bottom" data-container="body" tooltip="debug_start">
										<i class="gi gi-debug text"></i>&nbsp;<span localization_key="debug">DEBUG</span> <em class="helptext">Alt
											+ F5</em>
									</button>
								</span>
								<ul class="dropdown-menu project_list" tool_type="debug"></ul>
							</div>
							<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_stop" tooltip="debug_terminate">
								<i class="gi gi-stop text"></i>&nbsp;<span localization_key="debug_terminate">TERMINATE</span>
							</button>
							<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_continue" tooltip="debug_continue">
								<i class="gi gi-continue"></i>
							</button>
							<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_over" tooltip="debug_step_over">
								<i class="gi gi-jump"></i>
							</button>
							<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_in" tooltip="debug_step_in">
								<i class="gi gi-step_in"></i>
							</button>
							<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="debug_step_out" tooltip="debug_step_out">
								<i class="gi gi-step_out"></i>
							</button>
						</div>
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="share_project" tooltip="project_share">
							<i class="gi gi-project_share"></i>&nbsp;<span localization_key="project_share">SHARE</span>
						</button>
						<button type="button" class="btn btn-default active" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" data-container="body" action="do_share_cursor" tooltip="edit_share_cursor">
							<i class="gi gi-eye"></i>
						</button>

					</div>

					<div id="bubble_scm_toolbar" class="btn-group grm_bubble_toolbar">
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Commit" data-container="body" action="scm_commit" tooltip="scm_commit">
							<i class="gi gi-commit"></i> COMMIT
						</button>
						<button type="button" class="btn btn-default scm_update" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Update" data-container="body" action="scm_update" tooltip="scm_update">
							<i class="gi gi-update"></i> UPDATE
						</button>
						<button type="button" class="btn btn-default scm_pull" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Pull" data-container="body" action="scm_update" tooltip="scm_pull">
							<i class="gi gi-update"></i> PULL
						</button>
					</div>

				</ul>
				<div id="bubble_arrow" class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
					<div class="goorm-bubble-arrowimplbefore"></div>
					<div class="goorm-bubble-arrowimplafter"></div>
				</div>
			</div>
			</nav>
			<!-- 상위 2층 버튼 끝-->
		</div>
		<!-- 익스플로러 시작 -->
		<div id="goorm_left" class="ui-layout-west goorm_layout ui-layout-pane ui-layout-pane-west" style="position: absolute; margin: 0px; left: 0px; right: auto; top: 58px; bottom: 30px; height: 94%; z-index: 10; width: 250px; display: block; visibility: visible;">

			<ul id="west_tab" class="nav nav-tabs" style="width: 849px;">
				<button type="button" id="west_tab_toggle_btn" class="btn btn-default">
					<i class="gi gi-caret-up"></i> <i class="gi gi-caret-down"></i>
				</button>
				<li class="active"><a id="gLayoutTab_project" href="#project_explorer_tab"> <span localization_key="project" class="tab_area">프로젝트</span> <span id="project_badge" class="badge"></span>
				</a></li>

			</ul>


			<div class="tab-content" id="west_tab_content" style="display: block;">
<!-- 			<div class="tab-content" id="west_tab_content" style="display: block;"> -->
				<div class="tab-pane fade active in" id="project_explorer_tab" style="height:100%;">
<!-- 				<div class="tab-pane fade active in" id="project_explorer_tab" style="height:100%;"> -->
					<nav class="navbar navbar-default margin-0px padding-0px" role="navigation">
					<!-- 은혜 수정 시작 -->
					<div id="project_selector" class="btn-group">
						<div class="project_box">

							<div class="project_share_link"  style="font-size:10pt;">
								<marquee scrollamount="2">&nbsp;${proInfo.pro_name}</marquee>
							</div>

							<div class="btn-group pull-right" role="group" aria-label="...">
								<!-- 새로운 프로젝트 생성 버튼 은혜수정 -->
								<button type="button" id="add_project"
									onclick="fn_add_project();"
									class="btn btn-default border_none project_explorer_tool"
									data-toggle="tooltip" data-placement="bottom"
									data-original-title="서브 프로젝트 추가" data-container="body"
									tooltip="add_sub_project">
									<i class="gi gi-plus gi-medium"></i>
								</button>

								<button type="button" id="project_explorer_refresh_tool"
									class="btn btn-default border_none project_explorer_tool"
									onclick="fn_project_refresh();" data-toggle="tooltip"
									data-placement="bottom" data-original-title="새로고침"
									data-container="body" tooltip="refresh">
									<i class="gi gi-reload"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 끝 -->
	</nav>
	<div style="height:95%;z-index:1000;overflow: auto;" id="projectExplorer">
<!-- 	<div id="project_explorer" class="directory_treeview auto-scroll" style="height:100%;"> -->
<!-- 팬시트리 넣을 곳 -->
<table id="tree" style="z-index:1000;">
	<colgroup>
	<col width="30px">
	<col width="50px">
	<col width="350px">
	<col width="50px">
	<col width="50px">
	<col width="30px">
	<col width="30px">
	<col width="50px">
	</colgroup>

	<tbody id="root">
		<!-- Define a row template for all invariant markup: -->
		<tr  >
			<td style="display:none;" class="alignCenter"></td>
			<td style="display:none;"></td>
			<td></td>
		</tr>
	</tbody>
</table>




<!-- 팬시트리 넣을 곳 끝-->

	</div>

	</div>
	<div class="tab-pane fade" id="command_explorer_tab" >
		<nav class="navbar navbar-default margin-0px padding-0px" role="navigation">
		<div id="command_selector" class="btn-group">
			<div class="command_box">

				<div class="share_project" style="display: none;">
					<i class="gi gi-share gi-sm"></i>
				</div>
				<div class="project_name on_share text-overflow-ellipsis"></div>

				<div class="btn-group pull-right" role="group" aria-label="...">
					<button type="button" id="command_explorer_add_tool" class="btn btn-default border_none command_explorer_tool" action="add_command_explorer" data-toggle="tooltip" data-placement="bottom" data-original-title="명령어 추가" data-container="body" tooltip="add_command_explorer">
						<i class="gi gi-plus gi-medium"></i>
					</button>
					<button type="button" id="command_explorer_remove_tool" class="btn btn-default border_none command_explorer_tool" action="remove_command_explorer" data-toggle="tooltip" data-placement="bottom" data-original-title="선택된 명령어 삭제" data-container="body" tooltip="remove_selected_commands">
						<i class="gi gi-minus gi-medium"></i>
					</button>
					<button type="button" id="command_explorer_duplication_tool" class="btn btn-default border_none command_explorer_tool" action="duplicate_command_explorer" data-toggle="tooltip" data-placement="bottom" data-original-title="선택된 명령어 복제" data-container="body" tooltip="duplication_selected_commands">
						<i class="gi gi-copy gi-sm"></i>
					</button>
					<button type="button" id="command_explorer_refresh_tool" class="btn btn-default border_none command_command_tool" action="command_refresh_explorer" data-toggle="tooltip" data-placement="bottom" data-original-title="새로고침" data-container="body" tooltip="refresh">
						<i class="gi gi-reload"></i>
					</button>
					<a class="btn btn-default border_none command_command_tool" data-toggle="tooltip" data-placement="bottom" data-original-title="도움말" data-container="body" tooltip="help" href="https://help.goorm.io/learn/lecture/263/%EA%B5%AC%EB%A6%84ide-%EB%8F%84%EC%9B%80%EB%A7%90/lesson/105855/%EB%AA%85%EB%A0%B9%EC%96%B4" target="_blank"> <i class="gi gi-question gi-sm"></i>
					</a>
				</div>
			</div>
		</div>
		</nav>
		<div id="command_explorer" class="directory_treeview auto-scroll" >
			<div id="command_treeview" style="" class="jstree jstree-1 jstree-default" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="command_treeview/common" aria-busy="false">
				<ul class="jstree-container-ul jstree-children jstree-wholerow-ul" role="group">
					<li role="treeitem" path="common" folder_only="false" aria-selected="false" aria-level="1" aria-labelledby="command_treeview/common_anchor" id="command_treeview/common" class="jstree-node  jstree-leaf"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
						<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" localization_key="command_type_common" id="command_treeview/common_anchor"><i class="jstree-icon jstree-themeicon gi" role="presentation" style="display: none;"></i>공통</a></li>
					<li role="treeitem" path="build" folder_only="false" aria-selected="false" aria-level="1" aria-labelledby="command_treeview/build_anchor" aria-expanded="false" id="command_treeview/build" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
						<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" localization_key="command_type_build" id="command_treeview/build_anchor"><i class="jstree-icon jstree-themeicon gi" role="presentation" style="display: none;"></i>빌드</a></li>
					<li role="treeitem" path="run" folder_only="false" aria-selected="false" aria-level="1" aria-labelledby="command_treeview/run_anchor" aria-expanded="false" id="command_treeview/run" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
						<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" localization_key="command_type_run" id="command_treeview/run_anchor"><i class="jstree-icon jstree-themeicon gi" role="presentation" style="display: none;"></i>실행</a></li>
					<li role="treeitem" path="test" folder_only="false" aria-selected="false" aria-level="1" aria-labelledby="command_treeview/test_anchor" id="command_treeview/test" class="jstree-node  jstree-leaf"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
						<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" localization_key="command_type_test" id="command_treeview/test_anchor"><i class="jstree-icon jstree-themeicon gi" role="presentation" style="display: none;"></i>테스트</a></li>
					<li role="treeitem" path="deploy" folder_only="false" aria-selected="false" aria-level="1" aria-labelledby="command_treeview/deploy_anchor" aria-expanded="false" id="command_treeview/deploy" class="jstree-node  jstree-closed jstree-last"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
						<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" localization_key="command_type_deploy" id="command_treeview/deploy_anchor"><i class="jstree-icon jstree-themeicon gi" role="presentation" style="display: none;"></i>배포</a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>

	</div>
	<!-- 익스플로러 끝 -->

	<!-- 중간부분 시작-->
	<div id="goorm_center_inner_layout" class="ui-layout-center goorm_layout ui-layout-pane ui-layout-pane-center ui-layout-container" style="position: absolute; margin: 0px; left: 252px; right: 0px; top: 58px; height: 94%; bottom: 30px; z-index: 10; display: block; visibility: visible; overflow: hidden;">
		<div id="goorm_inner_layout_center" class="ui-inner-layout-center ui-layout-pane ui-layout-pane-center" style="position: absolute; margin: 0px; left: 0px; right: 382px; top: 0px; bottom: 20px; height: 77%; width:70%;z-index: 10; display: block; visibility: visible;">
			<div id="workspace" class="indent_guide_on" style="height: 100%; position: relative;">
				<div class="row margin-0px" style="height: 100%; position: relative;">
					<div class="col-xs-12" position="default" style=" height: 100%; ">	
						
						
						<div class=" workspace ui-droppable" id="workspace_default" style="position: relative; height: 100%;">
						<div id="g_window_1562650870717" class="window_panel tab-pane" path="workspace/laon/.settings/org.eclipse.jdt.apt.core.prefs">
<!-- 						<div class="editor_container"><textarea class="code_editor" placeholder="Code goes here..." style="display: none;">Loading Data...</textarea> -->
<!-- 코드미러 -->
						<div style=" line-height: 1.3; height: 100%;">
							<textarea class="code_editor" id="javacode" name="javacode"></textarea>
						</div>
<!-- 						코드미러넣는곳 끝-->
<!-- 						</div> -->
						<span style="display:none;" class="error_message_box"></span>
						
						<ul id="dictionary_box0" class="dictionary_box dropdown-menu" style="display: none;">
						<li class="dictionary_list">
						<div class="dictionary_list_table" style="width:100%;"></div>
						</li>
						<li class="divider" style="display:none;"></li>
						</ul>
						
		<ul class="dropdown-menu new_function_box" role="menu" aria-labelledby="dropdownMenu" style="display: none;">
		</ul>
		
	</div>
<!-- 	<div id="g_window_1562650870758" class="window_panel tab-pane active" path="workspace/laon/pom.xml"><div class="editor_container"><textarea class="code_editor" placeholder="Code goes here..." style="display: none;">Loading Data...</textarea><div class="CodeMirror cm-s-default CodeMirror-wrap" style="font-size: 12px; line-height: 1.3;">탭2코드미러넣는곳</div></div><span style="display:none;" class="error_message_box"></span><ul id="dictionary_box0" class="dictionary_box dropdown-menu" style="display: none;"><li class="dictionary_list"><div class="dictionary_list_table" style="width:100%;"></div></li><li class="divider" style="display:none;"></li></ul> -->
<!-- 		<ul class="dropdown-menu new_function_box" role="menu" aria-labelledby="dropdownMenu" style="display: none;"> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	
	</div>
					</div>
				</div>
				<div class="disconnected" style="display: none;">
					<i class="gi gi-deadface gi-4x"></i><br>
					<br>DISCONNECTED! <br> goorm is trying to reconnect the
					server...<br>But we recommend you to relaunch goorm.
				</div>
			</div>
			<div class="input-group hidden pull-right" id="edit_toolbar">
				<input id="edit_toolbar_inputbox" type="text" class="form-control" placeholder="e.g. line[:col]"> <span class="input-group-btn">
					<button class="btn btn-default" type="button" id="edit_toolbar_ok">Go</button>
				</span>
			</div>

			<div id="popup_message" class="chat_message_content my_message">
				<div id="popup_message_name" style="float: right"></div>
				<br>
				<div id="popup_message_message" class="cm-s-default triangle-border right"></div>
			</div>
			<div id="chat_user_container" class="" style="display: none;">
				<div class="container_head">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h3 class="margin-0px">
						<span localization_key="chat_joined_number">접속자</span> (<span class="chat_joined_number">1</span><span localization_key="friend_headcount">명</span>)
					</h3>
				</div>
				<div class="container_body">
					<ul class="media-list auto-scroll-y margin-0px" style="height: 40px;">
						<li class="me margin-0px" user_id="warble_ee_j4j5zmfwz" style="position: relative; display: inline-block;"><a href="#" data-toggle="tooltip" data-placement="top" data-container="body" title="" data-original-title="아드리나"><img class="user_profile_image" src="/user/profile?id=warble_ee_j4j5zmfwz&amp;timestamp=undefined"></a><span class="user_name">아드리나</span></li>
					</ul>
				</div>
			</div>

			<div id="upper_terminal_input_box">
				<input type="text" id="terminal_input_box_upper_text" class="form-control">
				<div class="pull-right">
					<button type="button" class="terminal_input_box_ok btn btn-primary" localization_key="enter">입력</button>
					<button type="button" class="terminal_input_box_close btn btn-default" localization_key="close">닫기</button>
				</div>
			</div>
			<div id="bar_find_and_replace" style="display: none;">
				<div>
					<div class="find_row">
						<select id="far_selector" class="form-control input-xs">
							<option value="find" localization_key="edit_find">찾기</option>
							<option value="replace" localization_key="replace">바꾸기</option>
							<option value="search" localization_key="search">검색</option>
						</select>
						<div id="f_input_group">
							<div class="btn-group btn-group-sm">
								<button id="g_far_btn_close" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close" data-container="body" tooltip="close" tabindex="-1">
									<i class="gi gi-close gi-sm"></i>
								</button>
							</div>
							<div class="btn-group btn-group-sm">
								<button id="g_far_btn_find_prev" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="" data-original-title="이전 찾기" data-container="body" tooltip="msg_find_previous" tabindex="-1">
									<i class="gi gi-rewind gi-sm"></i>
								</button>
								<button id="g_far_btn_find" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="" data-original-title="다음 찾기" data-container="body" tooltip="msg_find_next" tabindex="-1">
									<i class="gi gi-forward gi-sm"></i>
								</button>
							</div>

							<div class="btn-group btn-group-sm">
								<button type="button" id="far_match_case" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="대소문자 일치" tooltip="msg_project_match_case_guide" data-container="body" tabindex="-1">Aa</button>
								<button type="button" id="far_whole_word" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="단어 전체 일치" tooltip="msg_project_whole_word_guide" data-container="body" tabindex="-1">" "</button>
								<button type="button" id="far_use_regexp" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="정규식 사용하기" tooltip="msg_project_use_regular_expression_guide" data-container="body" tabindex="-1">Exp</button>
							</div>
							<div id="f_input_wrap" style="font-family: &amp; quot;">
								<textarea class="form-control input-xs" id="find_query_inputbox_background" readonly="" tabindex="-1" style="resize: none;" rows="1"></textarea>
								<span id="find_and_replace_matches"></span>
								<textarea class="form-control input-xs" id="find_query_inputbox" type="text" placeholder="찾기" autofocus="" style="resize: none;" rows="1"></textarea>
							</div>
						</div>
						<div id="s_input_group" style="display: none;">

							<button type="button" id="g_far_btn_search" class="btn btn-default btn-sm" localization_key="search">검색</button>

							<div class="btn-group btn-group-sm">
								<button type="button" id="search_match_case" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="대소문자 일치" tooltip="msg_project_match_case_guide" data-container="body" tabindex="-1">Aa</button>
								<button type="button" id="search_whole_word" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="단어 전체 일치" tooltip="msg_project_whole_word_guide" data-container="body" tabindex="-1">" "</button>
								<button type="button" id="search_use_regexp" class="btn btn-default" data-toggle="button" data-placement="top" title="" data-original-title="정규식 사용하기" tooltip="msg_project_use_regular_expression_guide" data-container="body" tabindex="-1">Exp</button>
							</div>

							<div id="s_input_wrap" style="font-family: &amp; quot;">
								<input class="form-control input-xs" id="search_query_inputbox_background" readonly="" tabindex="-1">
								<input class="form-control input-xs" id="search_query_inputbox" type="text" placeholder="검색">
							</div>
						</div>
					</div>

					<div class="replace_row">
						<div class="row">
							<div class="replace_buttons">
								<button type="button" id="g_far_btn_replace" class="btn btn-default btn-sm" localization_key="replace">바꾸기</button>
								<button type="button" id="g_far_btn_replace_all" class="btn btn-default btn-sm" localization_key="replace_all">모두
									바꾸기</button>
							</div>

							<input class="form-control input-xs" id="replace_query_inputbox" type="text" placeholder="바꾸기">
						</div>
					</div>

					<div class="search_row">
						<div class="row">
							<button type="button" id="g_s_btn_replace" class="btn btn-default btn-sm" localization_key="replace_all">모두
								바꾸기</button>
							<input class="form-control input-xs" id="s_replace_query_inputbox" type="text" placeholder="바꾸기">
						</div>

						<div class="row">
							<label for="search_path_input" class="control-label" localization_key="dialog_search_files">검색할 경로/파일</label> <input id="search_file_extension" class="form-control input-xs" placeholder="*.txt, goorm.js"> <input id="search_path_input" class="form-control input-xs search_folder" placeholder="/, /public/modules, /libs">
						</div>
						<div class="row">
							<label for="search_exclude_folders" class="control-label" localization_key="dialog_search_exclude">제외할 폴더/파일</label> <input id="search_exclude_files" class="form-control input-xs" placeholder="Files (*.txt, goorm.js)"> <input id="search_exclude_folders" class="form-control input-xs search_folder" placeholder="Directories (public, node_modules, libs)">
						</div>
					</div>


				</div>
			</div>
		</div>



		<div id="goorm_inner_layout_right" class="ui-layout-east ui-layout-pane ui-layout-pane-east" style="position: absolute; margin: 0px; left: auto; right: 0px; top: 0px; height: 77%; z-index: 10; width: 30%; display: block; visibility: visible;">

			


			<div class="tab-content" id="east_tab_content" style="display: block; height: 100%; width:100%;">

				<div class="tab-pane fade active in" id="chat" style="height:100%">
					<ul class="nav nav-pills nav-justified">
						<li class="active"><a id="li_chats" href="#chats" data-toggle="tab" localization_key="chats" aria-expanded="true"><font size="2pt">채팅</font><span id="chats_badge" class="badge"></span>
						</a></li>
			 <!-- 은지 --><li class=""><a id="cobiReady" href="#cobi" data-toggle="tab" localization_key="friends" aria-expanded="false"><font size="2pt">코비</font></a></li>
						<li class=""><a href="#obi" data-toggle="tab" localization_key="co_workers" aria-expanded="false"><font size="2pt">오비</font></a></li>
					</ul>
<!-- 은혜 길이 수정 -->
					<div class="tab-content" style="height:96%">
						<div class="tab-pane fade active in" id="chats" style="height: 100%;">
							<div id="chat_list" style="display: none;">
								<div id="workspace_list_container" class="friend_list">
									<div class="chat_list_title" localization_key="share_project_chat">워크스페이스</div>
									<ul class="media-list margin-0px">
										<li class="media user-select margin-0px"><a href="#">
												<img class="user_profile_image" src="/images/group_image.png">
										</a>
											<div class="user_info">
												<span class="user_name">laon</span> (<span class="chat_joined_number">1</span><span localization_key="friend_headcount">명</span>) <span class="user_new_message_area badge"></span><br> <span class="time"></span>
											</div></li>
									</ul>
								</div>
								<div id="friend_list_container" class="friend_list">
									<div class="chat_list_title margin-0px" localization_key="individual_chats">1:1 채팅</div>
									<ul class="media-list margin-0px" style="height: 597px;">

									</ul>
								</div>
							</div>
							<!-- 채팅을 위한 은혜 수정 시작 -->
							<div id="chat_room" style="height:82%">

								<div id="chat_plugins" style="height:100%">
									<ul class="dropdown-menu" id="emoticon_box">
										<li class="emoticon_line"><span class="emoticon emoticon-cool-icon" val="B-)"></span><span class="emoticon emoticon-razz-icon" val=":(-)"></span><span class="emoticon emoticon-cry-icon" val=":("></span><span class="emoticon emoticon-smiley-icon" val="=D"></span><span class="emoticon emoticon-sleep-icon" val="-_z"></span><span class="emoticon emoticon-red-icon" val="-_("></span><span class="emoticon emoticon-angel-icon" val="O:)"></span><span class="emoticon emoticon-confuse-icon" val="o~o"></span><span class="emoticon emoticon-eek-blue-icon" val="o_o!"></span><span class="emoticon emoticon-eek-icon" val="o_o"></span></li>
										<li class="emoticon_line"><span class="emoticon emoticon-evil-icon" val="oVo"></span><span class="emoticon emoticon-kiss-icon" val="O,O"></span><span class="emoticon emoticon-lol-icon" val=":D"></span><span class="emoticon emoticon-money-icon" val="$_$"></span><span class="emoticon emoticon-nerd-icon" val="@_@"></span><span class="emoticon emoticon-neutral-icon" val=":-/"></span><span class="emoticon emoticon-roll-blue-icon" val="Q_Q!"></span><span class="emoticon emoticon-roll-sweat-icon" val="Q_Q;"></span><span class="emoticon emoticon-roll-icon" val="Q_Q"></span><span class="emoticon emoticon-sad-blue-icon" val="q_q!"></span></li>
										<li class="emoticon_line"><span class="emoticon emoticon-sad-icon" val="q_q"></span><span class="emoticon emoticon-sweat-icon" val="-_-;"></span><span class="emoticon emoticon-wink-icon" val="o_-"></span><span class="emoticon emoticon-mad-icon" val=";("></span><span class="emoticon emoticon-clock-icon" val="(@)"></span><span class="emoticon emoticon-bug-icon" val="9~~"></span><span class="emoticon emoticon-arrow-r-icon" val="-)"></span><span class="emoticon emoticon-arrow-u-icon" val="^/"></span><span class="emoticon emoticon-arrow-l-icon" val="(-"></span><span class="emoticon emoticon-arrow-d-icon" val="v/"></span></li>
									</ul>
								</div>
								<div id="chat_all" style="height:100%">

									<div class="new_msg_info alert alert-info" style="display: none;">
										<i class="gi gi-new_message"></i> <span class="new_msg_thumbnail">You've got a new message.</span>
										<button type="button" class="close">
											<i class="gi gi-close"></i>
										</button>
									</div>
									<div class="well well-sm chat_message_container user-select-available" style="height: 100%;" id="laon_chat_con">
<!-- 반복되는 부분 -->
<c:forEach items="${chatlist}" var="chatInfo">
	<c:if test="${LOGIN_MEMBERINFO.mem_id ne chatInfo.mem_id}">
		<div class="talk media">
			<div class="media-body chat_message_content other_message" style="padding-left: 15px;">
				<h5 class="media-heading left">
					<span class="chat_msg_author"  style="font-size:9pt;">${chatInfo.mem_nick}</span><span class="chat_msg_time"  style="font-size:9pt;">${chatInfo.chat_time}</span></font>
				</h5>
				<div class="cm-s-default triangle-border left">
					<div class="continue_message">
						<div class="msg_body" style="max-width: 250px; font-size: 10pt;">${chatInfo.chat_cont}</div>
						<div class="unread_box">
							<span class="unread_area badge" style="font-family: &amp; quot;"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
<!-- 	내가쓴채팅일 경우 -->
	<c:if test="${LOGIN_MEMBERINFO.mem_id eq chatInfo.mem_id}">
		<div class="talk row">
			<div class="media-body chat_message_content my_message" value="warble_ee_j4j5zmfwz">
				<h5 class="media-heading" >
					<span class="chat_msg_author"></span><span class="chat_msg_time"  style="font-size:9pt;">${chatInfo.chat_time}</span></font>
				</h5>
				<div class="cm-s-default triangle-border right">
					<div class="continue_message">
						<div class="unread_box">
							<span class="unread_area badge" style="font-family: &amp; quot;"></span>
						</div>
						<div class="msg_body" style="max-width: 250px; font-size: 10pt;">
							${chatInfo.chat_cont}</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
	<!-- 반복되는 부분 끝 -->
										
										
									</div>
								</div>
								
								<div id="chat_one" style="height: 543px; display: none;">
									
									<div class="new_msg_info alert alert-info">
										<i class="gi gi-new_message"></i> <span class="new_msg_thumbnail">You've got a new message.</span>
										<button type="button" class="close">
											<i class="gi gi-close"></i>
										</button>
									</div>
									<div class="well well-sm sub_chat_message_container margin-3px user-select-available" style="height: 452px;">
										<div id="user-history_chat" class="alert alert-warning" style="cursor: auto;"></div>
									</div>
								</div>
								<div class="chat_message_input_container toolbar-container" style="height:100%">
									
									<div id="input_chat_message_container"><br>
    
										<textarea id="input_chat_message" style="height:100%; font-size: 13px;" placeholder="팀원들과 하고싶은 이야기를 쓰고 Enter를 누르세요." class="form-control" rows="4" localization_key="type_message"></textarea>
										<canvas id="chat_hidden_canvas" style="display:none"></canvas>
										<div id="chat_hidden_div" contenteditable="true"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- 채팅을 위한 은혜 수정 끝 -->
						<!-- 은지 -->						
						<!-- 코비 탭 누르면 나오는 화면 시작 -->
						<div class="tab-pane fade" id="cobi" style="height:100%; overflow:auto;">
							<div id="collaboration_tab_container" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default" style="height:100%; overflow:auto;">
									<div class="panel-heading mic_cont_cobi" role="tab" id="heading_laon">
										<div id="info_cobi" >
											<div id="info_start_cobi" style="display: none;">
												<!-- 재생 정지 버튼 추가하기 -->
												<button type="button" id="start_button_cobi" onclick="startButton_cobi(event)" class="btn btn-default" tooltip="Play" style="width:30px;margin:auto">
													<i style="position: relative; top: -1px;" class="gi gi-play gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;">
													&nbsp;클릭해서 코비에게 실행시킬 명령을 내려보세요!
												</span>
											</div>
										<!-- 입력을 중지하고 싶을 때 출력되는 정지 아이콘 -->
											<div id="info_speak_now_cobi" style="display: none;">
												<button id="stop_rec_cobi" type="button" class="btn btn-default" tooltip="Stop" style="width:30px;margin:auto" >
													<i style="position: relative; top: -1px;" class="gi gi-pause gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;" >
													&nbsp;명령어를 말씀해주세요.
												</span>
											</div>
											<!-- 입력결과가 없을 때 출력되는 분  -->
											<div id="info_no_speech_cobi" style="display: none;">
												<!-- 재생 정지 버튼 추가하기 -->
												<button type="button" onclick="startButton_cobi(event)" class="btn btn-default" tooltip="Play" style="width:30px;margin:auto;">
													<i style="position: relative; top: -1px;" class="gi gi-play gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;">
													&nbsp;명령어가 인식되지 않았어요. 다시 한번 클릭해주세요.
												</span>
											</div>
										</div>
									</div>
									<div id="collapse_laon_cobi" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_laon_cobi" style="height:100%; overflow:auto;">
										<div class="panel-body" style="height:100%; overflow:auto;">
											<div class="empty_content" style="padding: 0px; height:100%; overflow:auto;">
											<!-- div 채팅방 내용 시작 -->
												<div class="well well-sm chat_message_container user-select-available" style="height: 100%;" id="cobi_container">
													<!-- 코비 실행 안했을 경우 출력되는 부분 -->
													<br/>
														<span class="chat_msg_author" id="cobi_off_status">
															 코비 실행을 원하시면<br/>
															 상단 코비버튼을 클릭해주세요!
															 <br/>
															 <img alt="" style="border-radius: 45%;width: 200px;margin-top: 10px;"  
															 	  src="${pageContext.request.contextPath }/assets/images/AI/cobiWait2.png">
														</span>
													<!-- 코비가 실행될 경우 출력되는 부분 -->
												</div>
												<!-- div 채팅방 내용 끝 -->
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 코비 탭 누르면 나오는 화면 끝 -->

						
						<!-- 혜영  -->
						<!-- 오비 탭 누르면 나오는 화면 시작 -->
						<div class="tab-pane fade" id="obi" style="height:100%; overflow:auto;">
							<div id="collaboration_tab_container" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default" style="height:100%; overflow:auto;">
									<div class="panel panel-default" style="height:100%; overflow:auto;">
									<div class="panel-heading mic_cont" role="tab" id="heading_laon">
										<div id="info" >
											<div id="info_start" style="display: none;">
												<!-- 재생 정지 버튼 추가하기 -->
												<button type="button" id="start_button" onclick="startButton(event)" class="btn btn-default" tooltip="Play" style="width:30px;margin:auto">
													<i style="position: relative; top: -1px;" class="gi gi-play gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;">
													&nbsp;클릭해서 오비에게 실행시킬 명령을 내려보세요!
												</span>
											</div>
										<!-- 입력을 중지하고 싶을 때 출력되는 정지 아이콘 -->
											<div id="info_speak_now" style="display: none;">
												<button id="stop_rec" type="button" class="btn btn-default" tooltip="Stop" style="width:30px;margin:auto" >
													<i style="position: relative; top: -1px;" class="gi gi-pause gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;" >
													&nbsp;명령어를 말씀해주세요.
												</span>
											</div>
											<!-- 입력결과가 없을 때 출력되는 분  -->
											<div id="info_no_speech" style="display: none;">
												<!-- 재생 정지 버튼 추가하기 -->
												<button onclick="startButton(event)" type="button" class="btn btn-default" tooltip="Play" style="width:30px;margin:auto;">
													<i style="position: relative; top: -1px;" class="gi gi-play gi-sm"></i>
												</button>
												<span class="chat_msg_author ai_span_cont" style="position: relative;">
													&nbsp;명령어가 인식되지 않았어요. 다시 한번 클릭해주세요.
												</span>
											</div>
										</div>
									</div>
									<div id="collapse_laon" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_laon" style="height:100%; overflow:auto;">
										<div class="panel-body" style="height:100%; overflow:auto;">
											<div class="empty_content" style="padding: 0px; height:100%; overflow:auto;">
											<!-- div 채팅방 내용 시작 -->
												<div class="well well-sm chat_message_container user-select-available" style="height: 100%;" id="obi_Container">
													<!-- 오비 실행 안했을 경우 출력되는 부분 -->
														<br/>
														<span class="chat_msg_author" id="obi_off_status">
															 오비 실행을 원하시면<br/>
															 상단 오비버튼을 클릭해주세요!
															 <br/>
<!-- 															 <img alt="" style="border-radius: 45%;width: 100px;margin-top: 10px;"   -->
<%-- 															 	  src="${pageContext.request.contextPath }/images/obiwaiting.png"> --%>
																<img alt="" style="border-radius: 45%;width: 200px;margin-top: 10px;"  
															 	  src="${pageContext.request.contextPath }/assets/images/AI/obiWait2.png">
														</span>
													<div>
														
													</div>
													<!-- 오비가 실행될 경우 출력되는 부분 -->
													
													<!-- 사용자가 오비 호출했을 경우 나오는 div 시작 -->
													<!-- 사용자가 오비 호출했을 경우 나오는 div 끝 -->
													
													<!-- 오비일 경우 나오는 div 시작 -->
													<!-- 오비일 경우 나오는 div 끝 -->
													
													<!-- 사용자일 경우 나오는 div 시작. 음성인식했을 경우 출력 부분 -->
													
													<!-- 사용자일 경우 나오는 div 끝 -->
													<!-- 오류가 발생했을 경우 출력 화면 -->
													
												</div>
												<!-- div 채팅방 내용 끝 -->
											</div>
<!-- 											<table cellpadding="0" cellspacing="0" border="0" class="display treetable" id="collaboration_user_table_laon"> -->
<!-- 											</table> -->

										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 오비 탭 누르면 나오는 화면 끝 -->

						</div>
						
					</div>
				</div>
				<div class="tab-pane fade" id="document_viewer" style="">
					<div id="document_viewer_header">
						<div id="select_body">
							<select id="document_viewer_list" class="form-control" autocomplete="off">
								<option value="slideshare_share" localization_key="slideshare_Viewer" selected="">Slideshare.net
									뷰어</option>
								<option value="pdf_viewer" localization_key="pdf_Viewer">PDF
									뷰어</option>
							</select>
						</div>
					</div>
					<div id="document_viewer_body">
						<div id="document_viewer_slideshare" class="document_viewer_content">
							<nav id="slideshare_toolbar" class="navbar navbar-default" role="navigation">
							<div class="collapse navbar-collapse">
								<ul class="nav navbar-nav">
									<div id="slideshare_url_input" class="input-group">
										<div class="input-group-btn">
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-original-title="" title="">
												URL <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" style="width: 0px;">
												<li class="slideshare_url_guide"><a href="#">No
														data to display</a></li>
											</ul>
										</div>
										<input id="slideshare_url" type="text" class="form-control">

										<div id="slideshare_control" class="input-group-btn">
											<button type="button" id="slideshare_prev" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="이전" tooltip="Previous" data-container="body">
												<i class="gi gi-rewind gi-sm"></i>
											</button>
											<button type="button" id="slideshare_presentation" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="실행" tooltip="Play" data-container="body">
												<i class="gi gi-play gi-sm"></i>
											</button>
											<button type="button" id="slideshare_next" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="다음" tooltip="Next" data-container="body">
												<i class="gi gi-forward gi-sm"></i>
											</button>
											<button type="button" data-toggle="tooltip" data-placement="top" title="" data-original-title="팔레트" data-container="body" tooltip="Palette" id="slideshare_draw_bt" class="btn btn-default">
												<div class="toolbar_button">
													<i class="gi gi-drawing"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Canvas" data-container="body" tooltip="View Canvas" id="slideshare_view_bt" class="btn btn-default">
												<i class="gi gi-canvas"></i>
											</button>
											<button id="slideshare_connect" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="연결" tooltip="Connect with co-developers" data-container="body">
												<i class="gi gi-disconnected"></i>
											</button>
										</div>
									</div>
								</ul>
							</div>
							</nav>

							<div id="slideshare_drawing_container" style="display: none;">
								<nav id="slideshare_bt_container" class="navbar navbar-default" role="navigation">
								<div id="slideshare_control_bt_container" class="collapse navbar-collapse">
									<ul id="slideshare_draw_control_bt_container" class="nav navbar-nav">
										<div class="btn-group">
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="연필" data-container="body" tooltip="Pencil" id="slideshare_pen_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-pencil"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="지우개" data-container="body" tooltip="Erase" id="slideshare_erase_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-eraser"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="색상표" tooltip="Color Wheel" id="slideshare_color_wheel_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-colorpicker"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="연필 두께" tooltip="Size Slider" id="slideshare_brush_size_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-thickness"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="모두 지우기" tooltip="Erase All" id="slideshare_erase_all_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-sweep"></i>
												</div>
											</button>
										</div>
									</ul>
									<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
										<div class="goorm-bubble-arrowimplbefore"></div>
										<div class="goorm-bubble-arrowimplafter"></div>
									</div>
								</div>
								</nav>
							</div>
							<div id="slideshare_brush_container" style="display: none;">
								<div id="slideshare_brush_slider">
									<div id="slideshare_sliderbg" class="bfh-slider" data-name="slider1" data-value="3" data-min="1" data-max="10"><input type="hidden" name="slider1" value="3"><div class="bfh-slider-handle" style="left: -15px;"><div class="bfh-slider-value">3</div></div></div>
								</div>
								<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
									<div class="goorm-bubble-arrowimplbefore"></div>
									<div class="goorm-bubble-arrowimplafter"></div>
								</div>
							</div>
							<div id="slideshare_palette_container" style="display: none;">
								<div id="slideshare_palette" class="bfh-colorpicker" data-name="colorpicker1"><div class="input-group bfh-colorpicker-toggle" data-toggle="bfh-colorpicker"><span class="input-group-addon"><span class="bfh-colorpicker-icon" style="background-color: rgb(0, 0, 0);"></span></span><input type="text" name="colorpicker1" class="form-control" placeholder="" readonly=""></div><div class="bfh-colorpicker-popover"><canvas class="bfh-colorpicker-palette" width="384" height="256"></canvas></div></div>
								<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
									<div class="goorm-bubble-arrowimplbefore"></div>
									<div class="goorm-bubble-arrowimplafter"></div>
								</div>
							</div>
							<div id="slideshare_real_eraser" style="z-index: 3; display: none; position: absolute; width: 15px; height: 15px; border: 1px solid #000; background-color: #fff;"></div>

							<canvas id="slideshare_draw_canvas" tabindex="1" width="100" height="578" style="width: 100px; height: 578px;"></canvas>

							<div id="slideshare_iframe" style="height: 580px;">
								<iframe id="iframe_slideshare" src="" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="height: 578px;">Slideshare.net Viewer</iframe>
							</div>
						</div>
						<div id="document_viewer_pdf" class="document_viewer_content" style="display: none;">
							<nav id="pdf_toolbar" class="navbar navbar-default" role="navigation">
							<div id="pdf_control_bt_container" class="collapse navbar-collapse">
								<ul class="nav navbar-nav">
									<div class="input-group">
										<div class="input-group-btn">
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="이전" tooltip="Previous" id="pdf_prev" class="btn btn-default pdf_prev" data-container="body">
												<div class="toolbar_button">
													<i class="gi gi-rewind gi-sm"></i>
												</div>
											</button>
										</div>

										<input id="goto_page" class="form-control goto_page" type="text" style="width: 50px;"> <span class="page_counter"></span>
										<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="다음" data-container="body" tooltip="Next" id="pdf_next" class="btn btn-default pdf_next" style="float: left;">
											<div class="toolbar_button">
												<i class="gi gi-forward gi-sm"></i>
											</div>
										</button>

										<div class="input-group-btn ">

											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="새 창" tooltip="New Window" id="pdf_new_window_bt" class="btn btn-default">
												<div class="toolbar_button">
													<i class="gi gi-popup"></i>
												</div>
											</button>
										</div>

										<div class="input-group-btn">
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="확대" data-container="body" tooltip="Magnify" id="magnify_pdf" class="btn btn-default magnify_pdf">
												<div class="toolbar_button">
													<i class="gi gi-magnifier-plus"></i>
												</div>
											</button>

											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="축소" data-container="body" tooltip="Minify" id="reduce_pdf" class="btn btn-default reduce_pdf">
												<div class="toolbar_button">
													<i class="gi gi-magnifier-minus"></i>
												</div>
											</button>
										</div>

										<div id="draw_control_bt_container" class="input-group-btn">
											<button type="button" data-toggle="tooltip" data-placement="top" title="" data-original-title="팔레트" data-container="body" tooltip="Palette" id="pdf_draw_bt" class="btn btn-default">
												<div class="toolbar_button">
													<i class="gi gi-drawing"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Canvas" data-container="body" tooltip="View Canvas" id="pdf_view_bt" class="btn btn-default">
												<i class="gi gi-canvas"></i>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="연결/연결종료" tooltip="Connect/Disconnect" id="pdf_connect_bt" class="btn btn-default">
												<div class="toolbar_button">
													<i class="gi gi-disconnected"></i>
												</div>
											</button>
										</div>
									</div>
								</ul>
							</div>
							</nav>

							<div id="pdf_drawing_container" style="display: none;">
								<nav id="pdf_drawing_bt_container" class="navbar navbar-default" role="navigation">
								<div id="slideshare_control_bt_container" class="collapse navbar-collapse">
									<ul id="slideshare_draw_control_bt_container" class="nav navbar-nav">
										<div class="btn-group">
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="연필" data-container="body" tooltip="Pencil" id="pdf_pen_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-pencil"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="지우개" data-container="body" tooltip="Erase" id="pdf_erase_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-eraser"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="색상표" tooltip="Color Wheel" id="pdf_color_wheel_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-colorpicker"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="연필 두께" tooltip="Size Slider" id="pdf_brush_size_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-thickness"></i>
												</div>
											</button>
											<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="모두 지우기" tooltip="Erase All" id="pdf_erase_all_bt" class="btn btn-default">
												<div class="toolbar_button inactive">
													<i class="gi gi-sweep"></i>
												</div>
											</button>
										</div>
									</ul>
									<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
										<div class="goorm-bubble-arrowimplbefore"></div>
										<div class="goorm-bubble-arrowimplafter"></div>
									</div>
								</div>
								</nav>
							</div>

							<div id="pdf_brush_container" style="display: none;">
								<div id="pdf_brush_slider">
									<div id="pdf_sliderbg" class="bfh-slider" data-name="slider1" data-value="3" data-min="1" data-max="10"><input type="hidden" name="slider1" value="3"><div class="bfh-slider-handle" style="left: -15px;"><div class="bfh-slider-value">3</div></div></div>
								</div>
								<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
									<div class="goorm-bubble-arrowimplbefore"></div>
									<div class="goorm-bubble-arrowimplafter"></div>
								</div>
							</div>

							<div id="pdf_palette_container" style="display: none;">
								<div id="pdf_palette" class="bfh-colorpicker" data-name="colorpicker1"><div class="input-group bfh-colorpicker-toggle" data-toggle="bfh-colorpicker"><span class="input-group-addon"><span class="bfh-colorpicker-icon" style="background-color: rgb(0, 0, 0);"></span></span><input type="text" name="colorpicker1" class="form-control" placeholder="" readonly=""></div><div class="bfh-colorpicker-popover"><canvas class="bfh-colorpicker-palette" width="384" height="256"></canvas></div></div>
								<div class="goorm-bubble-arrow-id goorm-bubble-arrow goorm-bubble-arrowup">
									<div class="goorm-bubble-arrowimplbefore"></div>
									<div class="goorm-bubble-arrowimplafter"></div>
								</div>
							</div>
							<div id="pdf_canvas_container" class="canvas_container" style="width: 0px; height: 638px;">
								<div id="pdf_real_eraser" style="z-index: 3; display: none; position: absolute; width: 15px; height: 15px; border: 1px solid #000; background-color: #fff;"></div>
								<canvas id="pdf_draw_canvas" tabindex="1"></canvas>
								<canvas id="pdf_canvas" tabindex="1"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="source_code">
					<ul class="nav nav-pills nav-justified">

						<li class="active"><a href="#history" data-toggle="tab" id="gLayoutTab_History" localization_key="history">작업 내역</a></li>
						<li style="display: table-cell;"><a href="#outline" data-toggle="tab" id="gLayoutTab_Outline" localization_key="outline">아웃라인</a></li>
						<li><a href="#bookmark" data-toggle="tab" id="gLayoutTab_Bookmark" localization_key="edit_bookmark">북마크</a>
						</li>
						<li><a href="#breakpoint" data-toggle="tab" id="gLayoutTab_Breakpoint" localization_key="edit_breakpoint">중단점</a>
						</li>


					</ul>

					<div class="tab-content">

						<div class="tab-pane fade in active" id="history">
							<nav id="history_player_control" class="navbar navbar-default" role="navigation">
							<div id="history_player_control_toolbar" class="collapse navbar-collapse">
								<ul class="nav navbar-nav">
									<div class="btn-group">
										<button type="button" class="btn btn-default history_item history_header history_selected disabled" localization_key="history_show_current" data-original-title="" title="">현재 상태 보기</button>
									</div>
									<div class="btn-group">
										<div class="btn-group">
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" localization_key="speed" data-original-title="" title="">
												속도 <span class="caret caret_padding"></span>
											</button>
											<ul class="dropdown-menu" id="history_selectbox">
												<li><a href="#" value="50" class="selected" localization_key="history_speed_veryfast" applied=""> <span class="menu-applied menu-prepend"> <span class="gi gi-ok"></span>
													</span>매우 빠르게
												</a></li>
												<li><a href="#" value="200" localization_key="history_speed_fast">빠르게</a></li>
												<li><a href="#" value="400" localization_key="history_speed_normal">보통속도</a></li>
												<li><a href="#" value="800" localization_key="history_speed_slow">천천히</a></li>
												<li><a href="#" value="1200" localization_key="history_speed_veryslow">매우 천천히</a></li>
											</ul>
										</div>
										<button type="button" id="btn_history_play" class="btn btn-default disabled" data-container="body" data-placement="bottom" title="" data-original-title="실행" tooltip="Play">
											<div class="toolbar_button">
												<i class="gi gi-play gi-sm"></i>
											</div>
										</button>
										<button type="button" id="btn_history_pause" class="btn btn-default disabled" data-container="body" data-placement="bottom" title="" data-original-title="일시정지" tooltip="Pause">
											<div class="toolbar_button">
												<i class="gi gi-pause gi-sm"></i>
											</div>
										</button>
										<button type="button" id="btn_history_stop" class="btn btn-default disabled" data-container="body" data-placement="bottom" title="" data-original-title="정지" tooltip="Stop">
											<div class="toolbar_button">
												<i class="gi gi-stop gi-sm"></i>
											</div>
										</button>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-default disabled" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="작업 내역 되돌리기" data-container="body" tooltip="History Rollback">
											<div class="toolbar_button">
												<i id="btn_history_rollback" class="rollback gi gi-rollback"></i>
											</div>
										</button>
										<button type="button" class="btn btn-default history_delete_buttons disabled" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="작업 내역 삭제" data-container="body" tooltip="History Delete">
											<div class="toolbar_button">
												<div id="btn_history_delete" class="delete gi gi-delete"></div>
											</div>
										</button>
										<button type="button" class="btn btn-default history_delete_buttons disabled" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="작업 내역 모두 삭제" data-container="body" tooltip="History Delete All">
											<div class="toolbar_button">
												<div id="btn_history_delete_all" class="delete gi gi-trash"></div>
											</div>
										</button>
									</div>
									<div class="btn-group btn_history_back" style="display: none;">
										<button type="button" class="btn btn-default disabled" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="돌아가기" data-container="body" tooltip="back">
											<div class="toolbar_button">
												<div id="btn_history_back" class="gi gi-back"></div>
											</div>
										</button>
									</div>
								</ul>
							</div>
							</nav>
							<div id="history_container_wrapper" class="dataTables_wrapper" role="grid" style="width: 355px; height: 582px;">
								<div class=""></div>
								<table id="history_container" class="display table table-hover table-condensed dataTable">
									<thead>
										<tr role="row">
											<th class="col_committer sorting" tabindex="0" rowspan="1" colspan="1" style="width: 0px;" aria-label="Name: activate to sort column ascending"><span localization_key="dictionary_name">이름</span></th>
											<th class="col_time sorting_desc" tabindex="0" rowspan="1" colspan="1" style="width: 0px;" aria-sort="descending" aria-label="Save Time: activate to sort column ascending"><span localization_key="dictionary_history_time">저장 시간</span></th>
											<th class="col_count sorting" tabindex="0" rowspan="1" colspan="1" style="width: 0px;" aria-label="Event: activate to sort column ascending"><span localization_key="dictionary_event">이벤트</span></th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="odd">
											<td valign="top" colspan="3" class="dataTables_empty">기록이
												존재하지 않습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="sub_history_container_wrapper" class="dataTables_wrapper" role="grid" style="display: none; height: 584px;">
								<div class=""></div>
								<table id="sub_history_container" class="display table table-hover table-condensed dataTable">
									<thead>
										<tr role="row">
											<th class="col_committer sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 0px;"><span localization_key="dictionary_name">이름</span></th>
											<th class="col_time sorting_desc" tabindex="0" rowspan="1" colspan="1" aria-sort="descending" aria-label="Save Time: activate to sort column ascending" style="width: 0px;"><span localization_key="dictionary_history_time">저장 시간</span></th>
											<th class="col_event sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Event: activate to sort column ascending" style="width: 0px;"><span localization_key="dictionary_event">이벤트</span></th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="odd">
											<td valign="top" colspan="3" class="dataTables_empty"><span localization_key="history_empty">기록이 존재하지 않습니다.</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="outline">
							<div id="outline_wrapper">
								<div id="current_outline_wrapper">
									<div id="current_outline" class="padding-5px">HomeController.java</div>
								</div>
								<div id="object_tree_wrapper">
									<div id="object_tree" style="height: 593px;" class="jstree jstree-9 jstree-default" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="#/io.goorm.example/1" aria-busy="false">
										<ul class="jstree-container-ul jstree-children jstree-wholerow-ul" role="group">
											<li role="treeitem" name="io.goorm.example" path="#/io.goorm.example/1" line="1" aria-selected="false" aria-level="1" aria-labelledby="#/io.goorm.example/1_anchor" id="#/io.goorm.example/1" class="jstree-node  jstree-leaf"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
												<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="#/io.goorm.example/1_anchor"><i class="jstree-icon jstree-themeicon gi gi-package  gi-extention " role="presentation"></i>1: io.goorm.example</a></li>
											<li role="treeitem" name="HomeController" path="#/HomeController/12" line="12" aria-selected="false" aria-level="1" aria-labelledby="#/HomeController/12_anchor" aria-expanded="false" id="#/HomeController/12" class="jstree-node  jstree-closed jstree-last"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div>
												<i class="jstree-icon jstree-ocl gi gi-fix" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="#/HomeController/12_anchor"><i class="jstree-icon jstree-themeicon gi gi-class  gi-extention " role="presentation"></i>12: HomeController</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>



						<div class="tab-pane fade" id="bookmark">
							<div class="panel-group" id="bookmark_tab">
								<div class="panel panel-default">
									<div id="bookmark_contents" style="height: 623px;">
										<div id="bookmark_tab_list" class="panel-collapse collapse in force_full_height">
											<table class="table table-hover table-condensed">
												<tbody id="bookmark_table" class="cm-s-monokai">
													<tr>
														<td class="padding-10px" localization_key="edit_no_bookmark">북마크가 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="breakpoint">
							<div class="panel-group" id="breakpoint_tab">
								<div class="panel panel-default">
									<div id="breakpoint_contents" style="height: 623px;">
										<div id="breakpoint_tab_list" class="panel-collapse collapse in force_full_height">
											<table class="table table-hover table-condensed">
												<tbody id="breakpoint_table" class="cm-s-monokai">
													<tr>
														<td class="padding-10px" localization_key="edit_no_breakpoint">중단점이 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		
		<!-- 아래부분 시작 -->
		
		<div id="goorm_inner_layout_bottom" class="ui-layout-south ui-layout-pane ui-layout-pane-south" style="position: absolute; overflow:auto; margin: 0px; top: auto; bottom: 0px; left: 0px; right: 0px; width: auto; z-index: 10; height: 23%; width:100%; display: block; visibility: visible;">

			<ul id="south_tab" class="nav nav-tabs ui-sortable">

				<li class="ui-sortable-handle" style="display: none;"><a href="#debug_tab" data-toggle="tab" id="gLayoutTab_Debug" localization_key="debug" aria-expanded="false">디버그</a></li>

				<li id="gLayoutLi_Terminal" class="ui-sortable-handle active">
					<a href="#terminal" data-toggle="tab" id="gLayoutTab_Terminal" aria-expanded="true"> <span localization_key="terminal">콘솔</span>
<!-- 						<span class="badge cursor-pointer" action="refresh_bottom_terminal" style="margin-bottom: -1px; display: inline-table;"> <i class="gi gi-reload3" style="font-size: 8px;"></i> -->
<!-- 					</span> -->
				</a>
				</li>
				
				<button type="button" id="south_tab_toggle_btn" class="btn btn-default ui-sortable-handle">
					<i class="gi gi-caret-up"></i> <i class="gi gi-caret-down"></i>
				</button>
				
			</ul>

			<div class="tab-content" style="overflow: hidden; height: 90%;" tabindex="0">

				<div class="tab-pane fade" id="debug_tab" style="height: 173px;">
					<div id="debug_wrapper" style="height: 173px;">
						<div id="debug_left" style="height: 173px;"></div>
						<div id="debug_tab_center" class="row" style="height: 173px;">
							<div class="debug_tab_table_container col-md-6 padding-0px resize_height">
								<div class="debug_variable_processing resize_height">
									<div class="debug_spinner">
										<div class="debug_rect1"></div>
										<div class="debug_rect2"></div>
										<div class="debug_rect3"></div>
										<div class="debug_rect4"></div>
										<div class="debug_rect5"></div>
									</div>
								</div>
								<div class="panel panel-default resize_height" style="border: none;">
									<div id="debug_tab_center_table_wrapper" class="dataTables_wrapper" role="grid" style="overflow: auto; height: 173px;">
										<div class=""></div>
										<table cellpadding="0" cellspacing="0" border="0" class="display table table-hover table-condensed dataTable" id="debug_tab_center_table" style="table-layout: fixed;">
											<thead>
												<tr role="row">
													<th class="sorting_disabled" tabindex="0" rowspan="1" colspan="1" style="width: 20%;"><span localization_key="variable">변수</span></th>
													<th class="sorting_disabled" tabindex="0" rowspan="1" colspan="1" style="width: 41%;"><span localization_key="value">값</span></th>
													<th class="sorting_disabled" tabindex="0" rowspan="1" colspan="1"><span localization_key="summary">요약</span></th>
												</tr>
											</thead>
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<tr class="odd">
													<td valign="top" colspan="3" class="dataTables_empty">N/A</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="debug_tab_console_container col-md-6 padding-0px resize_height">
								<div class="panel panel-default resize_height" style="border: none;">
									<div id="debug_console_header" class="panel-heading ui-resizable">
										<span localization_key="console">콘솔</span> <i class="debug_loading gi gi-spinner gi-sm do_spin" style="display: none; position: relative; top: 0.5px; font-size: 12px; margin-left: 2px"></i>
										<span class="debug_domain_container"> <a class="debug_domain" target="_blank"></a> <i class="copy_debug_domain clipboard_copy gi gi-copy" data-clipboard-text="" style="cursor: pointer;"></i>
										</span> <span class="node_debug_domain_container"> <a class="debug_domain" target="_blank"></a> <i class="copy_debug_domain clipboard_copy gi gi-copy" data-clipboard-text="" style="cursor: pointer;"></i>
										</span>
										<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
									</div>
									<div id="debug_console_terminal" style="height: 173px;">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane terminal active in" id="terminal" spellcheck="false" data-terminal-name="default_terminal" style="width: 100%;">
					<div class="terminal xterm xterm-theme-default xterm-cursor-blink" tabindex="0">
						<div class="xterm-viewport" style="line-height: 15px; height: 150px;">
							<div class="xterm-scroll-area" style="height: 165px;"></div>
						</div>
						<div class="xterm-helpers" style="font-family: &amp; quot; Source Code Pro&amp;quot;; font-size: 12px; line-height: 1.3; color: rgb(255, 255, 255);">
							<textarea class="xterm-helper-textarea" autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0"></textarea>
							<div class="composition-view"></div>
							<style>
.xterm-wide-char {
	width: 14.40625px;
}
</style>
<!--  종운  -->
							<span aria-hidden="true" style="position: absolute; top: 0px; left: -9999em;">W</span>
						</div>
						<div class="xterm-rows" style="font-family: &amp; quot; Source Code Pro&amp;quot;; font-size: 15px; line-height: 1.3; color: rgb(255, 255, 255);">
							<div id="output" name="output" style="white-space: pre-wrap;" >
<!-- 								<span id="output" name="output" class="xterm-color-10">root@goorm</span><span>:</span><span class="xterm-color-12">/workspace/laon</span><span>#</span>&nbsp;<span class="reverse-video terminal-cursor">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
							</div>
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!-- 							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
						</div>
<!--  종운  -->
					</div>
				</div>
				
				
			</div>

			<div id="bottom_terminal_input_box">
				<input type="text" id="terminal_input_box_bottom_text" class="form-control">
				<div class="pull-right">
					<button type="button" class="terminal_input_box_ok btn btn-primary" localization_key="enter">입력</button>
					<button type="button" class="terminal_input_box_close btn btn-default" localization_key="close">닫기</button>
				</div>
			</div>

		</div>
		<!-- 콘솔부분 끝 -->
		
		
	</div>
	<!-- 중간부분 끝-->
	</div>
	
	
	
<!-- 은혜 모달창 띄우기 위한 추가부분 시작 -->
<!-- 은혜 모달창을 위한 스타일 추가 -->
<style>

#modal_add_project,#modal_import {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1004;
}

#modal_add_project .modal_add_project_content {
 
  width:600px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #008d5d;
}
#modal_import .modal_import_content {
 
  width:470px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #008d5d;
}

#modal_add_project .modal_add_project_layer, #modal_import .modal_import_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}
.mouseoverAddPro {
   background-color: #1e815f;
   cursor: pointer;
}
.selectedAddPro { background:#1e815f; }

</style>
<div id="modal_add_project">
    <div class="modal_add_project_content">
	    <div class="modal_add_project_title" style="margin-bottom:8px; color:white;">
	       <font size="2px" style="font-weight: bold;">프로젝트 생성</font>
	       <span style="float: right; text-align:center;"><span id="modal_close_btn"><i class="gi gi-close gi-medium"></i></span></span>
	    </div>
	    <hr style="margin-top:3px;margin-bottom:5px;"></hr>
	    <div  style="backgroud-color:#d6d6d6; border:1px solid white;position:relative; width:100%;">
	       <table style="margin:10px;" id="add_pro_tb">
	            
	            <tbody>
	                <tr style="padding:5px;color:white;"><td><input type="hidden" value="java"><i class="gi gi-new_project"></i><font size="2.5px">&nbsp;java project</font></td></tr>
	                <tr style="padding:5px;color:white;"><td><input type="hidden" value="web"><i class="gi gi-new_project"></i><font size="2.5px">&nbsp;dynamic web project</font></td></tr>
	            </tbody>
	            
	        </table>
	    </div>
		<div style="margin-top: 8px; margin-bottom: 8px; text-align: left;">
			<font size="2px" color="white">프로젝트 이름&nbsp;:&nbsp;</font>
			<input oninput="live_proname_check()" id="add_pro_name" style="width: 67%; font-size: 10pt; padding: 0px 0px 0px 10px; color: black;" type="text">
			&nbsp;&nbsp;<span id="proname_ok"></span>
		</div>
			<div style="text-align: center; margin-top: 12px;">
			<span onclick="fn_addProject();"><font size="2px" color="white">생성하기</font></span>
		</div>
		<div class="modal_add_project_layer"></div>
	</div>
</div>

<style>

#import_file, #import_folder {
	margin-top: 12px; 
	height: 25px; 
	display:none;
}

</style>
<!-- 임포트를 위한 모달창 -->
<div id="modal_import">
    <div class="modal_import_content">
	    <div class="modal_import_title" style="margin-bottom:8px; color:white;">
	       <font size="2px" style="font-weight: bold;">Import</font>
	       <span style="float: right; text-align:center;"><span id="modal_import_close_btn"><i class="gi gi-close gi-medium"></i></span></span>
	    </div>
	    <hr style="margin-top:3px;margin-bottom:5px;"></hr>
		<div style="color: white; text-align: center; display: inline;">
			<div style="margin: auto; text-align: left;margin-bottom: 5px;">
				<span style="position: relative; top: -3px;"><font size="2.5px"><i class="gi gi-upload"></i>&nbsp;업로드 유형&nbsp;:&nbsp;</font></span>
				<input type="radio" name="file_or_folder" value="file">
				<span style="position: relative; top: -3px;"><font size="2.5px">File</font></span>&nbsp;&nbsp;
				<input type="radio" name="file_or_folder" value="folder">
				<span style="position: relative; top: -3px;"><font size="2.5px">Folder</font></span>
			</div>
		</div>
		<div style="color: white; text-align: center; display: inline;">
			<div style="margin: auto; text-align: left;margin-bottom: 5px;">
				<span style="position: relative; top: -3px;">
				<font size="2px">
				<i class="jstree-icon jstree-themeicon gi gi-root main  gi-extention " role="presentation" style="">
				</i>&nbsp;workspace</font></span>
			</div>
		</div>
		<div style="margin-bottom:8px;">
			<span id="import_path">
			<font size='2px' color='white'>&nbsp;경로&nbsp;:&nbsp;</font>
			</span>
		</div>
		<div style="backgroud-color:#1E1E1D; border:1px solid white;position:relative; width:100%; height: 200px; overflow: auto;">
	       <!-- 팬시트리 가능? -->
		<table id="tree1" style="z-index:1000; font-size: 12px;">
			<colgroup>
			<col width="30px">
			<col width="50px">
			<col width="350px">
			<col width="50px">
			<col width="50px">
			<col width="30px">
			<col width="30px">
			<col width="50px">
			</colgroup>
			<tbody id="root">
				<tr>
					<td style="display:none;" class="alignCenter"></td>
					<td style="display:none;"></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	    </div>
		<div id="import_file" style="color:white;">
<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
			<div style="float: left">
				<input type="file" name="file" width="200" multiple id="input_import_file">
			</div>
			<div style="float: right">
				<button class="btn btn-default" id="btn_import_file">올리기</button>
			</div>
</form>
		</div>
		<div id="import_folder" style="color:white;">
<form method="POST" enctype="multipart/form-data" id="folderUploadForm">
			<div style="float: left">
				<input type="file" onchange="selectFolder(event)" webkitdirectory mozdirectory msdirectory odirectory directory multiple name="file" id="input_import_folder">
			</div>
			<div style="float: right">
				<span style="position: relative; text-align: center;">
				빈폴더는 업로드되지 않습니다.&nbsp;
				<button class="btn btn-default" id="btn_import_folder">올리기</button>
				</span>
			</div>
</form>
		</div>
	<div class="modal_import_layer"></div>
	</div>
</div>
<!-- 은혜 모달창 띄우기 위한 추가부분 끝-->
	
	
<!-- 은지 모달창 띄우기 위한 추가부분 시작 -->
<!-- 은지 모달창을 위한 스타일 추가 -->
<style>

#modal_add_file {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1004;
}

#modal_add_file button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal_add_file .modal_add_file_content {
 
  width:600px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #008d5d;
}

#modal_add_file .modal_add_file_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}

</style>
<div id="modal_add_file">
    <div class="modal_add_file_content">
	    <div class="modal_add_file_title" style="margin-bottom:8px; color:white;">
	       <font size="2px">파일 생성</font>
	       <span style="float: right; text-align:center;"><span id="modal_file_close_btn">닫기</span></span>
	    </div>
	    <div  style="backgroud-color:#d6d6d6; border:1px solid white;position:relative; width:100%;">
	       <table style="margin:10px;" id="add_file_tb">
	            
	            <tbody>
	                <tr style="padding:5px;color:white;"><td>
	                <input type="hidden" value="java">
	                <i class="gi gi-new_file"></i><font size="2.5px">&nbsp;Class</font>
	                </td></tr>
	                
	                <tr style="padding:5px;color:white;"><td>
	                <input type="hidden" value="jsp">
	                <i class="gi gi-new_file"></i><font size="2.5px">&nbsp;JSP File</font>
	                </td></tr>
	                
	                <tr style="padding:5px;color:white;"><td>
	                <input type="hidden" value="css">
	                <i class="gi gi-new_file"></i><font size="2.5px">&nbsp;CSS File</font>
	                </td></tr>
	                
	                <tr style="padding:5px;color:white;"><td>
	                <input type="hidden" value="xml">
	                <i class="gi gi-new_file"></i><font size="2.5px">&nbsp;XML File</font>
	                </td></tr>
	                
	                <tr style="padding:5px;color:white;"><td>
	                <input type="hidden" value="html">
	                <i class="gi gi-new_file"></i><font size="2.5px">&nbsp;HTML File</font>
	                </td></tr>
	            </tbody>
	            
	        </table>
	    </div>
		<div style="margin-top: 8px; margin-bottom: 8px; text-align: center;">
			<font size="2px" color="white">파일 이름&nbsp;:&nbsp;</font>
			<input type="hidden" id="ide_no">
			<input type="hidden" id="folder_name">
			<input type="hidden" id="author">
			<input type="hidden" id="split">
			<input id="add_file_name" style="width: 64%; font-size: 10pt; padding: 0px 0px 0px 10px; color: black;" type="text">
		</div>
			<div style="text-align: center; margin-top: 12px;">
			<span onclick="fn_addFile();"><font size="2px" color="white">생성하기</font></span>
		</div>
		<div class="modal_add_file_layer"></div>
	</div>
</div>

<!-- 코비 실행시 마이크 음성인식 모달창 -->
<div id="cobi_modal" >
	<div class="cobi_modal_content">
		<h3>마이크 음성인식</h3>
	    <p>코비에게 실행시킬 명령을 말해보세요! :)</p>
	    <br>
		<button id="mic_play_cobi" class="btn btn-default set_root_passwd_btn" style="margin:auto;width:80px;margin-left:15px;">녹음</button>
<%-- 		<audio id="audio-source" src="${pageContext.request.contextPath }/laonide/test.mp3"></audio> --%>
		<button id="mic_stop_cobi" class="btn btn-default set_root_passwd_btn" style="margin:auto;width:80px;">정지</button>
		<button id="cobi_modal_close_btn" type="button" class="btn btn-default set_root_passwd_btn" style="margin:auto;width:80px;" >
			 닫기
		</button>
	</div>
</div>

<!-- 코비 모달창 -->
<style>	
#cobi_modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1210;
}

#cobi_modal h2 {
  margin:0;   
}
#cobi_modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#cobi_modal .cobi_modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}
</style>

<!-- 은지 모달창 띄우기 위한 추가부분 끝-->

<style>	
/* 오비 결함자동저장 버튼 css */
.button_base {
    margin: 0;
    border: 0;
    font-size: 9px;
    position: relative;
    top: 50%;
    left: 50%;
/*     margin-top: -25px; */
    margin-left: -72px; 
    width: 150px;
    height: 30px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}

.b01_simple_rollover {
    color: #000000;
    border: #000000 solid 1px;
    padding: 10px;
    background-color: #ffffff;
}
.b01_simple_rollover:hover {
    color: #ffffff;
    background-color: #000000;
}
</style>



<!-- 종운 모달창 띄우기 위한 추가부분 시작 -->
<!-- 종운 모달창을 위한 스타일 추가 -->
<style>

#modal_export_project {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1004;
}

#modal_export_project .modal_export_project_content {
 
  width:600px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #008d5d;
}

#modal_export_project .modal_export_project_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}


</style>
<div id="modal_export_project">
    <div class="modal_export_project_content">
	    <div class="modal_export_project_title" style="margin-bottom:8px; color:white;">
	       <font size="2px">프로젝트 생성</font>
	       <span style="float: right; text-align:center;"><span id="modal_close_btn1">닫기</span></span>
	    </div>
	    <div  style="backgroud-color:#d6d6d6; border:1px solid white;position:relative; width:100%;">
	       <table style="margin:10px;" id="export_tb">
	            <tbody>
	                <tr onclick="fn_zip()" style="padding:5px;color:white;"><td><i class="gi gi-new_project"></i><font size="2.5px">&nbsp;Zip</font></td></tr>
	                <tr onclick="fn_war()" style="padding:5px;color:white;"><td><i class="gi gi-new_project"></i><font size="2.5px">&nbsp;War</font></td></tr>
	            </tbody>
	        </table>
		<div class="modal_export_project_layer"></div>
</div>
</div>
</div>
<!-- 종운 모달창 띄우기 위한 추가부분 끝-->
<!-- 혜영,은혜 모달창을 위한 스타일 추가 -->
<style>

#modal_search_project {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1004;
}

#modal_search_project .modal_search_project_content {
 
  width:500px;
  height:500px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #008d5d;
}
</style>

	<div id="modal_search_project">
		<div class="modal_search_project_content">
			<div class="modal_search_project_title" style="margin-bottom: 8px; color: white;">
				<font size="2px" style="font-weight: bold;">파일 찾기</font>
				<span style="float: right; text-align: center;">
				<span id="modal_search_close"><i class="gi gi-close gi-medium"></i></span>
				</span>
			</div>
			<hr style="margin-top: 3px; margin-bottom: 5px;">
			<div style="margin-bottom: 50px; margin-top: 8px; display: block;">
				<input type="text" id="input_search"
					style="height: 70%; width: 91.2%; margin-right: 2px; margin-top: 2px; float: left;"
					placeholder="검색할 파일명을 입력해주세요." class="form-control">
				<button id="btn_searchFile" type="button" class="btn btn-default"
					style="float: left; margin-top: 3px;">확인</button>
			</div>
			<div
				style="backgroud-color: #1E1E1D; border: 1px solid white; position: relative; width: 100%; height: 400px; overflow: auto; margin-top: 10px;">
				<table id="search_tree" style="z-index: 1000; font-size: 12px;">
					<colgroup>
						<col width="30px">
						<col width="50px">
						<col width="350px">
						<col width="50px">
						<col width="50px">
						<col width="30px">
						<col width="30px">
						<col width="50px">
					</colgroup>
					<tbody id="root">
						<tr>
							<td style="display: none;" class="alignCenter"></td>
							<td style="display: none;"></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
<!-- 			<div class="modal_search_project_layer"></div> -->
		</div>
	</div>
	
	<!-- 혜영, 은혜 모달창 띄우기 위한 추가부분 끝-->
<!-- 혜영 오류 해결방법창 팝업을 위한 스타일 추가 -->
<style>

#modal_err {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1004;
}

#modal_err .modal_err_content {
 
  width:500px;
  height:310px;
  position:relative;
  margin:50px auto;
  padding:10px 10px;
  background:#313335;
  border:1px solid #A4A4A4;
}

#modal_err .modal_err_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}


</style>
<div id="modal_err">
    <div class="modal_err_content">
	    <div class="modal_err_title" style="margin-bottom:8px; color:white;">
				<h4 size="2px" class="modal-title">에러 해결방법	
					<i class="gi gi-question"></i>
					<span style="float: right; text-align: center;" id="modal_err_close">닫기</span>
				</h4>
		</div>
		<hr style="margin-top:3px;margin-bottom:5px;">
	    <div id="find_errName" style="backgroud-color:#1E1E1D; position:relative; width:100%; height: 60px; overflow: auto;margin-top: 10px;">
	    </div>
<!-- 	    <div style="margin-bottom:10px;margin-top: 8px;display: block;"> -->
<!-- 			<br/> -->
<!-- 			<input type="text" id="input_search" style="height:70%;width:90%;margin-right:2px;margin-top:2px; float: left;" placeholder="검색할 파일명을 입력해주세요." class="form-control"> -->
<!-- 			<button id="btn_searchPop" class="btn btn-default" style="float: left;margin-top: 3px;">확인</button> -->
<!-- 		</div> -->
		<br/>
	    <div id="find_errSol" style="backgroud-color:#1E1E1D; position:relative; width:100%; height: 200px; overflow: auto;margin-top: 10px;" >
	    </div>
		<div class="modal_err_layer"></div>
</div>
</div>
</div>
<!-- 혜영 모달창 띄우기 위한 추가부분 끝-->
</body>
</html>