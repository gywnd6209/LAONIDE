package kr.or.ddit.errboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.errboard.dao.IErrboardDao;
import kr.or.ddit.issueboard.dao.IIssueboardDao;
import kr.or.ddit.proboard.dao.IProboardDao;
import kr.or.ddit.vo.ErrboardVO;
@Service
public class IErrboardServiceImpl implements IErrboardService {
	
	@Autowired
	private IErrboardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ErrboardVO errboardInfo(Map<String, String> params) throws Exception {
		return dao.errboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ErrboardVO> errboardList(Map<String, String> params)
			throws Exception {
		return dao.errboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertErrBoardInfo(ErrboardVO errboardInfo) throws Exception {
		
		String err_no = null;
		err_no = dao.insertErrBoardInfo(errboardInfo);
		return err_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateErrBoardInfo(ErrboardVO errboardInfo) throws Exception {
		dao.updateErrBoardInfo(errboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteErrBoardInfo(Map<String, String> params) throws Exception {
		dao.deleteErrBoardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateErrBoardInfo_end(ErrboardVO errboardInfo)
			throws Exception {
		dao.updateErrBoardInfo_end(errboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertSchedule(ErrboardVO errboardInfo) throws Exception {
		String err_no = null;
		err_no = dao.insertSchedule(errboardInfo);
		return err_no;
	}

}
