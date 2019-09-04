package kr.or.ddit.library.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.libraryfile.service.ILibraryFileService;
import kr.or.ddit.utiles.GlobalConstant;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.LibraryboardVO;
import kr.or.ddit.vo.LibraryfileVO;
import kr.or.ddit.vo.ProBoardVO;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/library")
public class AdminLibraryController {

	@Loggable
	private Logger logger;
	
	@Autowired 
	private ILibraryService service;
	@Autowired 
	private ILibraryFileService fileService;
	
	/**
	 *	자료실 리스트 
	 */
	@RequestMapping("libraryList")
	public Model libraryList(Model model, 
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
		
		List<LibraryboardVO> libraryList = this.service.libraryboardList(params);
		model.addAttribute("libraryList", libraryList);
		
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		model.addAttribute("pagingUtiles", pagingUtiles);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		
		return model;
	}
	
	/**
	 *	자료실 뷰 
	 */
	@RequestMapping("libraryView")
	public ModelAndView libraryView(@RequestParam String bo_no,
//									@RequestParam String rnum,
									String search_keyword,
									String search_keycode,
									String currentPage,
//									@RequestParam(defaultValue = "", required=false) String search_keyword,
//									@RequestParam(defaultValue = "", required=false) String search_keycode,
//									@RequestParam(defaultValue = "", required=false) String currentPage,
						 			ModelAndView andView, 
						 			HttpServletRequest request,
									HttpServletResponse response,
						 			Map<String, String> replyPrarams,
						 			Map<String, String> params) throws Exception{
		
		params.put("bo_no", bo_no);
//		params.put("rnum", rnum);
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
		
		LibraryboardVO libraryInfo = this.service.libraryInfo(params);
		
		if(search_keyword !=null){
			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
		}
		
		replyPrarams.put("bo_no", bo_no);
		
		List<LibraryboardVO> libraryReplyList = service.libraryReplyList(replyPrarams);
		
		andView.addObject("libraryInfo", libraryInfo);
		andView.addObject("libraryReplyList", libraryReplyList);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
	}
	
	/**
	 *	자료실 폼  
	 */
	@RequestMapping("libraryForm")
	public Model libraryForm(Model model) throws Exception{
		return model;
	}
	
	/**
	 *	자료실 insert   
	 */
	@RequestMapping("insertLibraryInfo")
	public String insertLibraryInfo(LibraryboardVO libraryInfo,
									@RequestParam("files") MultipartFile[] files) throws Exception{

		this.service.insertLibraryInfo(libraryInfo, files);
		return "redirect:/admin/library/libraryList.do";
	}
	
	/**
	 *	자료실 update
	 */
	@RequestMapping("updateLibraryInfo")
	public String updateLibraryInfo(@RequestParam String bo_no,
									LibraryboardVO libraryInfo) throws Exception{
		
		this.service.updateLibraryInfo(libraryInfo);
		
		return "redirect:/admin/library/libraryList.do";
		
	}
	
	/**
	 *	자료실 delete
	 */
	@RequestMapping("deleteLibraryInfo")
	public String deleteLibraryInfo(@RequestParam String bo_no, 
									Map<String, String> params) throws Exception{
		params.put("bo_no", bo_no);
		this.service.deleteLibraryInfo(params);
		
		return "redirect:/admin/library/libraryList.do";
		
	}
	
	/**
	 *	자료실 파일 다운로드
	 */
	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(HttpServletRequest request,
							   HttpServletResponse response,
							   @RequestParam String file_seq,
							   ModelAndView andView) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("file_seq", file_seq);
		
		LibraryfileVO libraryfileItemInfo = fileService.fileItemInfo(params);
		
		File downloadFile = new File(GlobalConstant.FILE_PATH, libraryfileItemInfo.getFile_save_name()); 
		if(downloadFile.exists()){
			
			String fileName = URLEncoder.encode(libraryfileItemInfo.getFile_name(), "UTF-8");
			
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int)downloadFile.length());
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
			
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			
			while((readCnt = inputStream.read(buffer)) != -1){
				outputStream.write(buffer);
			}
			inputStream.close();
			outputStream.close();
		}
		
		andView.addObject("libraryfileItemInfo", libraryfileItemInfo);
		
		return andView;
		
	}
	
	/**
	 *	자료실 댓글 등록, 수정, 삭제
	 */
	@RequestMapping("insertLibraryReply")
	public ModelAndView insertLibraryReply(LibraryboardVO libraryInfo,
										   String bo_no,
										   ModelAndView andView) throws Exception{
		if(bo_no == null || bo_no.equals("")){
			bo_no = "1";
		}
		
		String flag="";
		flag = service.insertLibraryReplyInfo(libraryInfo);
		
		if(flag.equals("")){
			andView.addObject("result", "fail");
		}else{
			andView.addObject("result", "success");
		}
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateLibraryReply")
	public ModelAndView updateLibraryReply(LibraryboardVO libraryInfo,
											String bo_no,
											ModelAndView andView) 
													throws Exception{
		if(bo_no == null || bo_no.equals("")){
			bo_no = "1";
		}
		
		String flag="";
		service.updateLibraryReply(libraryInfo);;
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteLibraryReply")
	public ModelAndView deleteLibraryReply(Map<String, String> params,
											String bo_no, 
											ModelAndView andView) 
													throws Exception{
		params.put("bo_no", bo_no);
		service.deleteLibraryInfo(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
		
}
