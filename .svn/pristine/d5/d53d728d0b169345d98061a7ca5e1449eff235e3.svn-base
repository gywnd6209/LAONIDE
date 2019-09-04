package kr.or.ddit.qaboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.QaboardVO;

public interface IQaboardService {
	
	public QaboardVO qaboardInfo(Map<String, String> params) throws Exception;
	public List<QaboardVO> qaboardList(Map<String, String> params)throws Exception;
																	//
//	public String insertFreeboardInfo(QaboardVO qaboardInfo, MultipartFile[] items) throws Exception;
	public String insertQaboardInfo(QaboardVO qaboardInfo) throws Exception;

	public void updateQaboardInfo(QaboardVO qaboardInfo) throws Exception;
	public void deleteQaboardInfo(Map<String, String> params) throws Exception;
	
	public void deleteQaboardReply(Map<String, String> params) throws Exception;
	
	// 댓글
	public String insertQaboardReplyInfo(QaboardVO freeboardInfo) throws Exception; 
	public QaboardVO qaboardReplyInfo(Map<String, String> params) throws Exception;
	
	// 페이지
	public int totalCount(Map<String, String> params) throws Exception;
	
	// f5 방지
	public void updateHit(Map<String, String> params) throws Exception;
}
