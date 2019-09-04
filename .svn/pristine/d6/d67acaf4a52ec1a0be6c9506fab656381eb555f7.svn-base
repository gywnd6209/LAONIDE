package kr.or.ddit.recruitboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.recruitboard.dao.IRecruitboardDao;
import kr.or.ddit.vo.RecruitBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IRecruitboardServiceImpl implements IRecruitboardService {
	@Autowired
	private IRecruitboardDao dao;
		
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public RecruitBoardVO recruitboardInfo (Map<String, String> params)
			throws Exception {
		return dao.recruitboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<RecruitBoardVO> recruitboardList(Map<String, String> params)
			throws Exception {
		return dao.recruitboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertRecruitboardInfo(RecruitBoardVO recruitboardInfo)
			throws Exception {
		String bo_no =null;
        try {
           
           bo_no = dao.insertRecruitboardInfo(recruitboardInfo);
      
        } catch (SQLException e) {
         e.printStackTrace();
      }
		return bo_no;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String insertRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)
			throws Exception {
		return dao.insertRecruitboardReplyInfo(recruitboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateRecruitboardInfo(RecruitBoardVO recruitboardInfo)
			throws Exception {
		dao.updateRecruitboardInfo(recruitboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void deleteRecruitboardInfo(Map<String, String> params)
			throws Exception {
		dao.deleteRecruitboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<RecruitBoardVO> recruitboardReplyList(Map<String, String> params)
			throws Exception {
		return dao.recruitboardReplyList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCountReply(Map<String, String> params) throws Exception {
		return this.dao.totalCountReply(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo)
			throws Exception {
		return dao.updateRecruitboardReplyInfo(recruitboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		dao.updateHit(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int pro_count(Map<String, String> params) throws Exception {
		return this.dao.pro_count(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String id_nick(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.id_nick(mem_id);
	}


}
