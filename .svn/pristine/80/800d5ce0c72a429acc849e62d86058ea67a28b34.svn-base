package kr.or.ddit.codeAi.service;

import java.util.Map;

import kr.or.ddit.codeAi.dao.ICodeAIDao;
import kr.or.ddit.vo.AICodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICodeAIServiceImpl implements ICodeAIService {

	@Autowired
	private ICodeAIDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public AICodeVO cobiInfo(Map<String, String> params) throws Exception {
		return dao.cobiInfo(params);
	}
}
