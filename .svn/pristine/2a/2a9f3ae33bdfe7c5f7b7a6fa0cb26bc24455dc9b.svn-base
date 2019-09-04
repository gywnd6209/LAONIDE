package kr.or.ddit.alramboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AlramBoardVO;
@Repository
public class IAlramboardDaoImpl implements IAlramboardDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<AlramBoardVO> alramboardList(Map<String, String> params) throws Exception {
		return this.client.queryForList("alramboard.alramboardList", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("alramboard.totalAlramboardCount", params);
	}

	@Override
	public String insertAlramboardInfo(AlramBoardVO alramboardInfo)
			throws Exception {
		String alram_no = "";
		try {
			//실행될 때 마다 받아야 하는 것
//			alram_content = 들어가는 이슈, 결함, 게시판 제목
//					PRO_CODE
//					MEM_ID
//					BO_WRITER
//					alram_code : ISSUE, ERROR, BOARD
//					pri_code : 우선순위
			client.startTransaction();
			alram_no = (String) client.insert("alramboard.insertAlramboard", alramboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
		return alram_no;
	}

}
