package kr.or.ddit.issueEndboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueEndVO;

@Repository
public class IIssueEndboardDaoImpl implements IIssueEndboardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public IssueEndVO issueEndboardInfo(Map<String, String> params) throws Exception {
		return (IssueEndVO) client.queryForObject("issueEndboard.issueEndboardInfo",params);
	}

	@Override
	public List<IssueEndVO> issueEndboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("issueEndboard.issueEndboardList", params);
	}
	
	@Override
	public String insertIssueEndBoardInfo(IssueEndVO issueEndboardInfo) throws Exception {
		String isu_end_no="";
		try {
			client.startTransaction();
			isu_end_no = (String) client.insert("issueEndboard.insertIssueEndboard", issueEndboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return isu_end_no;
	}

	@Override
	public void updateIssueEndBoardInfo(IssueEndVO issueEndboardInfo) throws Exception {
		client.update("issueEndboard.updateIssueEndboard", issueEndboardInfo);
	}

	@Override
	public void deleteIssueEndBoardInfo(Map<String, String> params) throws Exception {
		client.update("issueEndboard.deleteIssueEndboard", params);
		
	}
}
