package kr.or.ddit.ideworkspace.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IDEWorkspaceVO;

public interface IIdeworkspaceService {
	public void createWS(IDEWorkspaceVO idewsInfo) throws Exception;
	public IDEWorkspaceVO selectWSInfo(Map<String, String> params) throws Exception;
	public List<IDEWorkspaceVO> isExistWS(Map<String, String> params) throws Exception;
	
}
