package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeVO;

public interface NoticeDao {
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	public String insertNotice(NoticeVO noticeInfo) throws Exception;
	public String insertNoticeReply(NoticeVO noticeInfo) throws Exception;
	public void updateNotice(NoticeVO noticeInfo) throws Exception;
	public void deleteNotice(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	
	public void updateHit(Map<String, String> params) throws Exception;
}
