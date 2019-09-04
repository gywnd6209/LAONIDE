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

import kr.or.ddit.chatlog.service.IChatlogService;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.filter.PrincipalWithSession;
import kr.or.ddit.utiles.BeanUtils;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@ServerEndpoint("/chatting")
public class TeamChatting {

	private static ArrayList<Session> sessionList = new ArrayList<Session>();
	private HttpSession httpSession;
	
	private IChatlogService chatService;
	private ICrewInfoService crewService;
	
	public TeamChatting() {
		chatService = (IChatlogService) BeanUtils.getBean("IChatlogServiceImpl");
		crewService = (ICrewInfoService) BeanUtils.getBean("ICrewInfoServiceImpl");
	}
	private Map<String, String> params;
	
	@OnMessage
	public void onMessage(String message, Session session) throws Exception {

		System.out.println(message);
		JSONParser parser = new JSONParser();
		Object object = parser.parse(message);
		JSONObject jsonObj = (JSONObject) object;
		
		String type = jsonObj.get("type").toString();
		
		if(type.equals("livecode")){
			

			String hl 		=  jsonObj.get("hl").toString();
			String getline 	=  jsonObj.get("getline").toString();
			String pro_link =  jsonObj.get("pro_link").toString();
			String mem_id 	=  jsonObj.get("mem_id").toString();
			String cline 	=  jsonObj.get("cline").toString();
			String cch 		=  jsonObj.get("cch").toString();
			String mem_nick =  jsonObj.get("mem_nick").toString();
			String Enter    =  jsonObj.get("Enter").toString();
			String code    =  jsonObj.get("code").toString();
			
			JSONObject json_message = new JSONObject();
			json_message.put("hl", hl);
			json_message.put("getline", getline);
			json_message.put("type", type);
			json_message.put("cline", cline);
			json_message.put("cch", cch);
			json_message.put("mem_nick", mem_nick);
			json_message.put("Enter", Enter);
			json_message.put("code", code);
			
			String sendMsg = json_message.toJSONString();
			System.out.println("메세지 : " + sendMsg);
//			System.out.println("메pro_link지 : " + pro_link);
			params = new HashMap<String, String>();
			params.put("pro_link", pro_link);

			List<CrewInfoVO> crewListByProLink = crewService.crewListByProLink(params);
			
			
			for (Session client : sessionList) {
//				client.getBasicRemote().sendText(sendMsg);
				httpSession = ((PrincipalWithSession) client.getUserPrincipal())
						.getSession();
				MemberVO member = (MemberVO) httpSession
						.getAttribute("LOGIN_MEMBERINFO");
				String member_id = member.getMem_id();

				for (CrewInfoVO notInLoginID : crewListByProLink) {
					String crew_mem_id = notInLoginID.getMem_id();
					if (member_id.equals(crew_mem_id) && !mem_id.equals(crew_mem_id) ) {
						System.out.println("나와라!");
						client.getBasicRemote().sendText(sendMsg);
					}
				}
			}
			
			
		}else if(type.equals("teamchat")){
			
			String chat_cont 	= jsonObj.get("chat_cont").toString();
			String mem_nick 	= jsonObj.get("mem_nick").toString();
			String mem_id 		= jsonObj.get("mem_id").toString();
			String pro_link 	= jsonObj.get("pro_link").toString();
			String chat_time 	= jsonObj.get("chat_time").toString();
			
			params = new HashMap<String, String>();
			params.put("chat_cont", chat_cont);
			params.put("mem_nick", mem_nick);
			params.put("mem_id", mem_id);
			params.put("pro_link", pro_link);
			params.put("chat_time", chat_time);
			
			// log insert
			String chat_no = chatService.insertChatLog(params);
			
			params.put("chat_no", chat_no);
			String send_chat_time = chatService.chatTime(params);
			
			// 클라이언트에 보낼 json 처리
			JSONObject json_message = new JSONObject();
			json_message.put("chat_cont", chat_cont);
			json_message.put("mem_nick", mem_nick);
			json_message.put("mem_id", mem_id);
			json_message.put("chat_time", send_chat_time);
			json_message.put("type", "teamchat");
			
			String sendMsg = json_message.toJSONString();
			
			List<CrewInfoVO> crewListByProLink = crewService.crewListByProLink(params);
			
			
			for (Session client : sessionList) {
				httpSession = ((PrincipalWithSession) client.getUserPrincipal())
						.getSession();
				MemberVO member = (MemberVO) httpSession
						.getAttribute("LOGIN_MEMBERINFO");
				String member_id = member.getMem_id();
				
				for (CrewInfoVO notInLoginID : crewListByProLink) {
					String crew_mem_id = notInLoginID.getMem_id();
					if (member_id.equals(crew_mem_id)) {
						client.getBasicRemote().sendText(sendMsg);
					}
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		sessionList.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		sessionList.remove(session);
	}
}
