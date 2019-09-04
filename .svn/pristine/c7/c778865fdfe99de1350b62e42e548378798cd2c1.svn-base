package kr.or.ddit.library.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryboardVO;
import kr.or.ddit.vo.LibraryfileVO;


public interface ILibraryDao {

	public LibraryboardVO libraryInfo(Map<String, String> params) throws Exception;
	public List<LibraryboardVO> libraryboardList(Map<String, String> params) throws Exception;
	public String insertLibraryInfo(LibraryboardVO libraryInfo,
			  						List<LibraryfileVO> fileItemList) throws Exception;
	public void updateLibraryInfo(LibraryboardVO libraryInfo) throws Exception;
	public void deleteLibraryInfo(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	
	public String insertLibraryReplyInfo(LibraryboardVO libraryInfo) throws Exception;
	public List<LibraryboardVO> libraryReplyList(Map<String, String> params) throws Exception;
	public void updateLibraryReply(LibraryboardVO libraryInfo) throws Exception;
	
	public void updateHit(Map<String, String> params) throws Exception;
}
