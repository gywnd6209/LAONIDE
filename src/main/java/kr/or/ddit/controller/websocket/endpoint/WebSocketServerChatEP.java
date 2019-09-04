package kr.or.ddit.controller.websocket.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.chatlog.service.IChatlogService;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.filter.PrincipalWithSession;
import kr.or.ddit.utiles.BeanUtils;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
@ServerEndpoint("/wschat")
public class WebSocketServerChatEP {
	
	
	private static ArrayList<Session> sessionList = new ArrayList<Session>(); 
//	private static ArrayList<Object[]> sessionList = new ArrayList<Object[]>(); 
	private HttpSession httpSession; 
	private MemberVO loginMV;
	private static List<String[]> loginID = new ArrayList<String[]>(); 
	
	
	private static ArrayList<Session> clients = new ArrayList<Session>(); 
	
	private Map<String, String> params;
	
	private ICrewInfoService crewService;
	
	public WebSocketServerChatEP() {
		crewService = (ICrewInfoService) BeanUtils.getBean("ICrewInfoServiceImpl");
	}

	@OnOpen 
	public void onOpen(Session session){ 
		// javax.websocket.Session을 통한 HttpSession 취득
		
		// 로그인 아이디 들어있음
		/*httpSession = ((PrincipalWithSession)webSocketSession.getUserPrincipal()).getSession();
		System.out.println("		httpSession : " + 		httpSession);
		System.out.println("		httpSession.mem_id : " + 		httpSession.getId());
		MemberVO memberid = (MemberVO) httpSession.getAttribute("LOGIN_MEMBERINFO");
//		String[] login_session_ID = {memberid.getMem_id(), webSocketSession.getId()};
		Object[] login_session_ID = {memberid.getMem_id(), webSocketSession};
//		loginID.add(login_session_ID);
        sessionList.add(login_session_ID); */
		
		
		// 클라이언트의 WebSocket 생성시 콜백.
//	    try{ 
//	        sessionList.add(webSocketSession); 
	        // 신규 접근 클라이언트 대상 메세지 전송.
	        // 이거하면 됡같은데..
//	        webSocketSession.getBasicRemote().sendText("WebSocket 서버에 접속되었습니다!"); 
//	    }catch(IOException e){} 

		System.out.println(session);
		clients.add(session);
	} 
	 
	@OnClose 
	public void onClose(Session session){ 
		// 클라이언트의 웹소켓 리소스 close() 호출에따라 콜백.
	    sessionList.remove(session); 
	} 
	 
	@OnMessage
	public void onMessage(String msg ) throws Exception{ 
	/*	// msg를 split(:)으로 잘라서 활용할 예정
		// ex : self/team:session_id:pro_code
		String arr_msg[] = msg.split(":");
		Map<String, String> params = new HashMap<String, String>();
		
		// self일 이유가 없다. 왜냐면..그건 notify로 띄우면 되니깐..
		if(arr_msg[0].equals("team")){
			// team일 경우
			params.put("mem_id", arr_msg[1]);
			params.put("pro_code", arr_msg[2]);
			List<CrewInfoVO> notInLoginID =  this.crewService.notInLoginID(params);
			for(CrewInfoVO crewInfo : notInLoginID){
				String crew_mem_id = crewInfo.getMem_id();
				String crew_mem_nick = crewInfo.getMem_nick();
				loginMV = (MemberVO) httpSession.getAttribute("LOGIN_MEMBERINFO");
//				String login
			}
		}
//		httpSession.getAttribute("LOGIN_MEMBERINFO");
//		List<MemberVO> loginMVList =  (List<MemberVO>) httpSession.getAttribute("LOGIN_MEMBERINFO");
//		for(String[] memid : loginID){
//			System.out.println("memid : " + memid[0]);
//			System.out.println("memsessionid : " + memid[1]);
//		}
		
		// 클라이언트의 WebSocket.send() 호출에따라 콜백.
	    try{ 
	    	// 브로드캐스팅(모든 세션 대상 메세지 송신)
	        for(Object[] ob_session : sessionList){ 
	        	Session session = (Session) ob_session[1];
	        	String mem_id = (String) ob_session[0];
	        	Basic clientBase = session.getBasicRemote();
	        	// HttpSession ID값을 매개로 생성된 javax.websocket.Session의 ID 속성값 취득 및
	        	// 유니캐스팅, 멀티캐스팅에 활용
	        	System.out.println("ID : " + session.getId());
	        	System.out.println("mem_id : " + mem_id);
//	        	System.out.println("httpsessionID : " + httpSession.getAttribute("LOGIN_MEMBERINFO"));
	        	
	            clientBase.sendText(msg); 
	        } 
	    }catch(IOException e){} 
	    */
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( msg );
		JSONObject jsonObj = (JSONObject) obj;

		System.out.println(jsonObj);
		
		String hl = jsonObj.get("hl").toString();
		String getline =  jsonObj.get("getline").toString();
		String pro_link =  jsonObj.get("pro_link").toString();
		String mem_id =  jsonObj.get("mem_id").toString();
	    
		
		JSONObject json_message = new JSONObject();
		json_message.put("hl", hl);
		json_message.put("getline", getline);
	    
		String sendMsg = json_message.toJSONString();
		System.out.println("메세지 : " + sendMsg);
//		System.out.println("메pro_link지 : " + pro_link);
		params = new HashMap<String, String>();
		params.put("pro_link", pro_link);

		List<CrewInfoVO> crewListByProLink = crewService.crewListByProLink(params);
		
		
		for (Session client : clients) {
//			client.getBasicRemote().sendText(sendMsg);
			httpSession = ((PrincipalWithSession) client.getUserPrincipal())
					.getSession();
			MemberVO member = (MemberVO) httpSession
					.getAttribute("LOGIN_MEMBERINFO");
			String member_id = member.getMem_id();

			for (CrewInfoVO notInLoginID : crewListByProLink) {
				String crew_mem_id = notInLoginID.getMem_id();
				if (member_id.equals(crew_mem_id) && !mem_id.equals(crew_mem_id) ) {
					client.getBasicRemote().sendText(sendMsg);
				}
			}
		}
		
		
	} 
	
    @OnError
    public void onError(Throwable exception) throws Throwable {
        System.out.println("Chat Error: " + exception.toString());
    }
}
