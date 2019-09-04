package kr.or.ddit.qaboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QaboardVO;

public interface IQaboardDao {
	public QaboardVO qaboardInfo(Map<String, String> params) throws Exception;
	public List<QaboardVO> qaboardList(Map<String, String> params) throws Exception;
//	public String insertFreeboardInfo(QaboardVO qaboardInfo, List<FileItemVO> fileItemList) throws Exception;
	public String insertQaboardInfo(QaboardVO qaboardInfo) throws Exception;
	public void updateQaboardInfo(QaboardVO qaboardInfo) throws Exception;
	public void deleteQaboardInfo(Map<String, String> params) throws Exception;
	
	public void deleteQaboardReply(Map<String, String> params) throws Exception;
	
	// 댓글
	public String insertQaboardReplyInfo(QaboardVO qaboardInfo) throws Exception;
	public QaboardVO qaboardReplyInfo(Map<String, String> params) throws Exception;
	
	// 페이지
	public int totalCount(Map<String, String> params) throws Exception;
	
	public void updateHit(Map<String, String> params) throws Exception;
}
