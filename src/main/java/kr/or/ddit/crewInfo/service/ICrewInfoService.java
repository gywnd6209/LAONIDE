package kr.or.ddit.crewInfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

public interface ICrewInfoService {
	public String insertCrewInfo(CrewInfoVO crewInfo) throws Exception;
	public List<CrewInfoVO> crewList(Map<String, String> params) throws Exception;
	
	public void upPL(CrewInfoVO crewInfo) throws Exception;
	public void nonePL(CrewInfoVO crewInfo) throws Exception;
	public void deleteCrew(CrewInfoVO crewInfo) throws Exception;
	public void deleteCrewAll(CrewInfoVO crewInfo) throws Exception;
	// 은혜
	public List<CrewInfoVO> notInLoginID(Map<String, String> params) throws Exception;
	public List<CrewInfoVO> crewListByProLink(Map<String, String> params) throws Exception;

	public void inviteCrew(CrewInfoVO crewInfo) throws Exception;
	public void crewUpdateGrade(CrewInfoVO crewInfo) throws Exception;
}