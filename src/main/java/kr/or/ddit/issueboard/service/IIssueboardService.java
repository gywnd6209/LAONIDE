package kr.or.ddit.issueboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.IssueboardVO;
import kr.or.ddit.vo.ScheduleVO;

public interface IIssueboardService {
	public IssueboardVO issueboardInfo(Map<String, String> params) throws Exception;
	public List<IssueboardVO> issueboardList(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params)  throws Exception;
	public String insertIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception;
	public void updateIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception;
	public void updateIssueBoardInfo_end(IssueboardVO issueboardInfo) throws Exception;
	public void deleteIssueBoardInfo(Map<String, String> params) throws Exception;
	
//	//schedule 등록용
	public String insertSchedule(IssueboardVO issueboardInfo) throws Exception;
}
