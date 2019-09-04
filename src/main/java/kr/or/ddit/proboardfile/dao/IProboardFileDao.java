package kr.or.ddit.proboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProBoardFileVO;

public interface IProboardFileDao {
	public ProBoardFileVO proFileItemInfo(Map<String, String> params) throws Exception;
	public List<ProBoardFileVO> proFileItemList(Map<String, String> params) throws Exception;
	public void insertProFileItem(List<ProBoardFileVO> fileItemList, String bo_no) throws Exception;
	public void updateProFileItem(ProBoardFileVO fileItemInfo) throws Exception;
	public void deleteProFileItem(Map<String, String> params) throws Exception;
}
