package kr.or.ddit.ideworkspace.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ideworkspace.dao.IIdeworkspaceDao;
import kr.or.ddit.vo.IDEWorkspaceVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Service
public class IIdeworkspaceServiceImpl implements IIdeworkspaceService {

	@Autowired
	private IIdeworkspaceDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void createWS(IDEWorkspaceVO idewsInfo) throws Exception {
		dao.createWS(idewsInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public IDEWorkspaceVO selectWSInfo(Map<String, String> params) throws Exception {
		return dao.selectWSInfo(params);
	}

	@Override
	public List<IDEWorkspaceVO> isExistWS(Map<String, String> params)
			throws Exception {
		return (List<IDEWorkspaceVO>) dao.isExistWS(params);
	}
}
