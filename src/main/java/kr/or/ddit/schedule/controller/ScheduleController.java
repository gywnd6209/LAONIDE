package kr.or.ddit.schedule.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.schedule.service.ScheduleService;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.ScheduleDataVO;
import kr.or.ddit.vo.ScheduleVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

// https://niees.tistory.com/66 참조

@Controller
@RequestMapping("/user/issuetracker/")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleService service;
	
	@Autowired
	private IProInfoService proService;
	
	@Autowired
	private ICrewInfoService crewService;
	
	@RequestMapping("schedule/schedule")
	public Model schedule(Model model, String pro_code,
						Map<String, String> params) throws Exception{
		
		params.put("pro_code", pro_code);
		
		List<CrewInfoVO> crewList = this.service.crewList(params);
		model.addAttribute("crewList", crewList);
		
		return model;
	}
	
	@RequestMapping(value="schedule/scheduleList", produces="application/json; charset=utf8")
	@ResponseBody
	public String schduleList(String pro_code , Map<String, String> params,
								HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("username", memberInfo.getMem_id());
		params.put("pro_code", pro_code);
		
		List<ScheduleVO> scheduleList = service.scheduleList(params);
		List<ScheduleDataVO> scheduleDataList = new ArrayList<ScheduleDataVO>();
		
		
		for (int i = 0; i < scheduleList.size(); i++) {
			String title = scheduleList.get(i).getTitle();
			String username = scheduleList.get(i).getUsername();
			String start = scheduleList.get(i).getStartdate();
			String end = scheduleList.get(i).getEnddate();
			String description = scheduleList.get(i).getDescription();
			String pro_code1 = scheduleList.get(i).getPro_code();
			String backgroundcolor = scheduleList.get(i).getBackgroundcolor();
			String allday = scheduleList.get(i).getAllday();
			String textcolor = scheduleList.get(i).getTextcolor();
			String type = scheduleList.get(i).getType();
			String _id = scheduleList.get(i).getSchedule_no();
			
			ScheduleDataVO scheduleDataInfo = new ScheduleDataVO();
			
			scheduleDataInfo.set_id(Integer.parseInt(_id));
			scheduleDataInfo.setTitle(title);
			scheduleDataInfo.setUsername(username);
			scheduleDataInfo.setStart(start);
			scheduleDataInfo.setEnd(end);
			scheduleDataInfo.setDescription(description);
			scheduleDataInfo.setPro_code(pro_code1);
			scheduleDataInfo.setBackgroundColor(backgroundcolor);
			scheduleDataInfo.setTextColor(textcolor);
			scheduleDataInfo.setType(type);
			if (allday.equals("false")) {
				scheduleDataInfo.setAllDay(false);
			}else {
				scheduleDataInfo.setAllDay(true);
			}
			
			scheduleDataList.add(scheduleDataInfo);
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		String json = objectMapper.writeValueAsString(scheduleDataList);
		
		System.out.println(scheduleDataList);
		System.out.println("여기까지 옴???");
		System.out.println(json);
		return json;
	}
	
	@RequestMapping(value="schedule/insertSchedule", produces="application/json; charset=utf8")
	@ResponseBody
	public String insertSchedule(String title, String start, String end, String description, 
								String backgroundColor, String textColor, boolean allDay,
								String type, String pro_code, String pro_name, 
								HttpServletRequest request) throws Exception{
		ScheduleVO scheduleInfo = new ScheduleVO();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		System.out.println("이슈트래커 일정 등록 테스트");
		scheduleInfo.setUsername(memberInfo.getMem_id());
		scheduleInfo.setTitle(title);
		scheduleInfo.setStartdate(start);
		scheduleInfo.setEnddate(end);
		scheduleInfo.setDescription(description);
		scheduleInfo.setType(type);
		scheduleInfo.setTextcolor(textColor);
		scheduleInfo.setBackgroundcolor(backgroundColor);
		scheduleInfo.setPro_code(pro_code);
		scheduleInfo.setPro_name(pro_name);
		if (allDay) {
			scheduleInfo.setAllday("true");
		}else {
			scheduleInfo.setAllday("false");
		}
		service.insertSchedule(scheduleInfo);
		
		System.out.println("scheduleInfo --->" + scheduleInfo);
		System.out.println("end ---> " + end);
		
		return "success";
	}
	
	@RequestMapping(value="schedule/updateSchedule", produces="application/json; charset=utf8")
	@ResponseBody
	public String updateSchedule(String title, String _id, String start, String end, String description, 
								String backgroundColor, String textColor, boolean allDay,
								String type) throws Exception{
		ScheduleVO scheduleInfo = new ScheduleVO();
		
		scheduleInfo.setTitle(title);
		scheduleInfo.setSchedule_no(_id);
		scheduleInfo.setStartdate(start);
		scheduleInfo.setEnddate(end);
		scheduleInfo.setDescription(description);
		scheduleInfo.setBackgroundcolor(backgroundColor);
		scheduleInfo.setTextcolor(textColor);
		scheduleInfo.setType(type);
		if (allDay) {
			scheduleInfo.setAllday("true");
		}else {
			scheduleInfo.setAllday("false");
		}
		service.updateSchedule(scheduleInfo);
		
		return "success";
	}
	
	@RequestMapping(value="schedule/deleteSchedule", produces="application/json; charset=utf8")
	@ResponseBody
	public String deleteSchedule(String _id) throws Exception{
		ScheduleVO scheduleInfo = new ScheduleVO();
		scheduleInfo.setSchedule_no(_id);
		service.deleteSchedule(scheduleInfo);
		
		return "success";
	}
	
	@RequestMapping(value="schedule/dropUpdate", produces="application/json; charset=utf8")
	@ResponseBody
	public String dropUpdateSchedule(String _id, String start, String end) throws SQLException{
		ScheduleVO scheduleInfo = new ScheduleVO();
		
		scheduleInfo.setSchedule_no(_id);
		scheduleInfo.setStartdate(start);
		scheduleInfo.setEnddate(end);
		
		service.dropUpdate(scheduleInfo);
		
		return "success";
	}

}
