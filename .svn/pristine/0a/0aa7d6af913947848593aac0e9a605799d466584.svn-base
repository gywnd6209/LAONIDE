package kr.or.ddit.freeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.freeboard.dao.FreeboardDao;
import kr.or.ddit.freeboardfile.dao.FreeboardFileDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

@Service
public class FreeboardServiceImpl implements FreeboardService {
	
	@Autowired
	private FreeboardDao dao;
	
	@Autowired
	private FreeboardFileDao fileDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
		return this.dao.freeboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params)
			throws Exception {
		return this.dao.freeboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFreeboard(FreeboardVO freeboardInfo,
			MultipartFile[] items) throws Exception {
		String bo_no = null;
		List<FreeboardFileVO> fileItemList = AttachFileMapper.mappingFreeboard(items, bo_no);
		
		bo_no = this.dao.insertFreeboard(freeboardInfo, fileItemList);
		
		return bo_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFreeboardReply(FreeboardVO freeboardInfo)
			throws Exception {
		return this.dao.insertFreeboardReply(freeboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateFreeboard(FreeboardVO freeboardInfo) throws Exception {
		this.dao.updateFreeboard(freeboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteFreeboard(Map<String, String> params)
			throws Exception {
		this.dao.deleteFreeboard(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<FreeboardVO> freeboardReplyList(Map<String, String> params) throws Exception {
		return this.dao.freeboardReplyList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void updateFreeboardReply(FreeboardVO freeboardInfo) throws Exception {
		this.dao.updateFreeboardReply(freeboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.dao.updateHit(params);
		
	}
	
}
