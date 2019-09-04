package kr.or.ddit.alramboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.alramboard.service.IAlramboardService;
import kr.or.ddit.aop.Loggable;
import kr.or.ddit.utiles.AlramRolePagingUtiles;
import kr.or.ddit.vo.AlramBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.classic.Logger;

//http://localhost/user/issuetracker/alramboard/alramboardList.do
@Controller
@RequestMapping("/user/issuetracker/alramboard/")
public class AlramboardController {
	
	@Loggable
	private Logger logger;
	@Autowired
	private IAlramboardService service;
	
	@RequestMapping("alramboardList")
	public Model alramboardList(Model model, 
								Map<String, String> params,
								HttpServletRequest request) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		String pro_code = request.getParameter("pro_code");
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		String pro_name = request.getParameter("pro_name");
		
		params.put("pro_code", pro_code);

		int totalCount = this.service.totalCount(params);
		AlramRolePagingUtiles pagingUtiles = new AlramRolePagingUtiles(Integer.parseInt(currentPage)
																,totalCount
																,request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<AlramBoardVO> alramboardList = this.service.alramboardList(params);
		model.addAttribute("alramboardList", alramboardList);
		
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pro_name", pro_name);
		
		return model;
	}
}
