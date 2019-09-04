/**
 * 
 */

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
//	var url = "FolderCreate";
//	var uuu = "";
//	if(window.XMLHttpRequest){
//        xmlhttp=new XMLHttpRequest();
//     } else{
//     xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
//     }  
//	
//	 xmlhttp.onreadystatechange=function(){
//         if(xmlhttp.readyState==4 && xmlhttp.status==200){
//        	 uuu = xmlhttp.responseText;
//         }
//     }
//  
//     xmlhttp.open("POST",url,true);
//     xmlhttp.send();
//	$.ajax({
//		url : '/FolderCreate',
//		type: "POST",
//		datatype: "json",
//		async: false,
//		data : { // 파라미터
//			userName : 'wh'   
//		},
//		success : function(data) {
//			succ = data
//			
//		},
//		error: function (error) {
//			alert(error);
//		}
//	})
//	console.log(succ);
	
	
	
	$("#tree").fancytree({
		
    checkbox: true,
    checkboxAutoHide: true,
		titlesTabbable: true,     // Add all node titles to TAB chain
		quicksearch: true,        // Jump to nodes when pressing first character
//		source: { url: "./fancytree/demo/ajax-tree-products.json"},
		source: $.ajax({
		    url: contextPath + "/laonide/loadingworkspace.do",
		    dataType: "json"
//		    async: false
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
				// return ["before", "after"];
				console.log("dnd 엔터");
				return true;
			},
			dragDrop: function(node, data) {
				data.otherNode.moveTo(node, data.hitMode);
				console.log("dnd ???");
			}
		},
		edit: {
			triggerStart: ["f2", "shift+click", "mac+enter"],
			close: function(event, data) {
				if( data.save && data.isNew ){
					// Quick-enter: add new nodes until we hit [enter] on an empty title
//					$("#tree").trigger("nodeCommand", {cmd: "addSibling"});
					
				}
				console.log("리네임 란??");
				console.log(data);
				
				$.ajax({
					url : '/fancyRename',
					type : 'POST',
					datatype: "text",
					data: {
						Name : data.node.title,
						path : data.node.author,
						orgTitle : data.orgTitle
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

			// Span the remaining columns if it's a folder.
			// We can do this in createNode instead of renderColumns, because
			// the `isFolder` status is unlikely to change later
			if( node.isFolder() ) {
				$tdList.eq(2)
					.prop("colspan", 6)
					.nextAll().remove();
			}
		},
		renderColumns: function(event, data) {
			var node = data.node,
				$tdList = $(node.tr).find(">td");

			// (Index #0 is rendered by fancytree by adding the checkbox)
			// Set column #1 info from node data:
			$tdList.eq(1).text(node.getIndexHier());
			// (Index #2 is rendered by fancytree)
			// Set column #3 info from node data:
			$tdList.eq(3).find("input").val(node.key);
			$tdList.eq(4).find("input").val(node.data.foo);

			// Static markup (more efficiently defined as html row template):
			// $tdList.eq(3).html("<input type='input' value='" + "" + "'>");
			// ...
		}
	}).on("nodeCommand", function(event, data){
		// Custom event handler that is triggered by keydown-handler and
		// context menu:
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
			
			// 삭제된 노드 경로
//			console.log(node.data.author);
			
			// 삭제된 노드
//			console.log(node.title);
			
			$.ajax({
				url : 'fancyRemove',
				type: "POST",
				datatype: "text",
//				async: false,
				data : { // 파라미터
					path : node.data.author,
					title : node.title
				},
				success : function(data) {
					console.log(data);
				},
				error: function (error) {
					console.log(error);
				}
			})
			
			
			break;
		case "addFolder":
//			node = $("#tree").fancytree("getActiveNode");
			
			
			
			var nono = node.addChildren( {
		        title: "Nodetitle",
		        folder: true,
		        expanded: true
		      });
			
			// 생성된 폴더 노드
//			console.log(nono);
//			console.log("타이밍>>>>>");
			
			// 상위 노드 경로
//			console.log(nono.parent.data.author);
			
			// 생성된 폴더 노드 타이틀
//			console.log(nono.title);
			
			$.ajax({
				url : 'fancyFolder',
				type: "POST",
				datatype: "text",
//				async: false,
				data : { // 파라미터
					parent : nono.parent.data.author,
					title : nono.title
				},
				success : function(data) {
					console.log(data);
				},
				error: function (error) {
					console.log(error);
				}
			})
			
		
			
			
			break;
		case "addChild":
//			node.editCreateNode("child", "");

//			break;
			/**
			 * 은지 수정 시작
			 */
			 var getPath = node.getPath(true,"title","\\");
	         console.log("경로 : " +getPath);
	         
//	         var title = node.title;
//	         console.log("title : " +title);
	         
	         var ar_split = getPath.split("\\");
	         var split = ar_split[ar_split.length - 1];
//	         console.log("split : " +split);
	         
	         var url = 'createFile.do?ide_no=1&folder_name=' + split;
	         var options = 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no,' +
	                    'resizable=no, copyhistory=no, width=600px, height=270px, left=430px, top=130px';
	         window.open(url, '파일 생성', options);
	         
	         break;
	         
			
			
		case "addSibling":
			node.editCreateNode("after", "");
//			console.log("타이밍>>>>>");
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
		case "zip":
			console.log("zip임ㅋ");
			
			node = $("#tree").fancytree("getActiveNode");
			author = node.data.author;
			console.log("author : " + author);
//			var authoruri = encodeURIComponent(author);
			nodetitle = node.title;
			
			window.open("zipdown.jsp?root=" + author + "&filename=" + nodetitle  );
			
			break;
		case "war":
			console.log("war임ㅋ");
			
			node = $("#tree").fancytree("getActiveNode");
			author = node.data.author;
			console.log("author : " + author);
//			var authoruri = encodeURIComponent(author);
			nodetitle = node.title;
			
			window.open("wardown.jsp?root=" + author + "&filename=" + nodetitle  );
			
			break;
		default:
			alert("Unhandled command: " + data.cmd);
			return;
		}

		//?????
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
 		
 		readTextFile();
 		
 		function readTextFile() { 
 			
 			if(window.XMLHttpRequest){
 	           xmlhttp=new XMLHttpRequest();
 	        } else{
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
          
      }  
 			var authoruri = encodeURIComponent(author);
 		
 			var url = "Fileread?path=" + authoruri;
      xmlhttp.onreadystatechange=function(){
          if(xmlhttp.readyState==4 && xmlhttp.status==200){
          	   console.log(xmlhttp);
          	   var x = xmlhttp.responseText; 
          	 x = x.replace(/\+/g, '%20'); 
          	 x = decodeURIComponent(x);
          	 javaEditor.getDoc().setValue(x);
          }
      }
   
      xmlhttp.open("GET",url,true);
      xmlhttp.send();
 	} 		
			

 		
	


 		      
 		   
// 		 if( node ){
// 			 console.log("노드 :" + node);
// 			 var par = node.parent;
// 			 console.log("그 위 상위 노드 : "+par.parent.title);
// 			 console.log("상위 노드 : "+node.parent.title);
// 			 console.log("현재 노드 : "+node.title);
// 			  }else{
// 			    console.log("No active node.");
// 			  }
 		
 		// 현재 uri 가죠옴
// 		final String browser_name = request.getRequestURI();
		 
		 

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
		}
		if( cmd ){
			$(this).trigger("nodeCommand", {cmd: cmd});
			// e.preventDefault();
			// e.stopPropagation();
			return false;
		}
	});
	
	

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
		delegate: "span.fancytree-node",
		menu: [
			{title: "Edit", cmd: "rename", uiIcon: "ui-icon-pencil" },
			{title: "Delete", cmd: "remove", uiIcon: "ui-icon-trash" },
			{title: "----"},
			{title: "New Folder", cmd:"addFolder", uiIcon: "ui-icon-plus" },
			{title: "New sibling", cmd: "addSibling", uiIcon: "ui-icon-plus" },
			{title: "New child", cmd: "addChild", uiIcon: "ui-icon-arrowreturn-1-e" },
			{title: "----"},
			{title: "Cut", cmd: "cut", uiIcon: "ui-icon-scissors"},
			{title: "Copy", cmd: "copy", uiIcon: "ui-icon-copy"},
			{title: "Paste as child", cmd: "paste", uiIcon: "ui-icon-clipboard", disabled: true },
			{title: "----"},
			{title: "Export", children: [
	           {title: "Zip", cmd: "zip" },
	           {title: "War", cmd: "war"}
            ]}
			],
		beforeOpen: function(event, ui) {
			var node = $.ui.fancytree.getNode(ui.target);
			$("#tree").contextmenu("enableEntry", "paste", !!CLIPBOARD);
			node.setActive();
		},
		select: function(event, ui) {
			var that = this;
			// delay the event, so the menu can close and the click event does
			// not interfere with the edit control
			setTimeout(function(){
				$(that).trigger("nodeCommand", {cmd: ui.cmd});
			}, 100);
		}
	});
});
