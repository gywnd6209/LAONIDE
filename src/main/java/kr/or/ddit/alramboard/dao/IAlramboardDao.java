package kr.or.ddit.alramboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlramBoardVO;

public interface IAlramboardDao {
	public List<AlramBoardVO> alramboardList(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params)  throws Exception;
	public String insertAlramboardInfo(AlramBoardVO alramboardInfo) throws Exception;
}
