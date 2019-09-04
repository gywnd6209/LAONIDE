package kr.or.ddit.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FaqVO;

@Repository
public class FAQDaoImpl implements IFAQDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public FaqVO faqboardInfo(Map<String, String> params) throws Exception {
		return (FaqVO) this.client.queryForObject("faqboard.faqboardView", params);
	}

	@Override
	public List<FaqVO> faqboardList(Map<String, String> params)
			throws Exception {
		
		return this.client.queryForList("faqboard.faqboardAllList", params);
	}

	@Override
	public void insertFaqInfo(FaqVO faqboardInfo) throws Exception {
		this.client.insert("faqboard.insertFaqInfo",faqboardInfo);
	}

	@Override
	public void updateFaqInfo(FaqVO faqboardInfo) throws Exception {
		this.client.update("faqboard.updateFaqInfo", faqboardInfo);
	}

	@Override
	public void deleteFaqboardInfo(Map<String, String> params) throws Exception {
		this.client.update("faqboard.deleteFaqInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("faqboard.totalCount",params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.client.update("faqboard.updateHit", params);
	}

}
