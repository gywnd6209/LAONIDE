package kr.or.ddit.controller.websocket.endpoint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.filter.PrincipalWithSession;
import kr.or.ddit.utiles.BeanUtils;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;

@ServerEndpoint("/syncpush")
public class ScyncPush {
//	private static Set<Session> clients = Collections
//			.synchronizedSet(new HashSet<Session>());
	private static ArrayList<Session> clients = new ArrayList<Session>(); 
	private HttpSession httpSession;
	
	private ICrewInfoService crewService;
	
	public ScyncPush() {
		crewService = (ICrewInfoService) BeanUtils.getBean("ICrewInfoServiceImpl");
	}

	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		
		// 메세지를 보낸 회원의 세션 아이디 가져오기
		HttpSession msg_session = ((PrincipalWithSession)session.getUserPrincipal()).getSession();
		MemberVO msg_member = (MemberVO) msg_session.getAttribute("LOGIN_MEMBERINFO");
		String msg_member_id = msg_member.getMem_id();
		
		
		System.out.println("msg_session : " + msg_session);
		System.out.println("msg_member_id : " + msg_member_id);

		System.out.println(message);
		// ex : self/team:session_id:pro_code:ISSUE/BOARD/ERROR
		String arr_msg[] = message.split(":");
		Map<String, String> params = new HashMap<String, String>();
		
		for (int i = 0; i < arr_msg.length; i++) {
			System.out.println(arr_msg[i]);
		}
		
		List<CrewInfoVO> notInLoginIDList = new ArrayList<CrewInfoVO>();
		
		if(arr_msg[0].equals("team")){
			
			// 보낼 메시지 구성
			String sendMessage = "";
			String board = "";
			if(arr_msg[3].equals("ISSUE")){
				board = "이슈가 ";
			}else if(arr_msg[3].equals("BOARD")){
				board = "게시글이 ";
			}else{
				board = "결함이 ";
			}
			
			// team일 경우
			params.put("mem_id", arr_msg[1]);
			params.put("pro_code", arr_msg[2]);
			
			notInLoginIDList =  crewService.notInLoginID(params);
			
			
			for (Session client : clients) {
				httpSession = ((PrincipalWithSession)client.getUserPrincipal()).getSession();
				MemberVO member = (MemberVO) httpSession.getAttribute("LOGIN_MEMBERINFO");
				String member_id = member.getMem_id();
				
//				if (!client.equals(session)) {
//					client.getBasicRemote().sendText(message);
//				}
				for(CrewInfoVO notInLoginID : notInLoginIDList){
					String crew_mem_id = notInLoginID.getMem_id();
					if (member_id.equals(crew_mem_id)) {
						sendMessage = "'" + notInLoginID.getPro_name() + "'프로젝트에 새로운 " + board + "추가 되었습니다.";
						client.getBasicRemote().sendText(sendMessage);
					}
				}
				System.out.println("httpSession : " + httpSession);
				System.out.println("client.getId() : " +client.getId());
				
				System.out.println("member_id : " + member_id);
			}
			
		}
		
		
//		synchronized (clients) {
			
//		for (Session client : clients) {
//			httpSession = ((PrincipalWithSession)client.getUserPrincipal()).getSession();
//			MemberVO member = (MemberVO) httpSession.getAttribute("LOGIN_MEMBERINFO");
//			String member_id = member.getMem_id();
//			
////				if (!client.equals(session)) {
////					client.getBasicRemote().sendText(message);
////				}
//			if (member_id.equals(msg_member_id)) {
//				client.getBasicRemote().sendText(message);
//			}
//			System.out.println("httpSession : " + httpSession);
//			System.out.println("client.getId() : " +client.getId());
//			
//			System.out.println("member_id : " + member_id);
//		}
			
//		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
}
