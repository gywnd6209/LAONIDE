package kr.or.ddit.proInfo.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ProInfoVO;

public interface IProInfoService {
	public ProInfoVO proInfoInfo(Map<String, String> params) throws Exception;
	public String insertProInfo(ProInfoVO proInfo) throws Exception;
	public List<ProInfoVO> proInfoList() throws Exception;
	public List<ProInfoVO> proInfoMain(Map<String, String> params) throws Exception;
	public List<ProInfoVO> proInfoListDetail(Map<String, String> params) throws Exception;
	public void updateProInfo(ProInfoVO proInfo) throws Exception;
	public void deleteProInfo(ProInfoVO proInfo) throws Exception;
	
	public ProInfoVO forProlink(Map<String, String> params) throws Exception;
	public ProInfoVO byProlink(Map<String, String> params) throws Exception;
}