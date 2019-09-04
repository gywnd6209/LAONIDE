package kr.or.ddit.errAi.controller;

import java.util.List;
import java.util.Map;


import kr.or.ddit.aop.Loggable;
import kr.or.ddit.errAi.service.IErrAIService;
import kr.or.ddit.vo.AIErrVO;
import kr.or.ddit.vo.ErrboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import ch.qos.logback.classic.Logger;

@Controller
@RequestMapping("/laonide/")
public class ErrAIController {

	@Loggable
	private Logger logger;
	
	@Autowired
	private IErrAIService ai_service;
	 
	//findErrSol --> 팝업으로 에러 해결방법 출력
	@RequestMapping("findErrSol")
	public ModelAndView findErrSol(ModelAndView andView,
								   String err_name,
								   Map<String, String> param) throws Exception{
		
		param.put("err_name", err_name);
		List<AIErrVO> list = this.ai_service.findErrSol(param);
		
		andView.addObject("errName", list.get(0).getErr_name());
		andView.addObject("errSol", list.get(0).getErr_sol());
		
		System.out.println(list.get(0).getErr_name());
		System.out.println(list.get(0).getErr_sol());
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	//결함 자동저장  
	@RequestMapping("insErr")
	public ModelAndView insErr(ErrboardVO errInfo,
							   String mem_id,
							   String mem_nick,
							   String err_title,
							   String err_cont,
							   String err_writer,
							   String pro_code,
						 	   ModelAndView andView) throws Exception{

		String[] ar_err_title = err_title.split(",");
		
		andView.addObject("mem_id", mem_id);
		andView.addObject("err_title", err_title);
		andView.addObject("err_cont", err_title);
		andView.addObject("err_writer", mem_nick);
		andView.addObject("pro_code", pro_code);
		
		for(int i = 0; i < ar_err_title.length; i++){
			
			errInfo.setErr_title(ar_err_title[i]);
			this.ai_service.insErr(errInfo);
		}
		
		andView.addObject("result", "결함이 저장되었습니다!");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
}

