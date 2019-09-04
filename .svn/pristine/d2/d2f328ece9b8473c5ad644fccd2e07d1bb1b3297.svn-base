package kr.or.ddit.alramlog.controller;

import java.util.List;
import java.util.Map;

import kr.or.ddit.alramlog.service.IAlramLogService;
import kr.or.ddit.aop.Loggable;
import kr.or.ddit.vo.AlramLogVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.classic.Logger;

@Controller
@RequestMapping("/user/alramlog/")
public class AlramLogController {

	@Loggable
	private Logger logger;
	@Autowired
	private IAlramLogService service;
	
	@RequestMapping("alramLogList")
	public ModelAndView alramLogList(
									 Map<String, String> params,
									 String mem_id, 
									 ModelAndView andView) throws Exception{
		params.put("mem_id", mem_id);
		List<AlramLogVO> alramLogList = service.alramNotOkList(params);
		
		andView.addObject("alramLogList", alramLogList);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteALOG")
	public ModelAndView deleteALOG(Map<String, String> params,
											String alog_no, 
											ModelAndView andView) 
													throws Exception{
		params.put("alog_no", alog_no);
		service.deleteAlramLog(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
}
