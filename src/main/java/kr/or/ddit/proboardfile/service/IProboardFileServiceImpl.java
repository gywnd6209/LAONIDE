package kr.or.ddit.proboardfile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.proboardfile.dao.IProboardFileDao;
import kr.or.ddit.vo.ProBoardFileVO;
@Service
public class IProboardFileServiceImpl implements IProboardFileService{
	
	@Autowired
	private IProboardFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProBoardFileVO proFileItemInfo(Map<String, String> params)
			throws Exception {
		return this.dao.proFileItemInfo(params);
	}

	@Override
	public List<ProBoardFileVO> proFileItemList(Map<String, String> params)
			throws Exception {
		return this.dao.proFileItemList(params);
	}

	@Override
	public void insertProFileItem(List<ProBoardFileVO> fileItemList,
			String bo_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProFileItem(ProBoardFileVO fileItemInfo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProFileItem(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
