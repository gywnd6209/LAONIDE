package kr.or.ddit.freeboard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.freeboard.service.FreeboardService;
import kr.or.ddit.freeboardfile.service.FreeboardFileService;
import kr.or.ddit.utiles.GlobalConstant;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
// 컨트롤러가 붙어있으면 mvc-*에서 자동으로 빈등록을 해준당
// http://localhost/user/freeboard/freeboardList.do
// http://localhost/user/freeboard/freeboardView.do
// http://localhost/user/freeboard/freeboardForm.do
// http://localhost/user/freeboard/insertFreeboard.do
// http://localhost/user/freeboard/updateFreeboard.do
// http://localhost/user/freeboard/deleteFreeboard.do
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/user/freeboard/")
public class FreeboardController {
	
	@Autowired
	private FreeboardService service;
	@Autowired
	private FreeboardFileService fileService;
	
	@RequestMapping("freeboardList")
	public Model freeboardList(Model model, Map<String, String> params
							, String search_keyword, String search_keycode
							, String startCount, String endCount
							, HttpServletRequest request, HttpServletResponse response ) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		if (currentPage==null||currentPage.equals("")) {
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
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
//		System.out.println("sss"+pagingUtiles.getStartCount());
//		System.out.println("eee"+pagingUtiles.getEndCount());
		
		List<FreeboardVO> freeboardList = this.service.freeboardList(params);
		
		model.addAttribute("freeboardList", freeboardList);
		
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		model.addAttribute("pagingUtiles", pagingUtiles);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		
		return model;
	}
	
	@RequestMapping("freeboardView")
	public ModelAndView freeboardInfo(@RequestParam String bo_no, ModelAndView andView,
									Map<String, String> params, String search_keyword,
									String search_keycode, String currentPage,
									HttpServletRequest request, HttpServletResponse response,
									Map<String, String> replyParams) throws Exception{
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
				
		
		FreeboardVO freeboardInfo = this.service.freeboardInfo(params);
		
		if (search_keyword != null) {
			search_keyword = URLEncoder.encode(search_keyword, "UTF-8");
		}
		
		replyParams.put("bo_no", bo_no);
		List<FreeboardVO> freeboardReplyList = service.freeboardReplyList(replyParams);
		
		andView.addObject("freeboardInfo", freeboardInfo);
		andView.addObject("freeboardReplyList", freeboardReplyList);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
//		andView.setViewName("user/freeboard/freeboardInfo");
		
		return andView;
	}
	
	@RequestMapping("freeboardForm")
	public Model freeboardForm(Model model){
		return model;
	}
	
	@RequestMapping("insertFreeboard")
	public String insertFreeboard(FreeboardVO freeboardInfo,
								@RequestParam("files") MultipartFile[] files) throws Exception{
		this.service.insertFreeboard(freeboardInfo, files);
		
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("updateFreeboard")
	public String updateFreeboard(@RequestParam String bo_no, FreeboardVO freeboardInfo) throws Exception{
		this.service.updateFreeboard(freeboardInfo);
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("deleteFreeboard")
	public String deleteFreeboard(@RequestParam String bo_no, Map<String, String> params) throws Exception{
		params.put("bo_no", bo_no);
		this.service.deleteFreeboard(params);
		
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(HttpServletRequest request, HttpServletResponse response,
									@RequestParam String file_seq, ModelAndView andView) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("file_seq", file_seq);
		
		FreeboardFileVO freeboardFileInfo = fileService.fileItemInfo(params);
		
		File downloadFile = new File(GlobalConstant.FILE_PATH, freeboardFileInfo.getFile_save_name());
		if (downloadFile.exists()) {
			String fileName = URLEncoder.encode(freeboardFileInfo.getFile_name(), "UTF-8");
			
			response.setHeader("Content-Disposition", "attachment;filename="+fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) downloadFile.length());
			
			byte[] buffer = new byte[(int) downloadFile.length()];
			BufferedInputStream inputStream = new BufferedInputStream(
												new FileInputStream(downloadFile));
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			while ((readCnt = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer);
			}
			inputStream.close();
			outputStream.close();
		}
		andView.addObject("freeboardFileInfo", freeboardFileInfo);
		
		return andView;
	}
	
	@RequestMapping("insertFreeboardReply")
	public ModelAndView insertFreeboardReply(FreeboardVO freeboardInfo, String bo_no,
											ModelAndView andView) throws Exception{
		if (bo_no==null||bo_no.equals("")) {
			bo_no = "1";
		}
		
		String flag = "";
		flag = service.insertFreeboardReply(freeboardInfo);
		
		if (flag.equals("")) {
			andView.addObject("result", "fail");
		}else {
			andView.addObject("result", "success");
		}
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("updateFreeboardReply")
	public ModelAndView updateFreeboardReply(FreeboardVO freeboardInfo, String bo_no
											, ModelAndView andView) throws Exception{
		if (bo_no==null||bo_no.equals("")) {
			bo_no="1";
		}
		
		String flag = "";
		
		service.updateFreeboardReply(freeboardInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("deleteFreeboardReply")
	public ModelAndView deleteFreeboardReply(Map<String, String> params, String bo_no
											, ModelAndView andView) throws Exception{
		params.put("bo_no", bo_no);
		service.deleteFreeboard(params);
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
}
