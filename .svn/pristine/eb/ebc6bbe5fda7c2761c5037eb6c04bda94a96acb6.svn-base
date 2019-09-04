package kr.or.ddit.freeboardfile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.freeboardfile.dao.FreeboardFileDao;
import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

@Service
public class FreeboardFileServiceImpl implements FreeboardFileService {
	
	@Autowired
	private FreeboardFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FreeboardFileVO fileItemInfo(Map<String, String> params)
			throws Exception {
		return this.dao.fileItemInfo(params);
	}
	
	@Override
	public List<FreeboardFileVO> fileItemList(Map<String, String> params)
			throws Exception {
		return this.dao.fileItemList(params);
	}

	@Override
	public void insertFileItem(List<FreeboardFileVO> fileItemList, String bo_no)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFileItem(FreeboardFileVO fileItemInfo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFileItem(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
