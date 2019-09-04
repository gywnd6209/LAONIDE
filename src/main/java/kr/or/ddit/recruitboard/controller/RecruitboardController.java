package kr.or.ddit.recruitboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.grand.service.IGrandService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.recruitboard.service.IRecruitboardService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.GrandVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user/recruitboard/")
public class RecruitboardController {
	
	@Autowired
	private IRecruitboardService service;
	
	@Autowired
	private IGrandService grand_service;
	
	@Autowired
	private IProInfoService proInfo_service;
	
	@Autowired
	private ICrewInfoService crewInfo_service;
	
	@RequestMapping("recruitboardList")
	public Model recruitboardList(Model model, 
								Map<String, String> params,
								HttpServletRequest request,
								HttpServletResponse response
//								HttpSession session,
//								Map<String, String> publicKeyMap
								)throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
//		쿠키삭제
		Cookie[] cookies = request.getCookies();

		if(cookies != null){

			for(int i=0; i< cookies.length; i++){
	
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
		
				response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

		}
		
//		publicKeyMap= CryptoGenerator.getGeneratePairKey(session);
//		session.setAttribute("publicKeyMap", publicKeyMap);
//		
//		this.logger.debug("FreeboardController의 freeboardList 콜백");
//		this.logger.debug("{}의 {} 콜백", "FreeboardController", "freeboardList");
//		
		String search_keyword= request.getParameter("search_keyword");
		String search_keycode= request.getParameter("search_keycode");
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = this.service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage)
																,totalCount
																,request);
		
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<RecruitBoardVO> recruitboardList = this.service.recruitboardList(params);
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		int count = 0;
		count =  service.pro_count(params);
		
		model.addAttribute("recruitboardList", recruitboardList);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
		
	}
	
	@RequestMapping("recruitboardForm")
	public void recruitboardForm() throws Exception {}
	
	
	@RequestMapping("recruitboardView")
	public ModelAndView recruitboardView(@RequestParam String bo_no,
			@RequestParam String rnum,
			@RequestParam String search_keyword,
			@RequestParam String search_keycode,
			@RequestParam String currentPage,
			Map<String, String> params,
			Map<String, String> params1,
			Map<String, String> params2,
			HttpServletRequest request,
			HttpServletResponse response,
			RecruitBoardVO recruitboardInfo,
			ProInfoVO proInfoInfo,
			ModelAndView andView) throws Exception{
		
//		System.out.println(request.getCookies());
		
		params.put("bo_no", bo_no);
		params.put("rnum", rnum);
		
		// 조회수 새로고침 방지
		// 저장된 쿠키 불러오기 
		Cookie cookies[] = request.getCookies(); 
		Map mapCookie = new HashMap<String, String>(); 
		if(request.getCookies() != null){ 
			for (int i = 0; i < cookies.length; i++) { 
				Cookie obj = cookies[i]; 
				mapCookie.put(obj.getName(),obj.getValue()); 
			} 
		} 
		// 저장된 쿠키중에 read_count 만 불러오기
		String cookie_read_count = (String) mapCookie.get("read_count"); 
		
		// 저장될 새로운 쿠키값 생성 
		String new_cookie_read_count = "|" + bo_no; 
		
		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사 
		if ( StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) { 
			
			// 없을 경우 쿠키 생성 
			Cookie cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count); 
			
			//cookie.setMaxAge(1000); // 초단위 
			response.addCookie(cookie); 
			
			// 조회수 업데이트 
			this.service.updateHit(params); 
		}
		
		recruitboardInfo = service.recruitboardInfo(params);
		
		if(search_keyword !=null){
			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
		}
		
		String currentPage1 = request.getParameter("currentPage1");
		if(currentPage1 == null || currentPage1.equals("")){
			currentPage1 = "1";
		}
		
		params1.put("bo_no", bo_no);
		params1.put("rnum", rnum);
		
		int totalCount1 = this.service.totalCountReply(params1);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage1)
				,totalCount1
				,request);
		
		params1.put("startCount", pagingUtiles.getStartCount());
		params1.put("endCount", pagingUtiles.getEndCount());
		
		List<RecruitBoardVO> recruitboardReplyList = this.service.recruitboardReplyList(params1);
		
		params2.put("bo_no", bo_no);
		proInfoInfo = this.proInfo_service.proInfoInfo(params2);
		
		if(proInfoInfo == null){
			andView.addObject("proInfoInfo.bo_no", "0");	
		}
		
		andView.addObject("recruitboardInfo", recruitboardInfo);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		andView.addObject("recruitboardReplyList", recruitboardReplyList);
		andView.addObject("pageHtmls", pagingUtiles.getPageHtmls());
		andView.addObject("currentPage1", currentPage1);
		
		andView.addObject("proInfoInfo", proInfoInfo);
		
		return andView;
	}
	
	@RequestMapping("insertRecruitboard")
	   public String insertRecruitboard(RecruitBoardVO recruitboardInfo) throws Exception {
		   
	      this.service.insertRecruitboardInfo(recruitboardInfo);

	      // redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다.");

	      return "redirect:/user/recruitboard/recruitboardList.do";
	   }
	   
	   @RequestMapping("updateRecruitboard")
	   public String updateRecruitboard(RecruitBoardVO recruitboardInfo) throws Exception{
		   
		   this.service.updateRecruitboardInfo(recruitboardInfo);
			
			return "redirect:/user/recruitboard/recruitboardList.do";
	   }
	   
	   @RequestMapping("deleteRecruitboard")
		public String deleteRecruitboard(Map<String, String> params,
										String bo_no) throws Exception{
			
			params.put("bo_no", bo_no);
			
			this.service.deleteRecruitboardInfo(params);
				
			return "forward:/user/recruitboard/recruitboardList.do";
		}
	   
//	   @RequestMapping("insertRecruitboardReply")
//	   public String insertRecruitboardReply(RecruitBoardVO recruitboardInfo) throws Exception {
//		   
//	      this.service.insertRecruitboardReplyInfo(recruitboardInfo);
//
//	      // redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다.");
//
//	      return "redirect:/user/recruitboard/recruitboardView.do";
//	   }
	   
	   @RequestMapping("insertRecruitboardReply")
		public ModelAndView insertRecruitboardReply(RecruitBoardVO recruitboardInfo,
													String bo_no,
													String mem_id,
													String lang_code,
													String lang_level,
													String bo_content,
													String bo_writer,
													String bo_group,
													String bo_seq,
													String bo_depth,
													Map<String, String> params,
													ModelAndView andView) throws Exception{
		   
			params.put("bo_no", bo_no);
			params.put("mem_id", mem_id);
			params.put("lang_code", lang_code);
			params.put("lang_level", lang_level);
			params.put("bo_content", bo_content);
			params.put("bo_writer", bo_writer);
			params.put("bo_group", bo_group);
			params.put("bo_seq", bo_seq);
			params.put("bo_depth", bo_depth);
			
			String recruitboardReplyInfo = this.service.insertRecruitboardReplyInfo(recruitboardInfo);
			
			andView.addObject("result", recruitboardReplyInfo);
			// application-views.xml 내 선언된 빈의 id.
			andView.setViewName("jsonConvertView");
			
			return andView;
		}
	   
	   @RequestMapping("updateRecruitboardReply")
	   public ModelAndView updateRecruitboardReply(RecruitBoardVO recruitboardInfo,
												   String bo_no,
												   String bo_content,
												   Map<String, String> params,
												   ModelAndView andView) throws Exception{
		   
		   params.put("bo_no", bo_no);
		   params.put("bo_content", bo_content);
		   
		   this.service.updateRecruitboardReplyInfo(recruitboardInfo);
		   		   
		   andView.addObject("result", "업데이트 성공");
			// application-views.xml 내 선언된 빈의 id.
		   andView.setViewName("jsonConvertView");
		   
		   return andView;
	   }
	   
	   @RequestMapping("deleteRecruitboardReply")
		public ModelAndView deleteRecruitboardReply(Map<String, String> params,
												String bo_no,
												ModelAndView andView) throws Exception{
			
			params.put("bo_no", bo_no);
			
			this.service.deleteRecruitboardInfo(params);
				
			andView.addObject("result", "댓글이 삭제되었습니다.");
			// application-views.xml 내 선언된 빈의 id.
		   andView.setViewName("jsonConvertView");
		   
		   return andView;
		}
	   
	   @RequestMapping("createTeam")
		public ModelAndView createTeam(@RequestParam String bo_no,
										@RequestParam String mem_id,
										@RequestParam String mem_nick,
										Map<String, String> params,
										RecruitBoardVO recruitboardInfo,
										ModelAndView andView) throws Exception{
								
			params.put("bo_no", bo_no);
			
			recruitboardInfo = service.recruitboardInfo(params);
			
			String[] ar_mem_id = mem_id.split(",");
			String[] ar_mem_nick = mem_nick.split(",");
			
			andView.addObject("recruitboardInfo", recruitboardInfo);
			andView.addObject("ar_mem_id", ar_mem_id);
			andView.addObject("ar_mem_nick", ar_mem_nick);
			andView.addObject("id_nick_params", params);
			andView.addObject("grandList", grand_service.grandList());
			
			return andView;
		}
	   
	   @RequestMapping("insertProject")
	   public ModelAndView insertProject(ProInfoVO proInfo, 
										   CrewInfoVO crewInfo,
										   Map<String, String> params,
										   @RequestParam String crew_cnt,
										   @RequestParam String grand_code,
										   @RequestParam String mem_id,
										   ModelAndView andView) throws Exception {
		   
		   proInfo.setCrew_cnt(crew_cnt);
		   String pro_code = this.proInfo_service.insertProInfo(proInfo);
		   
		   String[] ar_mem_id = mem_id.split(",");
		   String[] ar_grand_code = grand_code.split(",");
		   
		   for(int i = 0; i < ar_mem_id.length; i++){
			   crewInfo.setGrand_code(ar_grand_code[i]);
			   crewInfo.setMem_id(ar_mem_id[i]);
			   crewInfo.setPro_code(pro_code);
			   
			   this.crewInfo_service.insertCrewInfo(crewInfo);
		   }
		   
		   andView.addObject("result", "프로젝트 팀구성 및 프로젝트 생성이 완료되었습니다.");
		   andView.setViewName("jsonConvertView");
		   
		   return andView;
	   }
	   
	   @RequestMapping("pro_count")
	   public ModelAndView pro_count(@RequestParam String mem_id,
			   						@RequestParam String bo_writer,
			   						Map<String, String> params,
			   						ModelAndView andView) throws Exception {
		   		   
		   String[] split_mem_id = mem_id.split(",");
		   String id_nick = "";
		   String fail_crew = "";
		   String result = "";
		   int count = 0;
		   
		   params.put("mem_id", bo_writer);
		   count = service.pro_count(params);
		   
		   if(count >= 3){
			   result = "이미 세 개 이상 진행중인 프로젝트가 있습니다.";
			   
		   }else{
			   for(int i = 0; i < split_mem_id.length; i++){
				   params.put("mem_id", split_mem_id[i]);
				   count =  service.pro_count(params);
				  
				  if(count >= 3){
					  id_nick = service.id_nick(split_mem_id[i]);
					  fail_crew += id_nick + ", ";
				  }
				  
			   }
			   
			   if(fail_crew != ""){
				   String list = fail_crew.substring(0, fail_crew.length()-2);
				   result = list + "님은 이미 세 개 이상 진행중인 프로젝트가 있습니다.";
			   }else{
				   result = "success";
			   }
		   }
		   
		   andView.addObject("result", result);
		   andView.setViewName("jsonConvertView");
		   
		   return andView;
	   }
}





























