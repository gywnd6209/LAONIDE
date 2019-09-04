
var CLIPBOARD = null;
/*
SOURCE = [
	{title: "node 1", folder: true, expanded: true, children: [
		{title: "node 1.1", foo: "a"},
		{title: "node 1.2", foo: "b"}
	 ]},
	{title: "node 2", folder: true, expanded: false, children: [
		{title: "node 2.1", foo: "c"},
		{title: "node 2.2", foo: "d"}
	 ]}
];
*/
var node;
var getPath;
var author = "";
var nodetitle = "";


$(function(){
	var succ = "";
//	
	fn_loadingTree();
	
	/*
	 * Tooltips
	 */
// 	$("#tree").tooltip({
// 		content: function () {
// 			return $(this).attr("title");
// 		}
// 	});
	
	/*
	 * Context menu (https://github.com/mar10/jquery-ui-contextmenu)
	 */
	$("#tree").contextmenu({
		delegate : "span.fancytree-node",
		menu : [ {
			title : "이름변경",
			cmd : "rename",
			uiIcon : "ui-icon-pencil"
		}, {
			title : "삭제",
			cmd : "remove",
			uiIcon : "ui-icon-trash"
		}, {
			title : "----"
		}, {
			title : "새 폴더",
			cmd : "addFolder",
			uiIcon : "ui-icon-plus"
		}, {
			title : "새 파일",
			cmd : "addChild",
			uiIcon : "ui-icon-arrowreturn-1-e"
		}, {
			title : "----"
		}, {
			title : "잘라내기",
			cmd : "cut",
			uiIcon : "ui-icon-scissors"
		}, {
			title : "복사",
			cmd : "copy",
			uiIcon : "ui-icon-copy"
		}, {
			title : "붙여넣기",
			cmd : "paste",
			uiIcon : "ui-icon-clipboard",
			disabled : true
		}, {
			title : "----"
		},{
			/*은혜가 임포트 추가*/
			title : "Import",
			cmd : "import"
		},  {
			title : "Export",
			cmd : "export"
		} ],
		beforeOpen : function(event, ui) {
			var node = $.ui.fancytree.getNode(ui.target);
			$("#tree").contextmenu("enableEntry", "paste", !!CLIPBOARD);
			node.setActive();
		},
		select : function(event, ui) {
			var that = this;
			// delay the event, so the menu can close and the click event does
			// not interfere with the edit control
			setTimeout(function() {
				$(that).trigger("nodeCommand", {
					cmd : ui.cmd
				});
			}, 100);
		}
	});
});

/**
 * 은혜 - 동기로 데이터 가져옴
 * @param json
 * @returns {Array}
 */
function json2array(json){
    var result = [];
    var keys = Object.keys(json);
    keys.forEach(function(key){
        result.push(json[key]);
    });
    return result;
}

function fn_rtnFancySrc2(){
    var rtnSrc = "";
    $.ajax({
    	url: contextPath + "/laonide/reloadworkspacs.do",
    	data : {pro_link : pro_link},
 	    dataType: "json",
        async: false, // ture: 비동기, false: 동기
        success: function(data){
        	rtnSrc = data.jsonSrc;
        }
    });
        
    return rtnSrc;
}

var treeOption = {
		
	    checkbox: true,
	    checkboxAutoHide: true,
		titlesTabbable: true,     
		quicksearch: true,       
		source: $.ajax({
		    url: contextPath + "/laonide/loadingworkspace.do",
		    data : {pro_link : pro_link},
		    dataType: "json",
		    success : function(data){
//				alert('treeOption으로 로드됨! 계속 이렇게 쓸것임.');
				console.log(data);
			}	
		  }),
		extensions: ["edit", "dnd5", "table", "gridnav"],

			dnd5: {
				preventVoidMoves: true,
				preventRecursion: true,
				autoExpandMS: 400,
				dragStart: function(node, data) {
					console.log("dnd 처음");
					return true;
				},
				dragEnter: function(node, data) {
					console.log("dnd 엔터");
					return true;
				},
				dragDrop: function(node, data) {
					data.otherNode.moveTo(node, data.hitMode);
					console.log("dnd ???");
					//종운
					$.ajax({
						url : contextPath + "/laonide/fancyMove.do",
						type: 'POST',
						datatype: 'text',
						data : {
							path : data.otherNode.data.author,
							moveto : data.node.data.author
						},
						success: function(data2) {
							console.log(data2.result);
							var var_rtnFancySrc2 = fn_rtnFancySrc2();
							var var_tree = $("#tree").fancytree("getTree");
							var_tree.reload(var_rtnFancySrc2);
						}
					
					});
					
				}
					
				
			},
		edit: {
			triggerStart: ["f2", "shift+click", "mac+enter"],
			close: function(event, data) {
				if( data.save && data.isNew ){
				}
//				console.log("리네임 란??");
//				console.log(data);
				// 종운
				$.ajax({
					url : contextPath + "/laonide/fancyRename.do",
					type : 'POST',
					datatype: "text",
					data: {
						Name : data.node.title,
						path : data.node.data.author,
						orgTitle : data.orgTitle
					},success : function(data2){
						console.log(data2.result);
						var var_rtnFancySrc2 = fn_rtnFancySrc2();
						var var_tree = $("#tree").fancytree("getTree");
						var_tree.reload(var_rtnFancySrc2);
					}
				});
				
				
			}
			},
		table: {
				indentation: 20,
				nodeColumnIdx: 2,
				checkboxColumnIdx: 0
		},
		gridnav: {
				autofocusInput: false,
				handleCursorKeys: true
		},

		lazyLoad: function(event, data) {
				data.result = {url: "../demo/ajax-sub2.json"};
			},
		createNode: function(event, data) {
				var node = data.node,
					$tdList = $(node.tr).find(">td");
				if( node.isFolder() ) {
					$tdList.eq(2)
						.prop("colspan", 6)
						.nextAll().remove();
				}
			},
		renderColumns: function(event, data) {
				var node = data.node,
					$tdList = $(node.tr).find(">td");

				$tdList.eq(1).text(node.getIndexHier());
				$tdList.eq(3).find("input").val(node.key);
				$tdList.eq(4).find("input").val(node.data.foo);
			}
		};

function fn_loadingTree() {
	$("#tree").fancytree(treeOption).on("nodeCommand", function(event, data){
		var refNode, moveMode,
			tree = $(this).fancytree("getTree"),
			node = tree.getActiveNode();

		switch( data.cmd ) {
		case "moveUp":
			refNode = node.getPrevSibling();
			if( refNode ) {
				node.moveTo(refNode, "before");
				node.setActive();
			}
			break;
		case "moveDown":
			refNode = node.getNextSibling();
			if( refNode ) {
				node.moveTo(refNode, "after");
				node.setActive();
			}
			break;
		case "indent":
			refNode = node.getPrevSibling();
			if( refNode ) {
				node.moveTo(refNode, "child");
				refNode.setExpanded();
				node.setActive();
			}
			break;
		case "outdent":
			if( !node.isTopLevel() ) {
				node.moveTo(node.getParent(), "after");
				node.setActive();
			}
			break;
		case "rename":
			node.editStart();
			break;
		case "remove":
			refNode = node.getNextSibling() || node.getPrevSibling() || node.getParent();
			node.remove();
			if( refNode ) {
				refNode.setActive();
			}

			/* 은혜가 스프링으로 수정함 */
			$.ajax({
				url : contextPath + "/laonide/fancyRemove.do",
				type: "POST",
				datatype: "json",
//				async: false,
				data : { // 파라미터
					path : node.data.author,
					title : node.title
				},
				success : function(data) {
					var var_rtnFancySrc2 = fn_rtnFancySrc2();
					var var_tree = $("#tree").fancytree("getTree");
					var_tree.reload(var_rtnFancySrc2);
				},
				error: function (error) {
					console.log(error);
				}
			});
			
			break;
		case "addFolder":
			var nono = node.addChildren( {
		        title: "Nodetitle",
		        folder: true,
		        expanded: true
		      });
			
			
			/* 은혜가 스프링으로 수정함 */
			$.ajax({
				url : contextPath + "/laonide/fancyFolder.do",
				type: "POST",
				datatype: "text",
				data : { // 파라미터
					parent : nono.parent.data.author,
					title : nono.title
				},
				success : function(data) {
//					fn_loadingTree();
					var var_rtnFancySrc2 = fn_rtnFancySrc2();
					var var_tree = $("#tree").fancytree("getTree");
					var_tree.reload(var_rtnFancySrc2);
				},
				error: function (error) {
					console.log(error);
				}
			});
			
			break;
		case "addChild":

			/**
			 * 은지 수정 시작
			 */
			var getPath = node.getPath(true, "title", "\\");
			console.log("경로 : " + getPath);

	
			var author = node.data.author;
			console.log("진짜경로 : " + author);
	
			var ar_split = getPath.split("\\");
			var split = ar_split[ar_split.length - 1];
			console.log("split : " + split);
			
			var folder_name = split;
			var ide_no = 1;
			
			fn_open_addFile(ide_no, folder_name, author, split);
			
			break;
			
		case "cut":
			CLIPBOARD = {mode: data.cmd, data: node};
			break;
		case "copy":
			CLIPBOARD = {
				mode: data.cmd,
				data: node.toDict(function(n){
					delete n.key;
				})
			};
			break;
		case "clear":
			CLIPBOARD = null;
			break;
		case "paste":
			if( CLIPBOARD.mode === "cut" ) {
				// refNode = node.getPrevSibling();
				CLIPBOARD.data.moveTo(node, "child");
				CLIPBOARD.data.setActive();
			} else if( CLIPBOARD.mode === "copy" ) {
				node.addChildren(CLIPBOARD.data).setActive();
			}
			break;
			//종운
		case "export" :
			
			
		
			
			document.getElementById("modal_export_project").style.display="block";
			   
			document.getElementById("modal_close_btn1").onclick = function() {
				document.getElementById("modal_export_project").style.display="none";
//				$('#export_tb tr').each(function () {
//				     $(this).siblings().removeClass("selectedAddPro"); 
//				});
			};
			
			$('#export_tb tr').mouseover(function(){
				$(this).addClass('mouseoverAddPro');
			}).mouseout(function() {
				$(this).removeClass('mouseoverAddPro');
			});
			
//			$('#export_tb tr').each(function () {
//				$(this).click(function () {
//					$(this).addClass("selectedAddPro");                      
//					$(this).siblings().removeClass("selectedAddPro"); 
//		         });
//			});
			
			
			break;
		case "save" :
			
			$(document).bind('keydown', 'ctrl+s', function(e) {
			    e.preventDefault();
//			    alert('Ctrl+S');
			    console.log("저장저장저장");
			    return false;
			});
			
			
			
			break;
			//종운
		/*은혜 임포트 추가*/	
		case "import" :
			fn_import();
			break;
		/*은혜 임포트 추가 끝*/	
		default:
			alert("Unhandled command: " + data.cmd);
			return;
		}


		//=====================================종운=========================================
	}).on("click dblclick", function(e){
// 		console.log( e, $.ui.fancytree.eventToString(e) );
// 		console.log(e);

	
		node = $("#tree").fancytree("getActiveNode");
		
//		console.log("노드");
// 		var parent = node.getChildren();
// 		var parent = node.getParentList();
		
		// 실제 경로
		author = node.data.author;
		console.log("경로 1 : " +author);
		
		// 트리 경로
		getPath = node.getPath(true,"title","\\");
 		console.log("경로 2 : " +getPath);
 		
// 		var authoruri = encodeURIComponent(author)
 		
 		$.ajax({
			url : contextPath + "/laonide/Fileread.do",
			type: "POST",
			datatype: "text",
			data : { // 파라미터
//				authoruri : authoruri
				authoruri : author
			},
			success : function(data) {
//				console.log(data);
				javaEditor.getDoc().setValue(data);
			},
			error: function (error) {
				console.log(error);
			}
		});
 		
 	 
 		}).on("keydown", function(e){
		var cmd = null;

		// ????
		console.log("이게anjdi")
 		console.log(e.type, $.ui.fancytree.eventToString(e));
		switch( $.ui.fancytree.eventToString(e) ) {
		case "ctrl+shift+n":
		case "meta+shift+n": // mac: cmd+shift+n
			cmd = "addChild";
			break;
		case "ctrl+c":
		case "meta+c": // mac
			cmd = "copy";
			break;
		case "ctrl+v":
		case "meta+v": // mac
			cmd = "paste";
			break;
		case "ctrl+x":
		case "meta+x": // mac
			cmd = "cut";
			break;
		case "ctrl+n":
		case "meta+n": // mac
			cmd = "addSibling";
			break;
		case "del":
		case "meta+backspace": // mac
			cmd = "remove";
			break;
		// case "f2":  // already triggered by ext-edit pluging
		// 	cmd = "rename";
		// 	break;
		case "ctrl+up":
			cmd = "moveUp";
			break;
		case "ctrl+down":
			cmd = "moveDown";
			break;
		case "ctrl+right":
		case "ctrl+shift+right": // mac
			cmd = "indent";
			break;
		case "ctrl+left":
		case "ctrl+shift+left": // mac
			cmd = "outdent";
			break;
		case "ctrl+s":
			cmd = "save";
			break;
		}
		if( cmd ){
			$(this).trigger("nodeCommand", {cmd: cmd});
			// e.preventDefault();
			// e.stopPropagation();
			return false;
		}
	});
	
}