package kr.or.ddit.library.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.library.dao.ILibraryDao;
import kr.or.ddit.libraryfile.dao.ILibraryFileDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.LibraryboardVO;
import kr.or.ddit.vo.LibraryfileVO;

@Service
public class LibraryServiceImpl implements ILibraryService {

	@Autowired
	private ILibraryDao dao;
	@Autowired
	private ILibraryFileDao fileitemDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public LibraryboardVO libraryInfo(Map<String, String> params) throws Exception {
		return this.dao.libraryInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LibraryboardVO> libraryboardList(Map<String, String> params)
			throws Exception {
		return this.dao.libraryboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertLibraryInfo(LibraryboardVO libraryInfo, MultipartFile[] items) throws Exception {
		String bo_no = null;
		 List<LibraryfileVO> fileItemList = AttachFileMapper.mappingLibrary(items, bo_no);
		bo_no = this.dao.insertLibraryInfo(libraryInfo, fileItemList);
		return bo_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateLibraryInfo(LibraryboardVO libraryInfo) throws Exception {
		this.dao.updateLibraryInfo(libraryInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteLibraryInfo(Map<String, String> params) throws Exception {
		this.dao.deleteLibraryInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LibraryboardVO> libraryReplyList(Map<String, String> params)
			throws Exception {
		return this.dao.libraryReplyList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateLibraryReply(LibraryboardVO libraryInfo) throws Exception {
		this.dao.updateLibraryReply(libraryInfo);		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertLibraryReplyInfo(LibraryboardVO libraryInfo)
			throws Exception {
		return this.dao.insertLibraryReplyInfo(libraryInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.dao.updateHit(params);
	}

}
