package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.MemberVO;
import oracle.net.aso.a;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/faqboard")
public class FAQController {

	@Loggable
	private Logger logger;
	
	@Autowired 
	private IFAQService service;
	
	/**
	 *	FAQ 리스트 
	 */
	@RequestMapping("faqList")
	public Model faqList(Model model, 
						 Map<String, String> params,
						 String search_keyword,
						 String search_keycode,
						 String startCount,
						 String endCount,
						 HttpServletResponse response,
						 HttpServletRequest request) throws Exception{
		
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		//쿠키삭제
		Cookie[] cookies = request.getCookies();

		if(cookies != null){

			for(int i=0; i< cookies.length; i++){
	
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
		
				response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

		}
		search_keyword= request.getParameter("search_keyword");
		search_keycode= request.getParameter("search_keycode");
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage)
																,totalCount
																,request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
//		params.put("startCount", "10");
//		params.put("endCount", "1");
		
		List<FaqVO> faqboardList = this.service.faqboardList(params);
		
		model.addAttribute("faqboardList", faqboardList);
		
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		
		return model;
	}
	
	/**
	 *	FAQ 뷰 
	 */
	@RequestMapping("faqView")
	public ModelAndView faqView(@RequestParam String bo_no,
						 ModelAndView andView, 
						 @RequestParam String search_keyword,
						 @RequestParam String search_keycode,
						 @RequestParam String currentPage,
						 HttpServletRequest request,
						 HttpServletResponse response,
						 Map<String, String> params) throws Exception{
		
		params.put("bo_no", bo_no); 
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
		FaqVO faqboardInfo = this.service.faqboardInfo(params);
		
		andView.addObject("faqboardInfo",faqboardInfo);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
	}
	
	/**
	 *	FAQ 폼  
	 */
	@RequestMapping("faqForm")
	public Model faqForm(Model model) throws Exception{
		return model;
	}
	
	/**
	 *	FAQ insert   
	 */
	@RequestMapping("insertFaqInfo")
	public String insertFaqInfo(FaqVO faqInfo) throws Exception{

		this.service.insertFaqInfo(faqInfo);
		
		return "redirect:/user/faqboard/faqList.do";
		
	}
	
	/**
	 *	FAQ update  
	 */
	@RequestMapping("updateFaqInfo")
	public String updateFaqInfo(@RequestParam String bo_no,
								FaqVO faqboardInfo) throws Exception{
		
		this.service.updateFaqInfo(faqboardInfo);
		
		return "redirect:/user/faqboard/faqList.do";
	}
	
	/**
	 *	FAQ delete  
	 */
	@RequestMapping("deleteFaqInfo")
	public String deleteFaqInfo(@RequestParam String bo_no, 
								Map<String, String> params) throws Exception{
		
		params.put("bo_no", bo_no);
		
		this.service.deleteFaqboardInfo(params);
		
		return "redirect:/user/faqboard/faqList.do";
	}
}
