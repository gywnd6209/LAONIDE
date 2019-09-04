package kr.or.ddit.grand.service;

import java.util.List;

import kr.or.ddit.grand.dao.IGrandDao;
import kr.or.ddit.vo.GrandVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IGrandServiceImpl implements IGrandService {
	@Autowired
	private IGrandDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<GrandVO> grandList()throws Exception {
		return dao.grandList();
	}
	
}
