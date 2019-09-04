package kr.or.ddit.idefile.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.idefile.dao.IIdefileDao;
import kr.or.ddit.vo.IdeFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IIdefileServiceImpl implements IIdefileService {
	@Autowired
	private IIdefileDao dao;
		
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public IdeFileVO idefileInfo (Map<String, String> params)
			throws Exception {
		return dao.idefileInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertIdefileInfo(IdeFileVO idefileInfo)
			throws Exception {
		String file_no =null;
        try {
           
        	file_no = dao.insertIdefileInfo(idefileInfo);
      
        } catch (SQLException e) {
         e.printStackTrace();
      }
		return file_no;
	}

//	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
//	@Override
//	public void updateIdefileInfo(IdeFileVO idefileInfo)
//			throws Exception {
//		dao.updateIdefileInfo(idefileInfo);
//	}
//
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Override
//	public void deleteIdefileInfo(Map<String, String> params)
//			throws Exception {
//		dao.deleteIdefileInfo(params);
//	}

}
