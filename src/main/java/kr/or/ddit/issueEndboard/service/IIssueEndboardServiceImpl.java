package kr.or.ddit.issueEndboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.issueEndboard.dao.IIssueEndboardDao;
import kr.or.ddit.vo.IssueEndVO;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IIssueEndboardServiceImpl implements IIssueEndboardService {
	
	@Autowired
	private IIssueEndboardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public IssueEndVO issueEndboardInfo(Map<String, String> params) throws Exception {
		return dao.issueEndboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueEndVO> issueEndboardList(Map<String, String> params)
			throws Exception {
		return dao.issueEndboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertIssueEndBoardInfo(IssueEndVO issueEndboardInfo) throws Exception {
		
		String isu_end_no = null;
		isu_end_no = dao.insertIssueEndBoardInfo(issueEndboardInfo);
		return isu_end_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateIssueEndBoardInfo(IssueEndVO issueEndboardInfo) throws Exception {
		dao.updateIssueEndBoardInfo(issueEndboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteIssueEndBoardInfo(Map<String, String> params) throws Exception {
		dao.deleteIssueEndBoardInfo(params);
	}
}
