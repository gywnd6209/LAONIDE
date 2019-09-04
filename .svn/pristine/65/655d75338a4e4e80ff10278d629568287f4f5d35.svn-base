package kr.or.ddit.projectMain.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProInfoVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/")
public class ProjectMainController {

	@Loggable
	private Logger logger;
	
	@Autowired
	private IProInfoService service;
	@Autowired
	private ICrewInfoService crewService;
	@Autowired
	private MemberService memService;
	
	/**
	 *	프로젝트 메인 
	 */
	@RequestMapping("pro_main")
	public Model projectMain(Model model,
							 String mem_id,
							 HttpSession session,
							 String pro_code,
							 Map<String, String> params)throws Exception{
		
		this.logger.debug("ProjectMainController의 pro_main 콜백");
		this.logger.debug("{}의 {} 콜백", "ProjectMainController", "프로젝트 메인");
		
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		mem_id = member.getMem_id();
		
		params.put("mem_id", mem_id);
		params.put("pro_code", pro_code);
		
		List<ProInfoVO> projectMain = service.proInfoMain(params);
		
		MemberVO memberInfo = memService.memberInfo(params);
		
		model.addAttribute("projectMain", projectMain);
		model.addAttribute("memberInfo", memberInfo);		
		
		return model;
	}
	
	/**
	 *	프로젝트 수정단
	 */
	@RequestMapping("pro_setting")
	public ModelAndView pro_setting(Model model,
									String mem_id,
									String pro_code,
									HttpSession session,
									Map<String, String> params,
									ModelAndView andView)throws Exception{
		
		this.logger.debug("ProjectMainController의 pro_main 콜백");
		this.logger.debug("{}의 {} 콜백", "ProjectMainController", "프로젝트 메인");
		
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
        mem_id = member.getMem_id();
        
		params.put("mem_id", mem_id);
		params.put("pro_code", pro_code);
		
		List<ProInfoVO> projectMain = service.proInfoListDetail(params);
		
		andView.addObject("projectMain", projectMain);
		
		return andView;
	}
	
	/**
	 *	프로젝트 수정하기
	 */
	@RequestMapping("pro_update")
	public String pro_update(@RequestParam String pro_code,
							 ProInfoVO proInfo)throws Exception{
		
		this.service.updateProInfo(proInfo);
		
		return "redirect:/user/project/pro_main.do";
	}
	
	/**
	 *	프로젝트 삭제하기
	 */
	@RequestMapping("pro_delete")
	public String pro_delete(@RequestParam String pro_code,
								ProInfoVO proInfo, 
								CrewInfoVO crewInfo)throws Exception{
		this.service.deleteProInfo(proInfo);
		this.crewService.deleteCrewAll(crewInfo);
		return "redirect:/user/project/pro_main.do";
	}
	
	///////////////////////
	//효중
	@RequestMapping("projectForm")
	public void projectForm(){
		
	}
	
	@RequestMapping("insertProject")
	public ModelAndView insertProject(
								ProInfoVO proInfo,
								Map<String, String> params,
								ModelAndView andView
								) throws Exception{
		String pro_code = this.service.insertProInfo(proInfo);
		
		andView.addObject("result", "프로젝트 생성이 완료되었습니다.");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
}
