var file_type;

// 파일생성 모달창
function fn_open_addFile(ide_no, folder_name, author, split) {
   $('#add_file_name').attr('disabled','disabled');
   
   $('#ide_no').val(ide_no);
   $('#folder_name').val(folder_name);
   $('#author').val(author);
   $('#split').val(split);
   
//   alert("ide_no : " + $('#ide_no').val() + " | " + "folder_name : " + $('#folder_name').val() + " | " + "author : " + $('#author').val());
   
   document.getElementById("modal_add_file").style.display="block";
   document.getElementById("modal_file_close_btn").onclick = function() {
      document.getElementById("modal_add_file").style.display="none";
      $('#add_file_tb tr').each(function () {
            $(this).siblings().removeClass("selectedAddPro"); 
            $('#add_file_name').val("");
      });
   };
    
   $('#add_file_tb tr').mouseover(function(){
      $(this).addClass('mouseoverAddPro');
   }).mouseout(function() {
      $(this).removeClass('mouseoverAddPro');
   });
   
   $('#add_file_tb tr').each(function () {
      $(this).click(function () {
         $(this).addClass("selectedAddPro");                      
         $(this).siblings().removeClass("selectedAddPro"); 
         $("#add_file_name").removeAttr('disabled');
         });
   });
   $('#add_file_tb tr').click(function () {
      file_type = $(this).find('td:eq(0)').find('input').val();
   });
}

// 파일 생성하고 팬시트리 리로드하는 펑션
function fn_addFile() {
   
   var ide_no = $('#ide_no').val();
   var folder_name = $('#folder_name').val();
   var author = $('#author').val();
   var split = $('#split').val();
   
//   alert("ide_no : " + ide_no + " | " + "folder_name : " + folder_name + " | " + "author : " + author);
   
   if($('#add_file_name').val()==""||$('#add_file_name').val()==null){
      alert("파일명을 입력해주세요.");
      $("#add_file_name").focus();
      return;
    }
//   var getName = /^[A-Z]+/;
   var getName = /^[A-Z][a-zA-Z]/;
   var getNameRow = /^[a-z][a-zA-Z]/;
   
   if(file_type == "java"){
      if(!getName.test($("#add_file_name").val())) {
            alert("파일명은 영문으로 작성해주세요. 파일명의 첫글자는 대문자입니다.");
            $("#add_file_name").val("");
            $("#add_file_name").focus();
            return;
      }
      
   }else if(!(file_type == "html")){
      if(!getNameRow.test($("#add_file_name").val())) {
            alert("해당 파일의 파일명은 소문자로 작성해주세요.");
            $("#add_file_name").val("");
            $("#add_file_name").focus();
            return;
      }
   }
   $.ajax({
      url : contextPath + "/laonide/insertFile.do",
      type : "POST",
      datatype : "json",
      data : { 
          ide_no : ide_no,
            folder_name : folder_name,
            file_name : $('#add_file_name').val(),
            file_type : file_type,
            author : author,
            split : split
      },
      success : function(andView) {
//         alert(andView.result);
         document.getElementById("modal_add_file").style.display="none";
         
         $(this).siblings().removeClass("selectedAddPro"); 
         $('#add_file_name').val("");
         
           var var_rtnFancySrc2 = fn_rtnFancySrc2();
         var var_tree = $("#tree").fancytree("getTree");
         var_tree.reload(var_rtnFancySrc2);

//            return;
      },
      error : function(result) {
         alert(result.status + ' | ' + result.responseText);
      }
   });
}

//////////////////////코~비//////////////////////////////

/* 음성인식 메서드 */
$(function(){
   if (!('webkitSpeechRecognition' in window)) {
      upgrade_cobi();
   } else {
      var start_button_cobi = document.getElementById("start_button_cobi");
      start_button_cobi.style.display = "inline-block";
      //라온 IDE로
      //var recognition = new webkitSpeechRecognition();
      recognition_cobi.continuous = true;
      recognition_cobi.interimResults = true;

      recognition_cobi.onstart = function() {
         recognizing_cobi = true;
         showInfo_cobi('info_speak_now_cobi');
         
      };

      recognition_cobi.onerror = function(event) {
         if (event.error == 'no-speech') {
            showInfo_cobi('info_no_speech_cobi');
            ignore_onend_cobi = true;
         }
//         if (event.error == 'audio-capture') {
//            showInfo_cobi('info_no_microphone');
//            ignore_onend = true;
//         }
//         if (event.error == 'not-allowed') {
//            if (event.timeStamp - start_timestamp < 5) {
//               showInfo_cobi('info_blocked');
//            } else {
//               showInfo_cobi('info_denied');
//            }
//            ignore_onend = true;
//         }
      };

      recognition_cobi.onend = function() {
         recognizing_cobi = false;
         if (ignore_onend_cobi) {
            return;
         }
         if (!final_transcript_cobi) {
            showInfo_cobi('info_start_cobi');
            return;
         }
         showInfo_cobi('');
         if (window.getSelection) {
            window.getSelection().removeAllRanges();
            var range_cobi = document.createRange();
            range_cobi.selectNode(document.getElementById('final_span_cobi'));
            window.getSelection().addRange(range_cobi);
         }
      };

//      recognition_cobi.onresult = function(event) {
//         var interim_transcript_cobi = '';
////         var interim_transcript_cobi = $('#interim_transcript_cobi');
////         interim_transcript_cobi.val('');
//         console.log('interim_transcript_cobi:' + interim_transcript_cobi);
//         var final_span_cobi = $('#final_span_cobi');
//         if (typeof (event.results) == 'undefined') {
//            recognition_cobi.onend = null;
//            recognition_cobi.stop();
//            upgrade_cobi();
//            return;
//         }
//         for (var i = event.resultIndex; i < event.results.length; ++i) {
//            if (event.results[i].isFinal) {
//               final_transcript_cobi += event.results[i][0].transcript;
//            } else {
//               interim_transcript_cobi += event.results[i][0].transcript;
//            }
//         }
//         final_transcript_cobi = capitalize(final_transcript_cobi);
//         final_span_cobi.innerHTML = linebreak_cobi(final_transcript_cobi);
//         interim_span_cobi.innerHTML = linebreak_cobi(interim_transcricpt_cobi);
//         if (final_transcript_cobi || interim_transcript_cobi) {
//            showButtons_cobi('inline-block');
//         }
//      };
      recognition_cobi.onresult = function(event) {
            var interim_transcript_cobi = '';
            if (typeof (event.results) == 'undefined') {
               recognition_cobi.onend = null;
               recognition_cobi.stop();
               upgrade_cobi();
               return;
            }
            for (var i = event.resultIndex; i < event.results.length; ++i) {
               if (event.results[i].isFinal) {
                  final_transcript_cobi += event.results[i][0].transcript;
               } else {
                  interim_transcript_cobi += event.results[i][0].transcript;
               }
            }
            final_transcript_cobi = capitalize(final_transcript_cobi);
            final_span_cobi.innerHTML = linebreak(final_transcript_cobi);
            interim_span_cobi.innerHTML = linebreak(interim_transcript_cobi);
            if (final_transcript_cobi || interim_transcript_cobi) {
               showButtons_cobi('inline-block');
            }
         };
   }
});

function upgrade_cobi() {
   start_button_cobi.style.visibility = 'hidden';
   showInfo_cobi('info_speak_now_cobi');
}

var two_line_cobi = /\n\n/g;
var one_line_cobi = /\n/g;
function linebreak_cobi(s) {
   return s.replace(two_line_cobi, '<p></p>').replace(one_line_cobi, '<br>');
}

var first_char_cobi = /\S/;
function capitalize_cobi(s) {
   return s.replace(first_char_cobi, function(m) {
      return m.toUpperCase();
   });
}

function startButton_cobi(event) {
   if (recognizing_cobi) {
      recognition_cobi.stop();
      return;
   }
   var final_span_cobi = $('#final_span_cobi');
   final_transcript_cobi = '';
   recognition_cobi.lang = 'ko-KR';
   recognition_cobi.start();
   ignore_onend_cobi = false;
   final_span_cobi.innerHTML = '';
   interim_span_cobi.innerHTML = '';
   showInfo_cobi('info_allow');
   showButtons_cobi('none');
   start_timestamp_cobi = event.timeStamp;
}

function showInfo_cobi(s) {
   if (s) {
      for (var child = info_cobi.firstChild; child; child = child.nextSibling) {
         if (child.style) {
            child.style.display = child.id == s ? 'inline' : 'none';
            
            if(s.indexOf('info_speak_now_cobi') != -1){
               $("#stop_rec_cobi").click(function(){
                  recognition_cobi.stop();
                  showInfo_cobi('info_start_cobi');
               });
            }
            
         }
      }
      info_cobi.style.visibility = 'visible';
   } else {
      info_cobi.style.visibility = 'visible';
   }
}

// 현재 커서에 문자열 삽입
function insertString(javaEditor, code){

    var selection = javaEditor.getSelection();

    if(selection.length>0){
       javaEditor.replaceSelection(code);
    }
    else{

        var doc = javaEditor.getDoc();
        var cursor = doc.getCursor();

        var pos = {
           line: cursor.line,
           ch: cursor.ch
        }
        doc.replaceRange(code, pos);
    }
}

$(function(){
   /* 코비 토글버튼 작동 부분 */
   var cobi_check = $("input[name='input_cobi']");
   var cobi_input = $("#cobi_ment");
   var resultSet = "";
   
    //코비 컨테이너
    var cobi_cont = $("#cobi_container");
    
    //코비 OFF 상태
    var cobi_stat = $("#cobi_off_status");
    
   cobi_check.click(function(){
         
      if($(this).is(":checked") ==  true){
              
         $("#info_start_cobi").attr("style", "display:block");
         $(".mic_cont_cobi").attr("style", "display:block");
         cobi_stat.hide();
//         alert("코비 ON");
         
          //코비 말 셋팅하기
          var html = '<div class="talk media">';
          html    +=      '<a class="media-left padding-0px" href="#" style="float: left;">';
          html    +=         '<img class="user_profile_image" src="'+ cobi_img +'"></a>';
          html    +=            '<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
          html    +=               '<div class="cm-s-default triangle-border left">';
          html    +=                  '<div class="continue_message" time="1560492199914" index="14" i>';
          html    +=                     '<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="cobi_ment">';
          //코비 메세지 출력하기
          html    +=                  '안녕하세요 :) '+mem_nick+'님 반가워요~~~! <br>';
          html    +=                  '코비 사용법을 알고싶다면 '+"'매뉴얼'" + '이라는 명령어를 말씀해주세요~';
          html    +=                  '</div>';
          html    +=                  '<div class="unread_box">';
          html    +=                     '<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
          html    +=                  '</div>';
          html    +=               '</div>';
          html    +=            '</div>';
          html    +=         '</div>';
          html    +=   '</div>';
          cobi_cont.append(html);
          cobi_cont.scrollTop($("#cobi_container")[0].scrollHeight); // 스크롤
          //받은 메세지 출력하기
         
          
      //checked if 끝 
      }else{
//         alert("코비 OFF");
         cobi_stat.show();
         
         $("#info_start_cobi").attr("style", "display:none");
           $("#info_speak_now_cobi").attr("style", "display:none");
           $("#info_no_speech_cobi").attr("style", "display:none");
         
      }
      
   });//코비 ON/OFF 라디오 버튼 클릭했을 경우 
   
   
   $("#start_button_cobi").click(function () { // 녹음 시작
      if($("input[name='input_cobi']").is(":checked") ==  true){
      //사용자의 음성인식 출력 부분
      var html  = '<div class="talk row">';
      html    +=      '<div class="media-body chat_message_content my_message" >';
      html    +=         '<div class="cm-s-default triangle-border right">';
      html    +=            '<div class="continue_message" time="1560492211568" index="13">';
      html    +=               '<div class="unread_box">';
      html    +=                  '<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
      html    +=               '</div>';
      //사용자 음성인식 텍스트 출력 부분
      html    +=               '<div class="msg_body" style="max-width: 233px; font-size: 10pt;">';
      html    +=                  '<span class="final" id="final_span_cobi"></span>';
      html    +=                  '<span class="interim" id="interim_span_cobi"></span>';
      html    +=               '</div>';
      html    +=            '</div>';
      html    +=            '</div>';
      html    +=            '</div>';
      html    +=            '</div>';
      cobi_cont.append(html);
      cobi_cont.scrollTop($("#cobi_container")[0].scrollHeight);
      }
   });
    ////
   $("#stop_rec_cobi").click(function(){ // 녹음 종료
      if($("input[name='input_cobi']").is(":checked") ==  true){
    	  setTimeout(function() {
    		  var cobi_call = $("#final_span_cobi").text();
//    		  alert(cobi_call);
//            var cobi_call = $("#interim_span_cobi").text();
//            var cobi_call = cobi_call_1 + cobi_call_2;
//        var cobi_call = "26번 한줄주석해줘";
            var cobi_call_trim = cobi_call.replace(/(\s*)/g,""); // 모든 공백 제거 
            
            if(cobi_call.includes("한줄주석")){
               
               if((cobi_call.includes("한줄주석")&&cobi_call.includes("번"))||(cobi_call.includes("한줄주석")&&cobi_call.includes("번줄"))){
                  var line_count; 
                  line_count = cobi_call.replace(/[^0-9]/g,""); // 숫자 추출
                  var int_lc = parseInt(line_count);
                  
                  var line_string = javaEditor.getLine(int_lc-1); 
                  var screen_comment = "//  " + line_string; // 시작 라인 주석
                  
                  var resultSet = int_lc + "번 라인을 한줄주석으로 바꾸라는 말씀이시죠? 화면에 띄워드릴게요~^^"; 
                  
                  fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
                  
                  setTimeout(function() {
                	  javaEditor.replaceRange(screen_comment, {line : int_lc-1, ch : 0}, {line : int_lc-1, ch : 1000000});
                  }, 1000);
                  return;
               }
               
               var user_comment = cobi_call.substring(4);
//           alert(user_comment);
               var screen_comment = "// " + user_comment;
               
               var resultSet = "'" + user_comment + "' 을(를) 주석으로 입력하라는 말씀이시죠? 화면에 띄워드릴게요~^^"; 
               
               fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
               
               setTimeout(function() {
            	   insertString(javaEditor, screen_comment);
               }, 1000);
               
               return;
               
            }else if(cobi_call.includes("번줄")||cobi_call.includes("번부터")||cobi_call.includes("까지")||cobi_call.includes("에서")&&cobi_call.includes("주석")){
               var line_count; 
               line_count = cobi_call.replace(/[^0-9]/g,","); // 숫자 추출
               var array1 = line_count.split(",");
               var array2 = new Array();
               
               for(var i = 0; i < array1.length; i++){
                  if(array1[i] > 0 && array2[0]==null){
                     array2[0] = array1[i];
                  }else if(array1[i] > 0 && array2[0] > 0){
                     array2[1] = array1[i];
                  }
               }
//           alert(array2[0] + ", " + array2[1]);
               
               var int_ar1 = parseInt(array2[0]);
               var int_ar2 = parseInt(array2[1]);
               
               var first_line_string = javaEditor.getLine(int_ar1-1); 
               var screen_comment = "/*  " + first_line_string; // 시작 라인 주석
               
               var last_line_string = javaEditor.getLine(int_ar2-1); 
               var screen_comment2 = last_line_string + "  */"; // 마지막 라인 주석
               
               var resultSet =int_ar1 + "번부터 " + int_ar2 + "번까지 구간주석으로 입력하라는 말씀이시죠? 화면에 띄워드릴게요~^^"; 
               
               fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
               
               setTimeout(function() {
            	   javaEditor.replaceRange (screen_comment, {line : int_ar1-1, ch : 0}, {line : int_ar1-1, ch : 1000000});
                   javaEditor.replaceRange (screen_comment2, {line : int_ar2-1, ch : 0}, {line : int_ar2-1, ch : 1000000});
               }, 1000);
               
               return;
               
            }else if(cobi_call.includes("프로젝트 생성")||cobi_call.includes("프로젝트생성")||cobi_call.includes("프로젝트 만들")||cobi_call.includes("프로젝트만들")){
               
               var resultSet = "프로젝트 생성을 위한 창을 띄워드릴게요~^^";
               
               fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
               
               setTimeout(function() {
            	   fn_add_project();
               }, 1000);
               
               return;
               
            }else if(cobi_call.includes("파일찾기")||cobi_call.includes("파일 찾기")||
            		cobi_call.includes("파일검색")||cobi_call.includes("파일 검색")||
            	cobi_call.includes("파일찾")||cobi_call.includes("파일 찾")){
               
               var resultSet = "파일을 검색하기 위한 창을 띄워드릴게요~^^";
               
               fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
               
               setTimeout(function() {
            	   searchFile();
               }, 1000);
               
               return;
               
            }else if(cobi_call.includes("실행")||cobi_call.includes("결과")||cobi_call.includes("서버실행")){
               
               var resultSet = "현재 작업중인 파일을 실행해볼까요~? 만족하는 결과를 얻길 바라요>_<";
               
               fn_cobi_ment(resultSet, cobi_cont); // 코비멘트 출력
               
               setTimeout(function() {
            	   compile();
               }, 1000);
               
               return;
               
            }else{
               $.ajax({
                  type       : 'post',
                  url        : contextPath+'/laonide/cobi/ai_code.do',
                  dataType    : 'json', 
//                 async      : false,
                  data       : { cobi_call    : cobi_call },
                  error       : function(request,status,error,result){
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  },
                  success    : function(andView){
                     resultSet = andView.cobi_ment;
                     
                     fn_cobi_ment(resultSet, cobi_cont);
                     
                     if(resultSet.includes("나중에")||
                           resultSet.includes("만나요")||
                           resultSet.includes("다음에")||
                           resultSet.includes("이만")){ // 코비 마무리멘트 후 코비off상태로 변경 (2초 딜레이)
                        
                    	cobi_stat.show();
                        cobi_check.attr("checked", false);
                        return;
                     }
                     
                     setTimeout(function() {
                    	 var code = andView.code;
                         insertString(javaEditor, code);
                     }, 1000);
                     
                     return;
                     
                  }
               });
               
            }
           }, 2000);
          
      }
          
   });//ajax
          
   ///
}); // $(function(){}끝

function fn_cobi_ment(resultSet, cobi_cont) {
   //코비 말 셋팅하기
       var html = '<div class="talk media">';
       html    +=      '<a class="media-left padding-0px" href="#" style="float: left;">';
       html    +=         '<img class="user_profile_image" src="'+ cobi_img +'"></a>';
       html    +=            '<div class="media-body chat_message_content other_message" value="114402096223077553615_1zyce_google">';
       html    +=               '<div class="cm-s-default triangle-border left">';
       html    +=                  '<div class="continue_message" time="1560492199914" index="14">';
       html    +=                     '<div class="msg_body" style="max-width: 233px; font-size: 10pt;" id="cobi_ment">';
       //받은 메세지 출력하기
       html    +=                  resultSet;
       html    +=                  '</div>';
       html    +=                  '<div class="unread_box">';
       html    +=                     '<span class="unread_area badge" style="font-family: &amp; quot;"></span>';
       html    +=                  '</div>';
       html    +=               '</div>';
       html    +=            '</div>';
       html    +=         '</div>';
       html    +=   '</div>';
       cobi_cont.append(html);
       cobi_cont.scrollTop($("#cobi_container")[0].scrollHeight);
       
    //받은 메세지 출력하기
      $("#final_span_cobi").attr('id','NoID'); 
      $("#interim_span_cobi").attr('id','NoID2'); 
}