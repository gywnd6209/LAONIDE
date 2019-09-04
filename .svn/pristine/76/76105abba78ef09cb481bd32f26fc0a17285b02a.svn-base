package kr.or.ddit.grand.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.GrandVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IGrandmpl implements IGrandDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<GrandVO> grandList()throws Exception {
		// TODO Auto-generated method stub
		return this.client.queryForList("grand.grandList");
	}
	
}
