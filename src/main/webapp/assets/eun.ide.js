//1. 프로젝트 익스플로러 우측 상단 플러스 버튼 클릭시 모달/팝업으로 프로젝트 종류, 이름 선택창 오픈 펑션 버튼id=add_project

var pro_type = '';

function fn_add_project() {
	pro_type = '';
	$('#add_pro_name').attr('disabled','disabled');
	
	document.getElementById("modal_add_project").style.display="block";
	$("#modal_add_project").draggable();   
	document.getElementById("modal_close_btn").onclick = function() {
		document.getElementById("modal_add_project").style.display="none";
		$('#add_pro_tb tr').each(function () {
			$(this).siblings().removeClass("selectedAddPro");
		});
		$('#add_pro_name').val("");
		$('#proname_ok').html('');
	};
	 
	$('#add_pro_tb tr').mouseover(function(){
		$(this).addClass('mouseoverAddPro');
	}).mouseout(function() {
		$(this).removeClass('mouseoverAddPro');
	});
	
	$('#add_pro_tb tr').each(function () {
		$(this).click(function () {
			$(this).addClass("selectedAddPro");                      
			$(this).siblings().removeClass("selectedAddPro"); 
			$("#add_pro_name").removeAttr('disabled');
         });
	});
	
	$("#add_pro_tb tr").click(function(){ 
		pro_type = $(this).find('input').val();
		console.log('pro_type : ' + pro_type);
	});
	
}
// 프로젝트 생성하고 팬시트리 리로드하는 펑션
function fn_addProject() {

	var pro_name =  $.trim($('#add_pro_name').val());
	var name_check = $('#proname_ok').html();
	if(pro_name != '' && name_check.indexOf("가능") >= 0 ){
		$.ajax({
			url : contextPath + "/laonide/addProject.do",
			type : "POST",
			datatype : "text",
			data : { 
				pro_link : pro_link,
				pro_name : pro_name,
				pro_type : pro_type
			},
			success : function(data) {
				if(data.result == true){
					document.getElementById("modal_add_project").style.display="none";
					var var_rtnFancySrc2 = fn_rtnFancySrc2();
					var var_tree = $("#tree").fancytree("getTree");
					var_tree.reload(var_rtnFancySrc2);

					$('#add_pro_tb tr').each(function () {
						$(this).siblings().removeClass("selectedAddPro");
					});
					$('#add_pro_name').val("");
					$('#proname_ok').html('');
				}else{
					return;
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
}
function live_proname_check() {
	var pro_name = $('#add_pro_name').val();
	var html_no = "<font size='2pt' style='color: #FB96A8;'><i class='gi gi-close'></i>&nbsp;이름중복</font>";
	var html_ok = "<font size='2pt' style='color: #80D267;'><i class='gi gi-ok'></i>&nbsp;생성가능</font>";
    $.ajax({
		url : contextPath + "/laonide/checkNameProject.do",
		type : "POST",
		datatype : "text",
        data: { pro_name : pro_name, pro_link : pro_link },
        success:function(data){
        	if(data.result == false){
        		$('#proname_ok').html(html_no);
			}else{
				$('#proname_ok').html(html_ok);
			}
        }
    });
}
// 팬시트리 리로드 펑션
function fn_project_refresh() {
	var var_rtnFancySrc2 = fn_rtnFancySrc2();
	var var_tree = $("#tree").fancytree("getTree");
	var_tree.reload(var_rtnFancySrc2);
}
var getPath_import='';
// 임포트 모달창의 트리 띄우기 (간소함)
function fn_loadingImportTree() {
	$("#tree1").fancytree(treeOption).on("nodeCommand", function(event, data){
		var tree = $(this).fancytree("getTree"),
			node = tree.getActiveNode();
	}).on("click dblclick", function(e){
	
		var node = $("#tree1").fancytree("getActiveNode");
		var author = node.data.author;
//		console.log("경로 1 : " +author);
		getPath_import = node.getPath(true,"title","/");
// 		console.log("경로 2 : " +getPath);
 		var import_span_html = "<font size='2px' color='white'>&nbsp;경로&nbsp;:&nbsp;"+ getPath_import +"</font>"
 		$('#import_path').html(import_span_html);
	});
}
// 업로드할 폴더의 이름을 리턴함
var select_import_folder_name = '';
var arr_import_folder_path;

function selectFolder(e) {
	arr_import_folder_path = new Array();
    var theFiles = e.target.files;
    var relativePath = theFiles[0].webkitRelativePath;
    console.log(theFiles);
    
    for(var i = 0; i < theFiles.length; i++){
    	arr_import_folder_path[i] = theFiles[i].webkitRelativePath;
    }
    console.log(arr_import_folder_path);
    
    var folder = relativePath.split("/");
//    alert(folder[0]);
    select_import_folder_name = folder[0];
}
// import 창 띄우기
function fn_import(){
	var old_html = $("#modal_import").html();
	var value='';
	fn_loadingImportTree();
	var var_rtnFancySrc2 = fn_rtnFancySrc2();
	var var_tree = $("#tree1").fancytree("getTree");
	var_tree.reload(var_rtnFancySrc2);
//	console.log(var_tree);
	document.getElementById("modal_import").style.display="block";
	$("#modal_import").draggable();   
	// 닫기 버튼 누를 시
	document.getElementById("modal_import_close_btn").onclick = function() {
		document.getElementById("modal_import").style.display="none";
		document.getElementById("import_file").style.display="none";
		document.getElementById("import_folder").style.display="none";
		$("#modal_import").html(old_html);
		fn_project_refresh();
		getPath_import = '';
	};
	
	// 라디오버튼에 따라 아래 파일, 폴더 올리기 창 노출
	$('input[name="file_or_folder"]').change(function() {
	    	
    	value = $(this).val();             
        console.log(value);
    	if(value == 'file'){
        	document.getElementById("import_folder").style.display="none";
        	document.getElementById("import_file").style.display="block";
        }else if(value == 'folder'){
        	document.getElementById("import_file").style.display="none";
        	document.getElementById("import_folder").style.display="block";
        }
	});
	
	
	// 폴더 업로드
	$('#btn_import_folder').click(function (event) {
				
		event.preventDefault();
		var form = $('#folderUploadForm')[0];
		var data = new FormData(form);
		data.append('pro_link', pro_link);
		data.append('folderName', select_import_folder_name);
		data.append('folderPath', arr_import_folder_path);
		data.append('path', getPath_import);
	
		if(getPath_import == ''){
			alert('경로를 선택하세요.');
			return;
		}
		$("#btn_import_file").prop("disabled", true);
		
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: contextPath + "/laonide/importfolder.do",
			data: data, 
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function (data) {
//				alert(data.result);
				$("#btn_import_file").prop("disabled", false);
				document.getElementById("modal_import").style.display="none";
				document.getElementById("import_file").style.display="none";
				document.getElementById("import_folder").style.display="none";
				$("#modal_import").html(old_html);
				fn_project_refresh();
				getPath_import = '';
			},
			error: function (e) {
				console.log("ERROR : ", e);
				$("#btn_import_file").prop("disabled", false);
			}
		});
		
	});
	
	// 파일 임포트
	$('#btn_import_file').click(function (event) {
        event.preventDefault();
        var form = $('#fileUploadForm')[0];
        var data = new FormData(form);
        data.append('pro_link', pro_link);
        data.append('path', getPath_import);
        
        if(getPath_import == ''){
        	alert('경로를 선택하세요.');
        	return;
        }
        
       // disabled the submit button
        $("#btn_import_file").prop("disabled", true);
 
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: contextPath + "/laonide/importfile.do",
            data: data, 
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
//                alert(data.result);
                $("#btn_import_file").prop("disabled", false);
        		document.getElementById("modal_import").style.display="none";
        		document.getElementById("import_file").style.display="none";
        		document.getElementById("import_folder").style.display="none";
        		$("#modal_import").html(old_html);
        		fn_project_refresh();
        		getPath_import = '';
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btn_import_file").prop("disabled", false);
                alert("fail");
            }
        });
 
    });
}

// 파일 검색 js

// 파일 모달창의 트리 띄우기 (간소함)

function fn_loadingSearchTree() {
	
	$("#search_tree").fancytree(treeOption).on("click dblclick", function(e, data){
		var tree = $(this).fancytree("getTree");
		var sc_node = tree.getActiveNode();
		var author = sc_node.data.author;
		console.log("경로 1 : " +author);
		
		$.ajax({
			url : contextPath + "/laonide/Fileread.do",
			type: "POST",
			datatype: "text",
			data : { 
				authoruri : author
			},
			success : function(data) {
				javaEditor.getDoc().setValue(data);
			},
			error: function (error) {
				console.log(error);
			}
		});
	});
}


//파일 검색
function searchFile() {
	
	var old_html = $("#modal_search_project").html();
	var value = '';
	fn_loadingSearchTree();
	var var_rtnFancySrc2 = fn_rtnFancySrc2();
	var var_tree = $("#search_tree").fancytree("getTree");
	var_tree.reload(var_rtnFancySrc2);
	
	$("#modal_search_project").draggable();
	$("#modal_search_project").attr("style", "display:block");
	$("#modal_search_close").click(function() {
		$("#modal_search_project").attr("style", "display:none");
		$("#input_search").val('');
		$("#modal_search_project").html(old_html);
	});
	
	$('#btn_searchFile').click(function(){
		var searchWord = $.trim($("#input_search").val());
		if(searchWord != null || searchWord != ""){

			var var_rtnSearchFancy = fn_reloadSearch(searchWord);
			var var_search_tree = $("#search_tree").fancytree("getTree");
			var_search_tree.reload(var_rtnSearchFancy);

		}else{
		    alert("검색할 파일명을 입력해주세요!");
		 }
	});
}


//파일 검색 리로드 펑션
function fn_reloadSearch(searchWord){
  var rtnSrc = "";
  $.ajax({
     url: contextPath + "/laonide/saerchWSload.do",
      dataType: "json",
      async: false, // ture: 비동기, false: 동기
      data : {
       searchWord : searchWord,
       pro_link : pro_link
    },
      success: function(data){
         console.log(data);
         rtnSrc = data.jsonSrc;
      }
  });
      
  return rtnSrc;
}

//======================================================종운================================================

function fn_zip(){
	node = $("#tree").fancytree("getActiveNode");
	author = node.data.author;
	console.log("author : " + author);
//	var authoruri = encodeURIComponent(author);
	
	nodetitle = node.title;
	

	var aau1 = encodeURIComponent(author);
			$(location).attr('href', contextPath + '/laonide/zipdown.do?'
					+'root=' + aau1 + '&filename=' + nodetitle);
			
	document.getElementById("modal_export_project").style.display="none";
}

function fn_war(){
	node = $("#tree").fancytree("getActiveNode");
	author = node.data.author;
//	console.log("author : " + author);
//	var authoruri = encodeURIComponent(author);
	nodetitle = node.title;
	
	var aau = encodeURIComponent(author);
//	var nodetitle2 = encodeURIComponent(nodetitle);
	
			$(location).attr('href', contextPath + '/laonide/wardown.do?'
					+'root=' + aau + '&filename=' + nodetitle);
			
	document.getElementById("modal_export_project").style.display="none";
	
}

function fn_fileSave(){
	
	node = $("#tree").fancytree("getActiveNode");
	author = node.data.author;
//	console.log("author : " + author);
//	var authoruri = encodeURIComponent(author);
	nodetitle = node.title;
	
	var aau2 = encodeURIComponent(author);
	
	
	$('form[name=Frm]').submit(function(){
		
		$(this).attr('action', contextPath + '/laonide/fileSave.do?root=' + aau2 + '&filename=' + nodetitle);
	});
	
}


function fn_export(){
	
	
	
	document.getElementById("modal_export_project").style.display="block";
	   
	document.getElementById("modal_close_btn1").onclick = function() {
		document.getElementById("modal_export_project").style.display="none";
	};
	
	$('#export_tb tr').mouseover(function(){
		$(this).addClass('mouseoverAddPro');
	}).mouseout(function() {
		$(this).removeClass('mouseoverAddPro');
	});
	

}

//======================================================종운================================================
