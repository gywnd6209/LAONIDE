package kr.or.ddit.solboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.issueEndboard.dao.IIssueEndboardDao;
import kr.or.ddit.solboard.dao.ISolboardDao;
import kr.or.ddit.vo.SolboardVO;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ISolboardServiceImpl implements ISolboardService {
	
	@Autowired
	private ISolboardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public SolboardVO solboardInfo(Map<String, String> params) throws Exception {
		return dao.solboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SolboardVO> solboardList(Map<String, String> params)
			throws Exception {
		return dao.solboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertSolBoardInfo(SolboardVO solboardInfo) throws Exception {
		
		String sol_no = null;
		sol_no = dao.insertSolBoardInfo(solboardInfo);
		return sol_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateSolBoardInfo(SolboardVO solboardInfo) throws Exception {
		dao.updateSolBoardInfo(solboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteSolBoardInfo(Map<String, String> params) throws Exception {
		dao.deleteSolBoardInfo(params);
	}
}
