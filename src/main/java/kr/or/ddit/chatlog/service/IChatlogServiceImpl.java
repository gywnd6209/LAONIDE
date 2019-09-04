package kr.or.ddit.chatlog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.chatlog.dao.IChatlogDao;
import kr.or.ddit.vo.ChatLogVO;
@Service("IChatlogServiceImpl")
public class IChatlogServiceImpl implements IChatlogService {
	
	@Autowired
	private IChatlogDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ChatLogVO> chatList(Map<String, String> params)
			throws Exception {
		return dao.chatList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertChatLog(Map<String, String> params) throws Exception {
		return dao.insertChatLog(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String chatTime(Map<String, String> params) throws Exception {
		return dao.chatTime(params);
	}

}
