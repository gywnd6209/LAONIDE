package kr.or.ddit.schedule.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.schedule.dao.ScheduleDao;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ScheduleVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired //타입이 일치하는 bean이있으면 쟤가 인스턴스 하는 시점에 DI 해줌
	private ScheduleDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true) //기존에 있는거있음 쓰고 없으면 새로쓰겠다.
	@Override
	public ScheduleVO scheduleInfo(Map<String, String> params) throws Exception {

		return this.dao.scheduleInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ScheduleVO> scheduleList(Map<String,String> params) throws Exception {
		
		return this.dao.scheduleList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CrewInfoVO> crewList(Map<String, String> params) throws Exception {
		return this.dao.crewList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
//	public String insertSchedule(ScheduleVO scheduleInfo) throws Exception {
	public void insertSchedule(ScheduleVO scheduleInfo) throws Exception {
		this.dao.insertSchedule(scheduleInfo);
//		return this.dao.insertSchedule(scheduleInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateSchedule(ScheduleVO scheduleInfo) throws Exception {

		this.dao.updateSchedule(scheduleInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteSchedule(ScheduleVO scheduleInfo) throws Exception {

		this.dao.deleteSchedule(scheduleInfo);
	}

	@Override
	public void dropUpdate(ScheduleVO scheduleInfo) throws SQLException {
		this.dao.dropUpdate(scheduleInfo);
	}

}
