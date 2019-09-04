package kr.or.ddit.alramlog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.alramlog.dao.IAlramLogDao;
import kr.or.ddit.vo.AlramLogVO;
@Service
public class IAlramLogServiceImpl implements IAlramLogService {

	@Autowired
	private IAlramLogDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<AlramLogVO> alramNotOkList(Map<String, String> params)
			throws Exception {
		return dao.alramNotOkList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertAlramLog(Map<String, String> params) throws Exception {
		return dao.insertAlramLog(params); 
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteAlramLog(Map<String, String> params) throws Exception {
		dao.deleteAlramLog(params);
	}

}
