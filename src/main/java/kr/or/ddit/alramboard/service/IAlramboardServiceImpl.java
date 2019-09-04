package kr.or.ddit.alramboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.alramboard.dao.IAlramboardDao;
import kr.or.ddit.alramlog.dao.IAlramLogDao;
import kr.or.ddit.vo.AlramBoardVO;
import kr.or.ddit.vo.AlramLogVO;
@Service
public class IAlramboardServiceImpl implements IAlramboardService {
	
	@Autowired
	private IAlramboardDao dao;
	@Autowired
	private IAlramLogDao logDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<AlramBoardVO> alramboardList(Map<String, String> params)
			throws Exception {
		return dao.alramboardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params); 
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertAlramboardInfo(AlramBoardVO alramboardInfo)
			throws Exception {
		String alram_no = "";
		alram_no = dao.insertAlramboardInfo(alramboardInfo); 
		
		// mem_id, alram_no, pro_code
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", alramboardInfo.getMem_id());
		params.put("alram_no", alram_no);
		params.put("pro_code", alramboardInfo.getPro_code());
		logDao.insertAlramLog(params);
		return alram_no;
	}

}
