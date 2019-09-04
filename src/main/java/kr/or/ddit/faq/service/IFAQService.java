package kr.or.ddit.faq.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FaqVO;

public interface IFAQService {

	public FaqVO faqboardInfo(Map<String, String> params) throws Exception;
	public List<FaqVO> faqboardList(Map<String, String> params) throws Exception;
	public void insertFaqInfo(FaqVO faqboardInfo) throws Exception;
	public void updateFaqInfo(FaqVO faqboardInfo) throws Exception;
	public void deleteFaqboardInfo(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	
	public void updateHit(Map<String, String> params) throws Exception;
}
