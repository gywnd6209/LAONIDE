package kr.or.ddit.libraryfile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.libraryfile.dao.ILibraryFileDao;
import kr.or.ddit.vo.LibraryfileVO;

@Service
public class LibraryFileServiceImpl implements ILibraryFileService {

	@Autowired
	private ILibraryFileDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public LibraryfileVO fileItemInfo(Map<String, String> params)
			throws Exception {
		return this.dao.fileItemInfo(params);
	}

	@Override
	public List<LibraryfileVO> fileItemList(Map<String, String> params)
			throws Exception {
		return this.dao.fileItemList(params);
	}

	@Override
	public void insertFileItem(List<LibraryfileVO> fileItemList, String bo_no)
			throws Exception {
	}

	@Override
	public void updateFileItem(LibraryfileVO fileItemInfo) throws Exception {
		
	}

	@Override
	public void deleteFileItem(Map<String, String> params) throws Exception {
		
	}
	

}
