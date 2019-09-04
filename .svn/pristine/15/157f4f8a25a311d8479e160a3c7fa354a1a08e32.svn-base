package kr.or.ddit.proInfo.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IProInfoDaoImpl implements IProInfoDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public ProInfoVO proInfoInfo(Map<String, String> params)throws Exception {
		
		return (ProInfoVO) this.client.queryForObject("proInfo.proInfoInfo", params);
	}
	
	@Override
	public String insertProInfo(ProInfoVO proInfo)
			throws SQLException {
		String pro_code = "";
        try {
           client.startTransaction();

           pro_code = (String) client.insert("proInfo.insertProInfo",proInfo);
           
           client.commitTransaction();
        } finally {
           client.endTransaction();
        }
        return pro_code;
	}
	
	@Override
	public List<ProInfoVO> proInfoList()throws Exception {
		// TODO Auto-generated method stub
		return this.client.queryForList("proInfo.proInfoList");
	}

	/**
	 *  프로젝트 메인
	 */
	@Override
	public List<ProInfoVO> proInfoMain(Map<String, String> params) throws Exception {
		return this.client.queryForList("proInfo.proInfoMain", params);
	}

	/**
	 *  프로젝트 수정
	 */
	@Override
	public void updateProInfo(ProInfoVO proInfo) throws Exception {
		this.client.update("proInfo.updateProInfo",proInfo);
		
	}

	/**
	 *  프로젝트 삭제
	 */
	@Override
	public void deleteProInfo(ProInfoVO proInfo) throws Exception {
		this.client.update("proInfo.deleteProInfo",proInfo);
	}

	/**
	 *  프로젝트 수정단
	 */
	@Override
	public List<ProInfoVO> proInfoListDetail(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("proInfo.proInfoListDetail",params);
	}
	
	@Override
	public ProInfoVO forProlink(Map<String, String> params) throws Exception {
		return (ProInfoVO) this.client.queryForObject("proInfo.forProlink", params);
	}
	
	@Override
	public ProInfoVO byProlink(Map<String, String> params) throws Exception {
		return (ProInfoVO) this.client.queryForObject("proInfo.byProlink", params);
	}

}
