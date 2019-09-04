package kr.or.ddit.recruitboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import kr.or.ddit.vo.RecruitBoardVO;

public interface IRecruitboardDao {
	public RecruitBoardVO recruitboardInfo(Map<String, String> params) throws Exception;
	public List<RecruitBoardVO> recruitboardList(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	public String insertRecruitboardInfo(RecruitBoardVO recruitboardInfo) throws SQLException;
	public void updateRecruitboardInfo(RecruitBoardVO recruitboardInfo) throws SQLException;
	public void deleteRecruitboardInfo(Map<String, String> params) throws SQLException;
	public String insertRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)throws SQLException;
	public int updateRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)throws SQLException;
	public List<RecruitBoardVO> recruitboardReplyList(Map<String, String> params) throws Exception;
	public int totalCountReply(Map<String, String> params) throws Exception;
	public void updateHit(Map<String, String> params) throws Exception;
	public int pro_count(Map<String, String> params) throws Exception;
	public String id_nick(String mem_id) throws Exception;
}