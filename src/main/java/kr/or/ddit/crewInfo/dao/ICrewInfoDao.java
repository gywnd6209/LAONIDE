package kr.or.ddit.crewInfo.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewInfoVO;

public interface ICrewInfoDao {
	public String insertCrewInfo(CrewInfoVO crewInfo) throws SQLException;
	public List<CrewInfoVO> crewList(Map<String, String> params) throws Exception;
	
	public void upPL(CrewInfoVO crewInfo) throws Exception;
	public void nonePL(CrewInfoVO crewInfo) throws Exception;
	public void deleteCrew(CrewInfoVO crewInfo) throws Exception;
	public void deleteCrewAll(CrewInfoVO crewInfo) throws Exception;
	
	public List<CrewInfoVO> notInLoginID(Map<String, String> params) throws Exception;
	public List<CrewInfoVO> crewListByProLink(Map<String, String> params) throws Exception;
	public void inviteCrew(CrewInfoVO crewInfo) throws Exception; 
	public void crewUpdateGrade(CrewInfoVO crewInfo) throws Exception;
}