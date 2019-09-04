package kr.or.ddit.ideworkspace.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IDEWorkspaceVO;
@Repository
public class IIdeworkspaceDaoImpl implements IIdeworkspaceDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void createWS(IDEWorkspaceVO idewsInfo) throws Exception {
		this.client.insert("ideworkspace.createWS", idewsInfo);
	}

	@Override
	public IDEWorkspaceVO selectWSInfo(Map<String, String> params)
			throws Exception {
		return (IDEWorkspaceVO) client.queryForObject("ideworkspace.selectWSInfo",params);
	}

	@Override
	public List<IDEWorkspaceVO> isExistWS(Map<String, String> params)
			throws Exception {
		return client.queryForList("ideworkspace.isExistWS",params);
	}

}
