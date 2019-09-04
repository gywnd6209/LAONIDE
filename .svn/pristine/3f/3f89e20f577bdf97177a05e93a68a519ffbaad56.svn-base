package kr.or.ddit.library.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.libraryfile.dao.ILibraryFileDao;
import kr.or.ddit.vo.LibraryboardVO;
import kr.or.ddit.vo.LibraryfileVO;

@Repository
public class LibraryDaoImpl implements ILibraryDao {

	@Autowired
	private SqlMapClient client;
	@Autowired
	private ILibraryFileDao fileitemdao;
	
	@Override
	public LibraryboardVO libraryInfo(Map<String, String> params) throws Exception {
		
		return (LibraryboardVO) this.client.queryForObject("libraryboard.libraryView", params);
	}

	@Override
	public List<LibraryboardVO> libraryboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("libraryboard.libraryList", params);
	}

	@Override
	public String insertLibraryInfo(LibraryboardVO libraryInfo,
								    List<LibraryfileVO> fileItemList) throws Exception {
		String bo_no = null;
		
		 try{
	         client.startTransaction();
	         
	         bo_no = (String) client.insert("libraryboard.insertLibraryInfo", libraryInfo);
	         
	         fileitemdao.insertFileItem(fileItemList, bo_no);
	         
	         client.commitTransaction();
	         
	      }finally {
	    	  
	         client.endTransaction();
	      }
		return bo_no;
	}

	@Override
	public void updateLibraryInfo(LibraryboardVO libraryInfo) throws Exception {
		this.client.update("libraryboard.updateLibraryInfo",libraryInfo);
	}

	@Override
	public void deleteLibraryInfo(Map<String, String> params) throws Exception {
		this.client.update("libraryboard.deleteLibraryInfo",params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("libraryboard.totalCount",params);
	}

	@Override
	public List<LibraryboardVO> libraryReplyList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("libraryboard.libraryReplyList", params);
	}

	@Override
	public void updateLibraryReply(LibraryboardVO libraryInfo) throws Exception {
		client.update("libraryboard.updateLibraryReply", libraryInfo);
	}

	@Override
	public String insertLibraryReplyInfo(LibraryboardVO libraryInfo) throws Exception {
		
		String bo_no = "";
		try {
			client.startTransaction();
			
			String bo_seq;
			bo_seq = (String) client.queryForObject("libraryboard.incrementSeq", libraryInfo);
			
			libraryInfo.setBo_seq(bo_seq);
			
			bo_no = (String) client.insert("libraryboard.insertLibraryReply", libraryInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return bo_no;
	}

	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.client.update("libraryboard.updateHit", params);
	}
}
