package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.freeboardfile.dao.FreeboardFileDao;
import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private FreeboardFileDao fileDao;
	
	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
//		this.client.update("freeboard.updateHit", params);
		return (FreeboardVO) this.client.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public String insertFreeboard(FreeboardVO freeboardInfo,
			List<FreeboardFileVO> fileItemList) throws Exception {
		String bo_no = (String) client.insert("freeboard.insertFreeboard", freeboardInfo);
		
		fileDao.insertFileItem(fileItemList, bo_no);
		
		return bo_no;
	}

	@Override
	public String insertFreeboardReply(FreeboardVO freeboardInfo)
			throws Exception {
		String bo_no="";
		
		try {
			client.startTransaction();
			
			String bo_seq = (String) client.queryForObject("freeboard.incrementSeq", freeboardInfo);
			freeboardInfo.setBo_seq(bo_seq);
			
			bo_no = (String) client.insert("freeboard.insertFreeboardReply", freeboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
		return bo_no;
	}

	@Override
	public void updateFreeboard(FreeboardVO freeboardInfo) throws Exception {
		this.client.update("freeboard.updateFreeboard", freeboardInfo);
	}

	@Override
	public void deleteFreeboard(Map<String, String> params)
			throws Exception {
		this.client.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("freeboard.totalCount", params);
	}

	@Override
	public List<FreeboardVO> freeboardReplyList(Map<String, String> params) throws SQLException {
		return this.client.queryForList("freeboard.freeboardReplyList", params);
	}

	@Override
	public void updateFreeboardReply(FreeboardVO freeboardInfo) throws SQLException {
		client.update("freeboard.updateFreeboardReply", freeboardInfo);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		this.client.update("freeboard.updateHit", params);
	}
}
