package kr.or.ddit.issuetracker.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IssueMainDaoImpl implements IssueMainDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public ProInfoVO proInfo(Map<String, String> params)throws Exception {
		
		return (ProInfoVO) this.client.queryForObject("issuehome.proInfo", params);
	}
	
	@Override
	public String insertPro(ProInfoVO proInfo)
			throws SQLException {
		String pro_code = "";
		try {
			client.startTransaction();

			pro_code = (String) client.insert("issuehome.insertPro",proInfo);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return pro_code;
	}
	
	@Override
	public List<ProInfoVO> proList()throws Exception {
		// TODO Auto-generated method stub
		return this.client.queryForList("issuehome.proMain");
	}

	/**
	 *  프로젝트 메인
	 */
	@Override
	public List<ProInfoVO> proMain(Map<String, String> params) throws Exception {
		return this.client.queryForList("issuehome.proListDetail", params);
	}

	/**
	 *  프로젝트 수정
	 */
	@Override
	public void updatePro(ProInfoVO proInfo) throws Exception {
		this.client.update("issuehome.updatePro",proInfo);
		
	}

	/**
	 *  프로젝트 삭제
	 */
	@Override
	public void deletePro(ProInfoVO proInfo) throws Exception {
		this.client.update("issuehome.deletePro",proInfo);
	}

	/**
	 *  프로젝트 수정단
	 */
	@Override
	public List<ProInfoVO> proListDetail(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("issuehome.proListDetail",params);
	}
	

}
