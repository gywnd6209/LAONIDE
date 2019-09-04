package kr.or.ddit.grand.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.GrandVO;

public interface IGrandDao {
	public List<GrandVO> grandList() throws Exception;
}