package kr.or.ddit.issuetracker.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.issuetracker.dao.IssueMainDao;
import kr.or.ddit.proInfo.dao.IProInfoDao;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IssueMainServiceImpl implements IssueMainService {
	@Autowired
	private IssueMainDao dao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public ProInfoVO proInfo(Map<String, String> params) throws Exception {
		return dao.proInfo(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public String insertPro(ProInfoVO proInfo) throws Exception {
		String pro_code = null;
		try {

			pro_code = dao.insertPro(proInfo);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pro_code;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<ProInfoVO> proList() throws Exception {
		return dao.proList();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<ProInfoVO> proMain(Map<String, String> params)
			throws Exception {
		return this.dao.proMain(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public void updatePro(ProInfoVO proInfo) throws Exception {
		this.dao.updatePro(proInfo);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public void deletePro(ProInfoVO proInfo) throws Exception {
		this.dao.deletePro(proInfo);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<ProInfoVO> proListDetail(Map<String, String> params)
			throws Exception {
		return this.dao.proListDetail(params);
	}

}
