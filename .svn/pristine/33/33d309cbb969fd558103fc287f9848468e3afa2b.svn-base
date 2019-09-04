package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ScheduleVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public ScheduleVO scheduleInfo(Map<String, String> params) throws Exception {
		
		return (ScheduleVO) this.client.queryForObject("schedule.scheduleInfo",params);
	}

	@Override
	public List<ScheduleVO> scheduleList(Map<String,String> params) throws Exception {
			
		List<ScheduleVO> scheduleList = this.client.queryForList("schedule.scheduleList", params);

		return scheduleList;
	}
	
	//팀원 리스트
	@Override
	public List<CrewInfoVO> crewList(Map<String, String> params) throws Exception {
		
		return this.client.queryForList("schedule.crewList", params);
	}
	@Override
//	public String insertSchedule(ScheduleVO scheduleInfo) throws Exception {
	public void insertSchedule(ScheduleVO scheduleInfo) throws Exception {
		
//		String schedule_no = "";
//		
//		schedule_no = (String) client.insert("schedule.insertSchedule",scheduleInfo);

//		return schedule_no;
		client.insert("schedule.insertSchedule",scheduleInfo);
	}

	@Override
	public void updateSchedule(ScheduleVO scheduleInfo) throws Exception {

		client.update("schedule.updateSchedule",scheduleInfo);
	}

	@Override
	public void deleteSchedule(ScheduleVO scheduleInfo) throws Exception {

		client.update("schedule.deleteSchedule", scheduleInfo);
	}

	@Override
	public void dropUpdate(ScheduleVO scheduleInfo) throws SQLException {
		client.update("schedule.dropUpdate", scheduleInfo);
	}

}
