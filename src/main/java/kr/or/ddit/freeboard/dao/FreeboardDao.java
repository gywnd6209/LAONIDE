package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

public interface FreeboardDao {
	public FreeboardVO freeboardInfo(Map<String, String> params)throws Exception;
	public int totalCount(Map<String, String>params) throws Exception;
	public List<FreeboardVO> freeboardList(Map<String,String> params)throws Exception;
	public String insertFreeboard(FreeboardVO freeboardInfo, List<FreeboardFileVO> fileItemListm)throws Exception;
	public void updateFreeboard(FreeboardVO freeboardInfo)throws Exception;
	public void deleteFreeboard(Map<String, String> params)throws Exception;
	
	public String insertFreeboardReply(FreeboardVO freeboardInfo)throws Exception;
	public List<FreeboardVO> freeboardReplyList(Map<String, String> params) throws SQLException;
	public void updateFreeboardReply(FreeboardVO freeboardInfo) throws SQLException;
	public void updateHit(Map<String, String> params) throws Exception;
}
