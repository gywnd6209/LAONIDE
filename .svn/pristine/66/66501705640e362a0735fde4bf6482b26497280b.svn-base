package kr.or.ddit.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.faq.dao.IFAQDao;
import kr.or.ddit.vo.FaqVO;

@Service
public class FAQServiceImpl implements IFAQService {

	@Autowired
	private IFAQDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FaqVO faqboardInfo(Map<String, String> params) throws Exception {
		return this.dao.faqboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<FaqVO> faqboardList(Map<String, String> params)	throws Exception {
		return this.dao.faqboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertFaqInfo(FaqVO faqboardInfo) throws Exception {
		this.dao.insertFaqInfo(faqboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateFaqInfo(FaqVO faqboardInfo) throws Exception {
		this.dao.updateFaqInfo(faqboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteFaqboardInfo(Map<String, String> params) throws Exception {
		this.dao.deleteFaqboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return this.dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.dao.updateHit(params);
	}

}
