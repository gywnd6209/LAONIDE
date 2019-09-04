package kr.or.ddit.libraryfile.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.LibraryfileVO;

@Repository
public class LibraryFileDaoImpl implements ILibraryFileDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public LibraryfileVO fileItemInfo(Map<String, String> params)
			throws Exception {
		return (LibraryfileVO) this.client.queryForObject("libraryFileitem.fileItemInfo", params);
	}

	@Override
	public List<LibraryfileVO> fileItemList(Map<String, String> params)
			throws Exception {
		return null;
	}

	@Override
	public void insertFileItem(List<LibraryfileVO> fileItemList, String bo_no)
			throws Exception {
		
		for(LibraryfileVO fileItemInfo : fileItemList){
			fileItemInfo.setFile_bo_no(bo_no);
			client.insert("libraryFileitem.insertFileItem", fileItemInfo);
		}
	}

	@Override
	public void updateFileItem(LibraryfileVO fileItemInfo) throws Exception {
		
	}

	@Override
	public void deleteFileItem(Map<String, String> params) throws Exception {
		
	}
	

}
