package kr.or.ddit.issueCrew.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.grand.service.IGrandService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/issuetracker/crew/")
public class IssueCrewController {
	
	@Loggable
	private Logger logger;
	
	@Autowired
	private ICrewInfoService service;
	
	@Autowired
	private IProInfoService proService;
	
	@Autowired
	private IGrandService grand_service;
	
	@RequestMapping("crewList")
	public Model crewList(Model model, 
						  String pro_code,
						  String result,
						  Map<String, String> params) throws Exception{
		
		this.logger.debug("IssueCrewController의 crewList 콜백");
		this.logger.debug("{}의 {} 콜백", "IssueCrewController", "crewList");
		
		params.put("pro_code", pro_code);
		
		List<CrewInfoVO> crewList = this.service.crewList(params);
		model.addAttribute("crewList", crewList);
		
		return model;
	}
	
	@RequestMapping("crewChange")
	public ModelAndView crewChange(String mem_id,
								   String mem_nick,
								   String pro_code,
//								   Map<String, String> params,
								   ModelAndView andView) throws Exception{
		
		andView.addObject("mem_id", mem_id);
		andView.addObject("mem_nick", mem_nick);
		andView.addObject("pro_code", pro_code);
		
		return andView;
	}
	
	@RequestMapping("crewPLChange")
	public ModelAndView crewPLChange(
								   @RequestParam String mem_id,
								   @RequestParam String mem_nick,
								   String pro_code,
//								   Map<String, String> params,
								   ModelAndView andView) throws Exception{
		
		andView.addObject("mem_id", mem_id);
		andView.addObject("mem_nick", mem_nick);
		andView.addObject("pro_code", pro_code);
		
		return andView;
	}
	
	@RequestMapping("upPL")
	public ModelAndView upPL(@RequestParam String mem_id,
					   String pro_code,
					   String mem_nick,
					   CrewInfoVO crewInfo,
					   Map<String, String> params,
					   ModelAndView andView) throws Exception{
		
		andView.addObject("mem_id",mem_id);
		andView.addObject("pro_code",pro_code);
		andView.addObject("mem_nick",mem_nick);
		
//		crewInfo.setMem_id(mem_id);
		
		this.service.upPL(crewInfo);
		this.service.nonePL(crewInfo);
		
		andView.addObject("result", "PL이 "+mem_nick+"님으로 변경되었습니다.");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("deleteCrew")
	public ModelAndView deleteCrew(@RequestParam String mem_id, 
							    String pro_code,
							    String mem_nick,
							    CrewInfoVO crewInfo,
							    ModelAndView andView) throws Exception{

		String[] ar_mem_id = mem_id.split(",");
		
		String message = "";
		
		andView.addObject("mem_nick",mem_nick);
		andView.addObject("mem_id", mem_id);
		andView.addObject("pro_code", pro_code);
		
		for(int i = 0; i < ar_mem_id.length; i++){
			
		   crewInfo.setMem_id(ar_mem_id[i]);
		   
		   this.service.deleteCrew(crewInfo);
		}

		message = URLEncoder.encode("추방되었습니다!!", "UTF-8");
//		andView.setViewName("redirect:/user/issuetracker/crew/crewList.do?message="+message);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	//프로젝트 코드
	@RequestMapping("popLink")
	public ModelAndView popLink(@RequestParam String pro_link,
								String pro_code,
								ModelAndView andView) throws Exception{
		
		andView.addObject("pro_link", pro_link);
		andView.addObject("pro_code", pro_code);
		
		return andView;
	}
	
	//팀원 초대하기
	@RequestMapping("join")
	public ModelAndView inviteCrew(@RequestParam String pro_link,
								   String pro_code,
								   String mem_id,
								   HttpSession session,
								   HttpServletRequest request,
								   CrewInfoVO crewInfo,
								   Map<String, String> params,
								   ModelAndView andView) throws Exception{
		
		String message = "";
		
		if(session.getAttribute("LOGIN_MEMBERINFO") != null) {
		
			MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
	        mem_id = member.getMem_id();
			
			System.out.println("pro_code : "+pro_code);
			
	        // 프로젝트에 이미 가입되어 있는 회원이거나(1),
	        // 프로젝트 참여 갯수가 3개이상인 회원 걸러내기(2)
	        params.put("mem_id", mem_id);
			params.put("pro_code", pro_code);
			
			System.out.println("mem_id : "+mem_id);
			
			
			
			List<ProInfoVO> projectMain = proService.proInfoMain(params);
			
			ArrayList<String> pro_count = new ArrayList<String>();
			
			if(projectMain.size() != 0){
				
				for(ProInfoVO teamwon : projectMain){
					
					pro_count.add(teamwon.getPro_code());
					
					System.out.println("pro_count : "+pro_count.size());
					
					if(teamwon.getPro_code().equals(pro_code)){
	//					andView.addObject("message","이미 참여하고 있는 프로젝트입니다!");
						message = URLEncoder.encode("이미 참여하고 있는 프로젝트입니다!", "UTF-8");
						andView.addObject("pro_code",pro_code);
						andView.addObject("mem_id",mem_id);
						andView.setViewName("redirect:/user/project/pro_main.do?message="+message);
	
					}else{
						if(pro_count.size()==3){
							message = URLEncoder.encode("참여 가능한 프로젝트 수는 최대 3개입니다!", "UTF-8");
	//						andView.addObject("message","참여 가능한 프로젝트 수는 최대 3개입니다!");
							andView.addObject("pro_code",pro_code);
							andView.addObject("mem_id",mem_id);
							andView.setViewName("redirect:/user/project/pro_main.do?message="+message);
	
						}else{
							message = URLEncoder.encode("프로젝트 가입 완료!", "UTF-8");
							crewInfo.setMem_id(mem_id);
							this.service.inviteCrew(crewInfo);
	//						andView.addObject("message","프로젝트 초대 완료♥");
							andView.addObject("pro_code",pro_code);
							andView.addObject("mem_id",mem_id);
							andView.setViewName("redirect:/user/project/pro_main.do?message="+message);
	
						}
					}
				}
			
			}else{
				message = URLEncoder.encode("프로젝트 가입 완료!", "UTF-8");
				crewInfo.setMem_id(mem_id);
				this.service.inviteCrew(crewInfo);
				andView.addObject("pro_code",pro_code);
				andView.addObject("mem_id",mem_id);
				andView.setViewName("redirect:/user/project/pro_main.do?message="+message);
			}
			
		}else{
			message = URLEncoder.encode("로그인 먼저 해주세요!", "UTF-8");
			andView.setViewName("redirect:/login/loginForm.do?message="+message);
		}
		
		return andView;
	}

	@RequestMapping("crewUpdate")
	public ModelAndView crewUpdate(
								   @RequestParam String mem_id,
								   String pro_code,
//								   Map<String, String> params,
								   ModelAndView andView) throws Exception{
		
		String[] ar_mem_id = mem_id.split(",");
		
		andView.addObject("ar_mem_id", ar_mem_id);
		andView.addObject("grandList", grand_service.grandList());
		
		return andView;
	}
	
	@RequestMapping("crewUpdateGrade")
	public ModelAndView crewUpdateGrade(
										@RequestParam String mem_id,
										String pro_code,
										String grand_code,
//								   Map<String, String> params,
										CrewInfoVO crewInfo,
										ModelAndView andView) throws Exception{
		
//		String[] ar_mem_id = mem_id.split(",");
//		String[] ar_grand_code = grand_code.split(",");
		   
		if(grand_code.equals("PL")){
			andView.addObject("result", "PL지정은 위임 버튼을 이용해주세요.");
			andView.setViewName("jsonConvertView");
		}else{
			crewInfo.setGrand_code(grand_code);
			crewInfo.setMem_id(mem_id);
			crewInfo.setPro_code(pro_code);
			
			this.service.crewUpdateGrade(crewInfo);
			
			andView.addObject("result", "팀원 직책이 변경되었습니다.");
			andView.setViewName("jsonConvertView");
		}
//	    for(int i = 0; i < ar_mem_id.length; i++){
//	   }
		
		
		return andView;
	}
}
