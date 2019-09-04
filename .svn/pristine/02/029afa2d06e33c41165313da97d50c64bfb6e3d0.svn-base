package kr.or.ddit.qaboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.qaboard.service.IQaboardService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.QaboardVO;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

// http://localhost/user/freeboard/freeboardList.do
// 					/user/freeboard/freeboardView.do
// http://localhost/SpringToddler/user/freeboard/freeboardList.do
// http://localhost/SpringToddler/user/freeboard/InsertFreeboard.do
// http://localhost/SpringToddler/user/freeboard/UpdateFreeboard.do
// http://localhost/SpringToddler/user/freeboard/DeleteFreeboard.do
@Controller
@RequestMapping("/user/qaboard/")
public class QaboardController  {
	
	@Loggable
	private Logger logger;
		
	@Autowired
	private IQaboardService service;
	
	
	@RequestMapping("qaboardList")
	public Model qaboardList(Model model, 
							Map<String, String> params, 
							String search_keyword, 
							String search_keycode, 
							String startCount, 
							String endCount, 
							HttpServletRequest request,
							HttpServletResponse response) throws Exception{
		
//		this.logger.debug("FreeboardController의 freeboardList 콜백");
//		this.logger.debug("{}의 {}zhfqor", "FreeboardContorller", "freeboardList");
		
		
		
		
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
		
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		params.put("search_keyword" , search_keyword);
		params.put("search_keycode" , search_keycode);
		System.out.println(search_keyword);
		System.out.println(search_keycode);
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage)
															,totalCount
															,request);
		System.out.println(pagingUtiles.getStartCount());
		System.out.println(pagingUtiles.getEndCount());
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<QaboardVO> qaboardList = null;
		
			qaboardList = this.service.qaboardList(params);
		
		model.addAttribute("qaboardList", qaboardList);
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("pagingUtiles", pagingUtiles);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		
		return model;
	}
	
	// /user/qaboard/qaboardView.do
	// /WEB-INF/view/user/qaboard/qaboardView.jsp
	@RequestMapping("qaboardView") //@RequestParam : 필수임 없으면 에러남
	public ModelAndView qaboardView( @RequestParam String bo_no, 
											String bo_group,
										Map<String, String> params,
										ModelAndView andView,
										String search_keyword,
										String search_keycode,
										String currentPage,
										HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		
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
		System.out.println("cookies.length");
		System.out.println(cookies.length);
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
		
		
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		
		
		QaboardVO qaboardInfo = this.service.qaboardInfo(params);
		
		params.put("bo_group", qaboardInfo.getBo_group());
		params.put("bo_depth", qaboardInfo.getBo_depth());
		
		QaboardVO qaboardReplyInfo = this.service.qaboardReplyInfo(params);
		
		andView.addObject("qaboardInfo", qaboardInfo);
		andView.addObject("qaboardReplyInfo", qaboardReplyInfo);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);

		andView.addObject("currentPage", currentPage);
		
//		andView.setViewName("user/qaboard/qaboardView");
		
		return andView;
	}
	
//	@RequestMapping("freeboardForm")
//	public ModelAndView freeboardForm(ModelAndView andView) throws Exception{
//		
//		andView.setViewName("user/freeboard/freeboardForm");
//		
////		return "redirect:/user/freeboard/freeboardForm.do";
//		return andView;
//		
//	}
	

	@RequestMapping("qaboardForm")
	public void qaboardForm() throws Exception{
		
	}
	
	@RequestMapping("insertQaboard")
	public String insertQaboard(QaboardVO qaboardInfo) throws Exception{
		String ii = this.service.insertQaboardInfo(qaboardInfo);
		return "redirect:/user/qaboard/qaboardList.do";
	}
	
	@RequestMapping("updateQaboard")
	public String updateQaboard(QaboardVO qaboardInfo) throws Exception{
		this.service.updateQaboardInfo(qaboardInfo);
		return "redirect:/user/qaboard/qaboardList.do";
//		return "forward:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("deleteQaboard")
	public String deleteQaboard(@RequestParam String bo_no, String bo_group, Map<String, String> params) throws Exception{
		params.put("bo_no", bo_no);
		params.put("bo_group", bo_group);
		this.service.deleteQaboardInfo(params);
		
		return "redirect:/user/qaboard/qaboardList.do";
	}
	
	@RequestMapping("qaboardReplyForm")
	public ModelAndView qaboardReplyForm( @RequestParam String bo_no,
											Map<String, String> params,
											ModelAndView andView) throws Exception{

			params.put("bo_no", bo_no);
			
			QaboardVO qaboardInfo = this.service.qaboardInfo(params);
			
			andView.addObject("qaboardInfo", qaboardInfo);
			andView.setViewName("user/qaboard/qaboardReplyForm");
			
			return andView;
	}
	
	@RequestMapping("qaboardReplyUpdateForm")
	public ModelAndView qaboardReplyUpdateForm( @RequestParam String bo_no, 
													String bo_group,
													Map<String, String> params,
													ModelAndView andView) throws Exception{
		
		params.put("bo_no", bo_no);
		
		QaboardVO qaboardInfo = this.service.qaboardInfo(params);
		
		params.put("bo_group", qaboardInfo.getBo_group());
		params.put("bo_depth", qaboardInfo.getBo_depth());
		
		QaboardVO qaboardReplyInfo = this.service.qaboardReplyInfo(params);
		
		andView.addObject("qaboardReplyInfo", qaboardReplyInfo);
		andView.setViewName("user/qaboard/qaboardReplyUpdateForm");
		
		return andView;
	}
	
	@RequestMapping("insertQaboardReply")
	public String insertQaboardReply(QaboardVO qaboardInfo) throws Exception{
		String ii = this.service.insertQaboardReplyInfo(qaboardInfo);
		return "redirect:/user/qaboard/qaboardList.do";
	}
	
	@RequestMapping("deleteQaboardReply")
	public String deleteQaboardReply(@RequestParam String bo_no, Map<String, String> params) throws Exception{
		params.put("bo_no", bo_no);
		this.service.deleteQaboardReply(params);
		
		return "redirect:/user/qaboard/qaboardList.do";
	}
	
//	@RequestMapping("searchQaboard")
	
	
	

}
