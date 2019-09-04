package kr.or.ddit.proInfo.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.proInfo.dao.IProInfoDao;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IProInfoServiceImpl implements IProInfoService {
	@Autowired
	private IProInfoDao dao;
		
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProInfoVO proInfoInfo (Map<String, String> params)
			throws Exception {
		return dao.proInfoInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertProInfo(ProInfoVO proInfo)
			throws Exception {
		String pro_code =null;
        try {
           
        	pro_code = dao.insertProInfo(proInfo);
      
        } catch (SQLException e) {
         e.printStackTrace();
      }
		return pro_code;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProInfoVO> proInfoList()throws Exception {
		return dao.proInfoList();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProInfoVO> proInfoMain(Map<String, String> params) throws Exception {
		return this.dao.proInfoMain(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateProInfo(ProInfoVO proInfo) throws Exception {
		this.dao.updateProInfo(proInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteProInfo(ProInfoVO proInfo) throws Exception {
		this.dao.deleteProInfo(proInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProInfoVO> proInfoListDetail(Map<String, String> params)
			throws Exception {
		return this.dao.proInfoListDetail(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProInfoVO forProlink(Map<String, String> params) throws Exception {
		return this.dao.forProlink(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProInfoVO byProlink(Map<String, String> params) throws Exception {
		return this.dao.byProlink(params);
	}
	
}
