package kr.or.ddit.schedule.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ScheduleVO;

public interface ScheduleService {
	
	public ScheduleVO scheduleInfo(Map<String, String> params) throws Exception;
	
	public List<ScheduleVO> scheduleList(Map<String,String> params) throws Exception;
	
//	public String insertSchedule(ScheduleVO scheduleInfo) throws Exception;
	public void insertSchedule(ScheduleVO scheduleInfo) throws Exception;
	
	public void updateSchedule(ScheduleVO scheduleInfo) throws Exception;
	
	public void deleteSchedule(ScheduleVO scheduleInfo) throws Exception;

	public void dropUpdate(ScheduleVO scheduleInfo) throws SQLException;
	
	//팀원 리스트
	public List<CrewInfoVO> crewList(Map<String, String> params) throws Exception;
	
}
