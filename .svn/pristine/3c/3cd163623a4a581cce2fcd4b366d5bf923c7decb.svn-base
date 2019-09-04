package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeVO;

public interface NoticeService {
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	public String insertNotice(NoticeVO noticeInfo) throws Exception;
	public String insertNoticeReply(NoticeVO noticeInfo) throws Exception;
	public void updateNotice(NoticeVO noticeInfo) throws Exception;
	public void deleteNotice(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	
	// f5 방지
		public void updateHit(Map<String, String> params) throws Exception;
}
