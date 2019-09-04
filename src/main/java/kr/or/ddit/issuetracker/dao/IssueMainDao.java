package kr.or.ddit.issuetracker.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProInfoVO;

public interface IssueMainDao {
	public ProInfoVO proInfo(Map<String, String> params) throws Exception;
	public String insertPro(ProInfoVO proInfo) throws SQLException;
	public List<ProInfoVO> proList() throws Exception;
	public List<ProInfoVO> proMain(Map<String, String> params) throws Exception;
	public List<ProInfoVO> proListDetail(Map<String, String> params) throws Exception;
	public void updatePro(ProInfoVO proInfo) throws Exception;
	public void deletePro(ProInfoVO proInfo) throws Exception;
	
}