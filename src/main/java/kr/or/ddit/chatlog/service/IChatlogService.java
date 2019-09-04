package kr.or.ddit.chatlog.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatLogVO;

public interface IChatlogService {
	public List<ChatLogVO> chatList(Map<String, String> params) throws Exception;
	public String chatTime(Map<String, String> params) throws Exception;
	public String insertChatLog(Map<String, String> params) throws Exception;
}
