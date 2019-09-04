package kr.or.ddit.qaboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.qaboard.dao.IQaboardDao;
import kr.or.ddit.vo.QaboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IQaboardServiceImpl implements IQaboardService {
	
	@Autowired
	private IQaboardDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public QaboardVO qaboardInfo(Map<String, String> params)
			throws Exception {
		return this.dao.qaboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<QaboardVO> qaboardList(Map<String, String> params)
			throws Exception {
		return this.dao.qaboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={NullPointerException.class, Exception.class})
	@Override
	public String insertQaboardInfo(QaboardVO qaboardInfo) throws Exception {
		return this.dao.insertQaboardInfo(qaboardInfo);
	}
//	public String insertFreeboardInfo(QaboardVO freeboardInfo,
//			MultipartFile[] items) throws Exception {
//		return this.dao.insertQaboardInfo(freeboardInfo, null);
//	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={NullPointerException.class, Exception.class})
	@Override
	public void updateQaboardInfo(QaboardVO qaboardInfo) throws Exception {
		this.dao.updateQaboardInfo(qaboardInfo);

	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={NullPointerException.class, Exception.class})
	@Override
	public void deleteQaboardInfo(Map<String, String> params)
			throws Exception {
		this.dao.deleteQaboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={NullPointerException.class, Exception.class})
	@Override
	public String insertQaboardReplyInfo(QaboardVO qaboardInfo)
			throws Exception {
		
		return this.dao.insertQaboardReplyInfo(qaboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public QaboardVO qaboardReplyInfo(Map<String, String> params)
			throws Exception {
		return this.dao.qaboardReplyInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={NullPointerException.class, Exception.class})
	@Override
	public void deleteQaboardReply(Map<String, String> params) throws Exception {
		this.dao.deleteQaboardReply(params);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.dao.updateHit(params);
	}

}
