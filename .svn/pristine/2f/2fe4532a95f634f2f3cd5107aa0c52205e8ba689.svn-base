package kr.or.ddit.proboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProBoardFileVO;
import kr.or.ddit.vo.ProBoardVO;

public interface IProboardDao {
	public ProBoardVO proboardInfo(Map<String, String> params) throws Exception;
	public List<ProBoardVO> proboardList(Map<String, String> params) throws Exception;
	public String insertProBoardInfo(ProBoardVO proboardInfo, List<ProBoardFileVO> fileItemList) throws Exception;
	public void updateProBoardInfo(ProBoardVO proboardInfo) throws Exception;
	public void deleteProBoardInfo(Map<String, String> params) throws Exception;
	public String insertProBoardReplyInfo(ProBoardVO proboardInfo) throws Exception;
	public int totalCount(Map<String, String> params)  throws Exception;
	
	public List<ProBoardVO> proboardReplyList(Map<String, String> params) throws Exception;
	public void updateProboardReply(ProBoardVO proboardInfo) throws Exception;
}
