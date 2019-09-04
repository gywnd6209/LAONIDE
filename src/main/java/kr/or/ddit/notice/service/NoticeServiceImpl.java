package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.notice.dao.NoticeDao;
import kr.or.ddit.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		return this.dao.noticeInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception {
		return this.dao.noticeList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertNotice(NoticeVO noticeInfo) throws Exception {
//		String bo_no = null;
//		try {
//			bo_no = dao.insertNotice(noticeInfo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bo_no;
		return this.dao.insertNotice(noticeInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertNoticeReply(NoticeVO noticeInfo) throws Exception {
		return this.dao.insertNoticeReply(noticeInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateNotice(NoticeVO noticeInfo) throws Exception {
		this.dao.updateNotice(noticeInfo);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteNotice(Map<String, String> params) throws Exception {
		this.dao.deleteNotice(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.dao.updateHit(params);
	}
}
