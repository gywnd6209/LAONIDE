package kr.or.ddit.codeAi.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import kr.or.ddit.codeAi.service.ICodeAIService;
import kr.or.ddit.vo.AICodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/laonide/cobi/")
public class CodeAIController {
	
	@Autowired
	private ICodeAIService cobi_service;
	
	
	@RequestMapping("ai_code")
	public ModelAndView ai_code(String cobi_call, 
								String cobi_ment, 
								AICodeVO cobiInfo,
								ModelAndView andView) throws Exception{
		
		String code = "";
		
		cobi_ment = match(cobi_call, cobiInfo).get("cobi_ment");
		code = match(cobi_call, cobiInfo).get("code");
		andView.addObject("code", code);
		andView.addObject("cobi_ment", cobi_ment);
		andView.setViewName("jsonConvertView");
		
		TimeUnit.SECONDS.sleep(1);
		
		return andView;
	}

	
	public HashMap<String, String> match(String cobi_call, AICodeVO cobiInfo) throws Exception{
		
		String cobi_ment = "";
		String code = "";
		HashMap<String, String> params = new HashMap<String, String>();
		 
//		String[] command_cobi = {"코비", "코비야", "저기", "안녕", "하이"};
//		String[] command_manual = {"매뉴얼", "메뉴얼", "메누얼", "매누얼"};
//		
//		for(int i = 0; i < command_cobi.length; i++){
//			if(cobi_call.contains(command_cobi[i])){
//				
//			}
//		}
		if(cobi_call.contains("코비")||cobi_call.contains("코비야")||cobi_call.contains("저기")||
				cobi_call.contains("안녕")||cobi_call.contains("하이")){
			String lastMent[] = {"안녕하세요! 무엇을 도와드릴까요?", "안녕하세요! 저는 당신의 코딩비서 코비입니다! <br>무엇을 도와드릴까요?", "안녕하세요~ 코비에게 무엇이든 물어보세요~!", 
					"코비코비~~ 저를 부르시길 기다렸어요~~ 무엇을 도와드릴까요?", "만나서 반가워요 저는 당신의 코딩비서 코비랍니다~^^ 무엇을 도와드릴까요?"};

			int i = (int)(Math.random()*(lastMent.length));
			
			cobi_ment = lastMent[i];
			
		}else if(cobi_call.contains("매뉴얼")||cobi_call.contains("메뉴얼")||
						cobi_call.contains("메누얼")||cobi_call.contains("매누얼")){
			cobi_ment = "코비를 어떻게 사용하는지 알려드릴게요~! <br><br>"
					+ "첫번째로 원하는 샘플코드명을 말씀해주시면 코비가 사용자님이 작업중이신 화면에 샘플코드를 띄워드린답니다~! <br>"
					+ "코비명령어 : 메인메서드, 출력메서드(System.out.println), if문, for문, while문, tryCatch문, switch문, Array, ArrayList, HashMap 등<br><br>"
					+ "다른기능으로는 주석달기와 ide기능실행이 있답니다~ <br>"
					+ "주석 예시) 한줄주석 안녕코비(한줄주석), 1번라인 한줄주석(라인선택하여 주석), 1번부터 10번까지 주석(구간주석) 등 <br>"
					+ "ide기능 실행 예시) 프로젝트 생성, 서버실행, 작업결과보여줘! 등 ide기능을 수행할 수 있어요!! <br><br>"
					+ "언제나 코비와 함께 해주세요~~>_<";
		}else if(cobi_call.contains("메인")||cobi_call.contains("메인 메써드")||
				cobi_call.contains("메인메써드")||cobi_call.contains("메인메서드")||
				cobi_call.contains("메인 메서드")||cobi_call.contains("메인 메소드")||cobi_call.contains("메인메소드")){
			cobi_ment = "메인 메서드 샘플코드를 화면에 띄워드릴게요~!";
			params.put("user_command", "mainMethod");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("for문")||
				cobi_call.contains("포문")||
				cobi_call.contains("뽀문")||
				cobi_call.contains("퍼문")||
				cobi_call.contains("formoon")||
				cobi_call.contains("보문")){
			
			cobi_ment = "for문 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "for");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("if문")||
				cobi_call.contains("이프")||
				cobi_call.contains("이프문")||
				cobi_call.contains("입으문")||
				cobi_call.contains("이쁜 문")||
				cobi_call.contains("ifmoon")||
				cobi_call.contains("if")||
				cobi_call.contains("입프문")||
				cobi_call.contains("입프")){
			cobi_ment = "if문 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "if");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("while")||
				cobi_call.contains("와일")||
				cobi_call.contains("와일문")){
			cobi_ment = "while문 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "while");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("try catch")||cobi_call.contains("트라이캐치")||
				cobi_call.contains("트라이캣치")||cobi_call.contains("트라이캣찌")||
				cobi_call.contains("추라이캩치")||cobi_call.contains("트라이켓")||
				cobi_call.contains("트라이캣치")||cobi_call.contains("트라이켓치")||
				cobi_call.contains("프라이팬")||cobi_call.contains("츄라이캐치")){
			cobi_ment = "try Catch문 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "tryCatch");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("출력메서드")||cobi_call.contains("시쓰아욷")||
				cobi_call.contains("씨스")||cobi_call.contains("시쓰아웃")||
				cobi_call.contains("씨쓰")||cobi_call.contains("시쓰")||
				cobi_call.contains("씨쓰아우")||cobi_call.contains("시스아웃")||
				cobi_call.contains("씨쓰아웃")||cobi_call.contains("시스아욷")||
				cobi_call.contains("출력메써드")||cobi_call.contains("프린트린")||
				cobi_call.contains("출력 메써드")||cobi_call.contains("시스")||
				cobi_call.contains("출력 메서드")){
			cobi_ment = "System.out.println()을(를) 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "sysout");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("switch")||cobi_call.contains("스위치")||
				cobi_call.contains("스윗티")||cobi_call.contains("스위티")||
				cobi_call.contains("스위취")){
			cobi_ment = "switch문 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "switch");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("array")||cobi_call.contains("어레이")||
				cobi_call.contains("어래이")||cobi_call.contains("어뤠이")){
			cobi_ment = "Array 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "array");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("arrayList")||cobi_call.contains("array List")||
				cobi_call.contains("어레이리스트")||cobi_call.contains("어래이리스트")||
				cobi_call.contains("어뤠이리스트")||cobi_call.contains("어레이 리스트")||
				cobi_call.contains("어래이 리스트")||cobi_call.contains("어뤠이 리스트")){
			cobi_ment = "ArrayList 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "arrayList");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("hashMap")||cobi_call.contains("hash Map")||
				cobi_call.contains("해쉬맵")||cobi_call.contains("해시맵")||
				cobi_call.contains("헤쉬맵")||cobi_call.contains("헤시맵")||
				cobi_call.contains("해쉬 맵")||cobi_call.contains("해시 맵")||
				cobi_call.contains("헤쉬 맵")||cobi_call.contains("헤시 맵")){
			cobi_ment = "HashMap 샘플코드를 말씀하시는건가요? 화면에 띄워드릴게요~!";
			params.put("user_command", "hashMap");
			cobiInfo = cobi_service.cobiInfo(params);
			code = cobiInfo.getSample_code();
			
		}else if(cobi_call.contains("그만할래")||cobi_call.contains("그만")||
				cobi_call.contains("조용히해")||cobi_call.contains("갈래")||
				cobi_call.contains("나갈래")||cobi_call.contains("갈게")||
				cobi_call.contains("나갈게")||cobi_call.contains("꺼져")||
				cobi_call.contains("닥쳐")||cobi_call.contains("코비오프")||
				cobi_call.contains("오프")){
			
			String lastMent[] = {"코비는 언제나 당신곁에~ 다음에 또 만나요~!", "저는 이만 가볼게요~ 다음에 또 저를 불러주세요~!", "또 만나요 안녕~!!", 
					"저는 이만 가봐야겠어요 안녕~!", "벌써 가신다구요~?ㅠ 서운하지만 나중에 또 만나요~~!"};

			int i = (int)(Math.random()*(lastMent.length));
			
			cobi_ment = lastMent[i];
			
		}else{
			String lastMent[] = {"다시 말씀해주시겠어요? 이해가 잘 안 되네요.", "알아듣기 쉽게 다시 말씀해주시면 좋겠어요.", 
								"뭐라고 하시는지 모르겠어요ㅠㅠ", "그게 무슨말씀이시죠? 잘 모르겠어요.."};

			int i = (int)(Math.random()*(lastMent.length));
			
			cobi_ment = lastMent[i];
			
		}
		
		
		HashMap<String, String> twoValue = new HashMap<String, String>();
		
		twoValue.put("cobi_ment", cobi_ment);
		twoValue.put("code", code);
		
		return twoValue;
	}
	
}
















