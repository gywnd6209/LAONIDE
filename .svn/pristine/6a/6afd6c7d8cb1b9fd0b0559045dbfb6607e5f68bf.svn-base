package kr.or.ddit.recruitboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecruitBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRecruitboardDaoImpl implements IRecruitboardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public RecruitBoardVO recruitboardInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return (RecruitBoardVO) this.client.queryForObject("recruitboard.recruitboardInfo", params);
	}

	@Override
	public List<RecruitBoardVO> recruitboardList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return this.client.queryForList("recruitboard.recruitboardList", params);
	}
	
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("recruitboard.totalCount", params);
	}

	@Override
	public String insertRecruitboardInfo(RecruitBoardVO recruitboardInfo)
			throws SQLException {
		String bo_no = "";
        try {
           client.startTransaction();

           bo_no = (String) client.insert("recruitboard.insertRecruitboard",recruitboardInfo);
           
           client.commitTransaction();
        } finally {
           client.endTransaction();
        }
        return bo_no;
	}

	@Override
	public void updateRecruitboardInfo(RecruitBoardVO recruitboardInfo)
			throws SQLException {
		client.update("recruitboard.updateRecruitboard",recruitboardInfo);
	}

	@Override
	public void deleteRecruitboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("recruitboard.deleteRecruitboardInfo", params);
	}

	@Override
	public String insertRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)
			throws SQLException {
		String bo_no = "";
		try{
			client.startTransaction();
			String bo_seq;
			if("0".intern() == recruitboardInfo.getBo_seq().intern()){
				bo_seq = (String) client.queryForObject("recruitboard.incrementSeq", recruitboardInfo);
			}else{
				client.update("recruitboard.updateSeq", recruitboardInfo);
				
				bo_seq = String.valueOf(Integer.parseInt(recruitboardInfo.getBo_seq())+1);
			}
			recruitboardInfo.setBo_seq(bo_seq);
			recruitboardInfo.setBo_depth(String.valueOf(Integer.parseInt(recruitboardInfo.getBo_depth())+1));
			
			bo_no = (String) client.insert("recruitboard.insertRecruitboardReply", recruitboardInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
		return bo_no;
	}

	@Override
	public List<RecruitBoardVO> recruitboardReplyList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("recruitboard.recruitboardReplyList", params);
	}

	@Override
	public int totalCountReply(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("recruitboard.totalCountReply", params);
	}

	@Override
	public int updateRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		return client.update("recruitboard.updateRecruitboardReply",recruitboardInfo);
	}

	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		client.update("recruitboard.updateHit", params);
	}

	@Override
	public int pro_count(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("recruitboard.pro_count", params);
	}

	@Override
	public String id_nick(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("recruitboard.id_nick", mem_id);
	}
}
