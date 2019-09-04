package kr.or.ddit.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.compiler.ast.Keyword;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.NoticeVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/notice/")
public class UserNoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("noticeList")
	public Model noticeList(Model model, Map<String, String> params
							, HttpServletRequest request, String pageHtmls
							, String search_keyword, String search_keycode
							, String currentPage
							, String startCount, String endCount, 
							HttpServletResponse response) throws Exception{
		
		if (currentPage==null||currentPage.equals("")) {
			currentPage="1";
		}
		
		//쿠키삭제
		Cookie[] cookies = request.getCookies();

		if(cookies != null){

			for(int i=0; i< cookies.length; i++){
	
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
		
				response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

		}
				
		
		search_keyword = request.getParameter("search_keyword");
		search_keycode = request.getParameter("search_keycode");
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<NoticeVO> noticeList = this.service.noticeList(params);
		
		pageHtmls = pagingUtiles.getPageHtmls();
		
		System.out.println("키워드" + search_keyword);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("pagingUtiles", pagingUtiles);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("noticeView")
	public ModelAndView noticeView(@RequestParam String bo_no, Map<String, String> params, 
									ModelAndView andView,String search_keyword,
									String search_keycode, String currentPage,
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
		
		NoticeVO noticeInfo = this.service.noticeInfo(params);
		andView.addObject("noticeInfo", noticeInfo);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
//		andView.setViewName("user/notice/noticeView");
		
		return andView;
	}
	
	@RequestMapping("noticeForm")
	public void noticeForm(){
		
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(NoticeVO noticeInfo) throws Exception{
		this.service.insertNotice(noticeInfo);
		
		return "redirect:/user/notice/noticeList.do";
	}
	
	@RequestMapping("updateNotice")
	public String updateNotice(NoticeVO noticeInfo) throws Exception{
		this.service.updateNotice(noticeInfo);
		
		return "redirect:/user/notice/noticeList.do";
	}
	
	@RequestMapping("deleteNotice")
	public String deleteNotice(Map<String, String> params, String bo_no) throws Exception{
		params.put("bo_no", bo_no);
		
		this.service.deleteNotice(params);
		
		return "redirect:/user/notice/noticeList.do";
	}
}
