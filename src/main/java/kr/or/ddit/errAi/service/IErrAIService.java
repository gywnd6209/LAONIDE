package kr.or.ddit.errAi.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AIErrVO;
import kr.or.ddit.vo.ErrboardVO;

public interface IErrAIService {
	
	public List<AIErrVO> findErrSol(Map<String, String> params) throws Exception;
	public String insErr(ErrboardVO errInfo) throws Exception;
}
