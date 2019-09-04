package kr.or.ddit.issueboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueboardVO;
import kr.or.ddit.vo.ScheduleVO;

@Repository
public class IIssueboardDaoImpl implements IIssueboardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public IssueboardVO issueboardInfo(Map<String, String> params) throws Exception {
		return (IssueboardVO) client.queryForObject("issueboard.issueboardInfo",params);
	}

	@Override
	public List<IssueboardVO> issueboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("issueboard.issueboardList", params);
	}
	
	@Override
	public String insertIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception {
		String isu_no="";
		try {
			client.startTransaction();
			isu_no = (String) client.insert("issueboard.insertIssueboard", issueboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return isu_no;
	}
	
	@Override
	public String insertSchedule(IssueboardVO issueboardInfo) throws Exception {
		String schedule_no="";
		try {
			client.startTransaction();
			schedule_no = (String) client.insert("issueboard.insertSchedule1", issueboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return schedule_no;
	}

	@Override
	public void updateIssueBoardInfo(IssueboardVO issueboardInfo) throws Exception {
		client.update("issueboard.updateIssueboard", issueboardInfo);
	}

	@Override
	public void deleteIssueBoardInfo(Map<String, String> params) throws Exception {
		client.update("issueboard.deleteIssueboard", params);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("issueboard.totalIssueboardCount", params);

	}
	@Override
	public void updateIssueBoardInfo_end(IssueboardVO issueboardInfo)
			throws Exception {
		client.update("issueboard.updateIssueboard_end", issueboardInfo);
	}

}
