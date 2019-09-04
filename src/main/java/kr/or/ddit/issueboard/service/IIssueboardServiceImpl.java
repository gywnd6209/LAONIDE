package kr.or.ddit.issueboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.issueboard.dao.IIssueboardDao;
import kr.or.ddit.proboard.dao.IProboardDao;
import kr.or.ddit.vo.IssueboardVO;
import kr.or.ddit.vo.ScheduleVO;
@Service
public class IIssueboardServiceImpl implements IIssueboardService {
	
	@Autowired
	private IIssueboardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public IssueboardVO issueboardInfo(Map<String, String> params) throws Exception {
		return dao.issueboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueboardVO> issueboardList(Map<String, String> params)
			throws Exception {
		return dao.issueboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception {
		
		String isu_no = null;
		isu_no = dao.insertIssueBoardInfo(issueboardInfo);
		return isu_no;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception {
		dao.updateIssueBoardInfo(issueboardInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteIssueBoardInfo(Map<String, String> params) throws Exception {
		dao.deleteIssueBoardInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateIssueBoardInfo_end(IssueboardVO issueboardInfo)
			throws Exception {
		dao.updateIssueBoardInfo_end(issueboardInfo);
	}
	
//	//스케쥴
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertSchedule(IssueboardVO issueboardInfo) throws Exception {
		String schedule_no = null;
		schedule_no = dao.insertSchedule(issueboardInfo);
		return schedule_no;
	}

}
