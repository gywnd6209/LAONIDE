package kr.or.ddit.solboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.SolboardVO;

@Repository
public class ISolboardDaoImpl implements ISolboardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public SolboardVO solboardInfo(Map<String, String> params) throws Exception {
		return (SolboardVO) client.queryForObject("solboard.solboardInfo",params);
	}

	@Override
	public List<SolboardVO> solboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("solboard.solboardList", params);
	}
	
	@Override
	public String insertSolBoardInfo(SolboardVO solboardInfo) throws Exception {
		String sol_no="";
		try {
			client.startTransaction();
			sol_no = (String) client.insert("solboard.insertSolboard", solboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return sol_no;
	}

	@Override
	public void updateSolBoardInfo(SolboardVO solboardInfo) throws Exception {
		client.update("solboard.updateSolboard", solboardInfo);
	}

	@Override
	public void deleteSolBoardInfo(Map<String, String> params) throws Exception {
		client.update("solboard.deleteSolboard", params);
		
	}
}
