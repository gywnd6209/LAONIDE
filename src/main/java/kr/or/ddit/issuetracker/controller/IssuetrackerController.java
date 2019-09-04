package kr.or.ddit.issuetracker.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.issuetracker.service.IssueMainService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProInfoVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
// 컨트롤러가 붙어있으면 mvc-*에서 자동으로 빈등록을 해준당
// http://localhost/user/issuetracker/issueMain.do
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/issuetracker/")
public class IssuetrackerController {
	
	@Loggable
	private Logger logger;
	@Autowired
	private IssueMainService service;
	
	@Autowired
	private ICrewInfoService crewService;
	
	/**
	 *	프로젝트 메인 
	 */
	@RequestMapping("issueMain")
	public Model issueMainList(Model model, 
								String mem_id, 
								HttpSession session, 
								String pro_code, 
								String pro_name,
								Map<String, String> params) throws Exception{
		this.logger.debug("issueMainController의 pro_main 콜백");
		this.logger.debug("{}의 {} 콜백", "issueMainController", "프로젝트 메인");
		
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		mem_id = member.getMem_id();
		
		params.put("mem_id", mem_id);
		params.put("pro_code", pro_code);
		
		System.out.println("들어간거 확인 : " + mem_id);
		System.out.println("들어간거 확인 : " + pro_code);
		
		List<ProInfoVO> issueMain = this.service.proMain(params);
		model.addAttribute("issueMain", issueMain);
		
		return model;
	}
	
	/**
	 *	프로젝트 수정단
	 */
	@RequestMapping("issueMain/issuesetting")
	public ModelAndView pro_setting(Model model,
									String mem_id,
									String pro_code,
									HttpSession session,
									Map<String, String> params,
									ModelAndView andView)throws Exception{
		this.logger.debug("issueMainController의 pro_main 콜백");
		this.logger.debug("{}의 {} 콜백", "issueMainController", "프로젝트 메인");
		
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		mem_id = member.getMem_id();
		
		params.put("mem_id", mem_id);
		params.put("pro_code", pro_code);
		
		List<ProInfoVO> issueMain = service.proListDetail(params);
		
		andView.addObject("issueMain", issueMain);
		
		return andView;
	}
	
	/**
	 *	프로젝트 수정하기
	 */
	@RequestMapping("issueMain/issueupdate")
	public String pro_update(@RequestParam String pro_code,
							 ProInfoVO proInfo)throws Exception{
		
		this.service.updatePro(proInfo);
		
		return "redirect:/user/project/pro_main.do";
	}
	
	/**
	 *	프로젝트 삭제하기
	 */
	@RequestMapping("issueMain/issuedelete")
	public String pro_delete(@RequestParam String pro_code,
			ProInfoVO proInfo)throws Exception{
		
		this.service.deletePro(proInfo);
		
		return "redirect:/user/project/pro_main.do";
	}
	
}
