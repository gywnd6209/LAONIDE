package kr.or.ddit.errAi.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.errAi.dao.IErrAIDao;
import kr.or.ddit.vo.AIErrVO;
import kr.or.ddit.vo.ErrboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IErrAIServiceImpl implements IErrAIService {

	@Autowired
	private IErrAIDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<AIErrVO> findErrSol(Map<String, String> params)
			throws Exception {
		return this.dao.findErrSol(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insErr(ErrboardVO errInfo) throws Exception {
		return this.dao.insErr(errInfo);
	}

	
	
	
}
