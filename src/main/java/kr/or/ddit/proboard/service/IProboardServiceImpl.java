package kr.or.ddit.proboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.proboard.dao.IProboardDao;
import kr.or.ddit.proboardfile.dao.IProboardFileDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.LibraryfileVO;
import kr.or.ddit.vo.ProBoardFileVO;
import kr.or.ddit.vo.ProBoardVO;
@Service
public class IProboardServiceImpl implements IProboardService {
	
	@Autowired
	private IProboardDao dao;
	
	@Autowired
	private IProboardFileDao fileitemDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProBoardVO proboardInfo(Map<String, String> params) throws Exception {
		return dao.proboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProBoardVO> proboardList(Map<String, String> params)
			throws Exception {
		return dao.proboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertProBoardInfo(ProBoardVO proboardInfo, MultipartFile[] items) throws Exception {
		
		String bo_no = null;
		List<ProBoardFileVO> fileItemList = AttachFileMapper.mappingProBoardFile(items, bo_no);
		bo_no = dao.insertProBoardInfo(proboardInfo, fileItemList);
		return bo_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateProBoardInfo(ProBoardVO proboardInfo) throws Exception {
		dao.updateProBoardInfo(proboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteProBoardInfo(Map<String, String> params) throws Exception {
		dao.deleteProBoardInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertProBoardReplyInfo(ProBoardVO proboardInfo)
			throws Exception {
		return dao.insertProBoardReplyInfo(proboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProBoardVO> proboardReplyList(Map<String, String> params)
			throws Exception {
		return dao.proboardReplyList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateProboardReply(ProBoardVO proboardInfo) throws Exception {
		dao.updateProboardReply(proboardInfo);
	}

}
