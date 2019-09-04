package kr.or.ddit.alramlog.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AlramLogVO;
@Repository
public class IAlramLogDaoImpl implements IAlramLogDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<AlramLogVO> alramNotOkList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("alramlog.alramNotOkList", params);
	}

	@Override
	public String insertAlramLog(Map<String, String> params) throws Exception {
		String flag = "false";
		try {
			//실행될 때 마다 받아야 하는 것 mem_id, alram_no, pro_code 
			client.startTransaction();
			client.insert("alramlog.insertAlramLog", params);
			client.commitTransaction();
			flag = "true";
		} finally {
			client.endTransaction();
		}
		return flag;
	}

	@Override
	public void deleteAlramLog(Map<String, String> params) throws Exception {
		client.update("alramlog.deleteAlramLog", params);
	}

}
