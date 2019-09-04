package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
//		client.update("notice.updateHit", params);
		return (NoticeVO) this.client.queryForObject("notice.noticeInfo", params);
	}
	
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception {
//		return this.client.queryForList("notice.noticeAllList", params);
		return this.client.queryForList("notice.noticeList", params);
	}

	@Override
	public String insertNotice(NoticeVO noticeInfo) throws Exception {
//		String bo_no = "";
//		try {
//			client.startTransaction();
//			bo_no = (String) this.client.insert("notice.insertNotice", noticeInfo);
//			client.commitTransaction();
//		} finally {
//			client.endTransaction();
//		}
//		
//		return bo_no;
		return (String) this.client.insert("notice.insertNotice", noticeInfo);
	}

//	@Override
//	public String insertNoticeReply(NoticeVO noticeInfo) throws Exception {
//		return (String) this.client.insert("notice.insertNoticeReply", noticeInfo);
//	}

	@Override
	public void updateNotice(NoticeVO noticeInfo) throws Exception {
		this.client.update("notice.updateNotice", noticeInfo);
	}

	@Override
	public void deleteNotice(Map<String, String> params) throws Exception {
		this.client.update("notice.deleteNotice", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("notice.totalCount", params);
	}

	@Override
	public String insertNoticeReply(NoticeVO noticeInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.client.update("notice.updateHit", params);
	}

}
