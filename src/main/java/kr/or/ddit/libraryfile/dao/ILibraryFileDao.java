package kr.or.ddit.libraryfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryfileVO;


public interface ILibraryFileDao {

	public LibraryfileVO fileItemInfo(Map<String, String> params) throws Exception;
	public List<LibraryfileVO> fileItemList(Map<String, String> params) throws Exception;
	public void insertFileItem(List<LibraryfileVO> fileItemList, String bo_no) throws Exception;
	public void updateFileItem(LibraryfileVO fileItemInfo) throws Exception;
	public void deleteFileItem(Map<String, String> params) throws Exception;
}
