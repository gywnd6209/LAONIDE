package kr.or.ddit.codeAi.dao;

import java.util.Map;

import kr.or.ddit.vo.AICodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICodeAIDaoImpl implements ICodeAIDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public AICodeVO cobiInfo(Map<String, String> params) throws Exception {
		return (AICodeVO) client.queryForObject("cobi.cobiInfo",params);
	}
	
}
