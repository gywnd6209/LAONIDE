package kr.or.ddit.qaboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QaboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IQaboardDaoImpl implements IQaboardDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public QaboardVO qaboardInfo(Map<String, String> params)
			throws Exception {
//		client.update("qaboard.updateHit",params);
		return (QaboardVO) this.client.queryForObject("qaboard.qaboardInfo", params);
	}

	@Override
	public List<QaboardVO> qaboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("qaboard.qaboardList", params);
	}

	@Override
	public String insertQaboardInfo(QaboardVO freeboardInfo) throws Exception {
		return (String) this.client.insert("qaboard.insertQaboard", freeboardInfo);
	}
//	public String insertFreeboardInfo(FreeboardVO freeboardInfo,
//			List<FileItemVO> fileItemList) throws Exception {
//		return (String) this.client.insert("freeboard.insertFreeboard", freeboardInfo);
//	}

	@Override
	public void updateQaboardInfo(QaboardVO qaboardInfo) throws Exception {
		this.client.update("qaboard.updateQaboard", qaboardInfo);

	}

	@Override
	public void deleteQaboardInfo(Map<String, String> params)
			throws Exception {
		this.client.update("qaboard.deleteQaboard", params);
	}


	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		
		return (int) this.client.queryForObject("qaboard.totalCount", params);
	}

@Override
public String insertQaboardReplyInfo(QaboardVO qaboardInfo) throws Exception {
	
	return (String) this.client.insert("qaboard.insertQaboardReply", qaboardInfo);
}

@Override
public QaboardVO qaboardReplyInfo(Map<String, String> params) throws Exception {
	return (QaboardVO) this.client.queryForObject("qaboard.qaboardReplyInfo", params);
}

@Override
public void deleteQaboardReply(Map<String, String> params) throws Exception {
	this.client.update("qaboard.deleteQaboardReply", params);
}

@Override
public void updateHit(Map<String, String> params) throws Exception {
	this.client.update("qaboard.updateHit", params);
}

}
