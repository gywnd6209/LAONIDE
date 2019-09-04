package kr.or.ddit.chatlog.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ChatLogVO;
@Repository
public class IChatlogDaoImpl implements IChatlogDao {
	@Autowired
	private SqlMapClient client;
	@Override
	public List<ChatLogVO> chatList(Map<String, String> params)
			throws Exception {
		return client.queryForList("cahtlog.chatList", params);
	}

	@Override
	public String insertChatLog(Map<String, String> params) throws Exception {
		return (String) client.insert("cahtlog.insertChatLog", params);
	}

	@Override
	public String chatTime(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("cahtlog.chatTime", params);
	}

}
