package kr.or.ddit.proboard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import kr.or.ddit.alramboard.service.IAlramboardService;
import kr.or.ddit.aop.Loggable;
import kr.or.ddit.controller.websocket.endpoint.WebSocketServerChatEP;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.proboard.service.IProboardService;
import kr.or.ddit.proboardfile.service.IProboardFileService;
import kr.or.ddit.utiles.GlobalConstant;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.AlramBoardVO;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ProBoardFileVO;
import kr.or.ddit.vo.ProBoardVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
//http://localhost/user/issuetracker/board/projectboardList.do
//http://localhost/user/issuetracker/board/projectboardForm.do
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/user/issuetracker/board/")
public class ProboardController {
	@Loggable
	private Logger logger;
	@Autowired
	private IProboardService service;
	@Autowired
	private IAlramboardService alramboardService;
	@Autowired
	private IProboardFileService fileService;
	
//	Session ws;
//	@Resource(name="WebSocketServerChatEP")
//	WebSocketServerChatEP ws;
	
	
	
	@RequestMapping("projectboardList")
	public Model projectboardList(Model model, 
									Map<String, String> params,
									HttpServletRequest request, @RequestParam String pro_name
									) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		String pro_code = request.getParameter("pro_code");
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		
		
		params.put("pro_code", pro_code);
		
		String search_keyword= request.getParameter("search_keyword");
		String search_keycode= request.getParameter("search_keycode");
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		

		int totalCount = this.service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage)
																,totalCount
																,request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<ProBoardVO> projectboardList = this.service.proboardList(params);
		model.addAttribute("projectboardList", projectboardList);
		
		model.addAttribute("pro_name", pro_name);
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("projectboardForm")
	public void projectboardForm() throws Exception{
		
	}
	
	@RequestMapping("projectboardView")
	public ModelAndView projectboardView (@RequestParam String bo_no,
											@RequestParam String rnum,
											@RequestParam String search_keyword,
											@RequestParam String search_keycode,
											@RequestParam String currentPage,
											@RequestParam String pro_code,
											String pro_name,
											Map<String, String> params,
											Map<String, String> replyPrarams,
											HttpServletRequest request,
											ProBoardVO proboardInfo,
//											List<ProBoardVO> proboardReplyList,
											ModelAndView andView) throws Exception{
		
		// 게시글 정보 불러오기
		params.put("bo_no", bo_no);
		params.put("rnum", rnum);
		
		proboardInfo = service.proboardInfo(params);
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		
		proboardInfo = service.proboardInfo(params);
		
		// 해당 댓글 가져오기
		
		replyPrarams.put("pro_code", pro_code);
		replyPrarams.put("bo_no", bo_no);
		List<ProBoardVO> proboardReplyList = service.proboardReplyList(replyPrarams);
		
		// 변수 넣어주기
		andView.addObject("pro_code",pro_code);
		andView.addObject("pro_name",pro_name);
		andView.addObject("proboardInfo", proboardInfo);
		andView.addObject("proboardReplyList", proboardReplyList);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
		
	}
	
	@RequestMapping("insertProboard")
	public String insertProboard(ProBoardVO proboardInfo, 
			@RequestParam String pro_code,@RequestParam String pro_name, RedirectAttributes redirect,
			@RequestParam("files") MultipartFile[] files) throws Exception{
				
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
			proboardInfo.setPro_code(pro_code);
		}
		
		String proboard_no =  service.insertProBoardInfo(proboardInfo, files);
				
		//프로젝트 게시판 들어가기
		AlramBoardVO alramboardInfo = new AlramBoardVO();
		alramboardInfo.setBo_no(proboard_no);
		alramboardInfo.setAlram_content(proboardInfo.getBo_title());
		alramboardInfo.setPro_code(pro_code);
		alramboardInfo.setMem_id(proboardInfo.getMem_id());
		alramboardInfo.setAlram_code("BOARD");
		alramboardInfo.setPri_code("0");
		alramboardInfo.setBo_writer(proboardInfo.getBo_writer());
		alramboardService.insertAlramboardInfo(alramboardInfo);
		
//		ws.getBasicRemote().sendText("새로운 프로젝트 글이 생성되었습니다!"); 
		
		redirect.addAttribute("pro_code", pro_code); 
		redirect.addAttribute("pro_name", pro_name); 
		
		return "redirect:/user/issuetracker/board/projectboardList.do";
	}
	@RequestMapping("updateProboard")
	public String updateProboard(ProBoardVO proboardInfo, @RequestParam String pro_code,@RequestParam String pro_name,
			RedirectAttributes redirect) throws Exception{
		service.updateProBoardInfo(proboardInfo);
		redirect.addAttribute("pro_code", pro_code); 
		redirect.addAttribute("pro_name", pro_name); 
		return "redirect:/user/issuetracker/board/projectboardList.do";
	}
	
	@RequestMapping("deleteProboard")
	public String deleteProboard(Map<String, String> params,
								String bo_no, @RequestParam String pro_code,@RequestParam String pro_name,
								RedirectAttributes redirect) throws Exception{
		params.put("bo_no", bo_no);
		service.deleteProBoardInfo(params);
		redirect.addAttribute("pro_code", pro_code); 
		redirect.addAttribute("pro_name", pro_name); 
		return "redirect:/user/issuetracker/board/projectboardList.do";
	}

	// 댓글 등록, 수정, 삭제
	// 등록, 수정, 삭제 = ajax
	@RequestMapping("insertProboardReply")
	public ModelAndView insertProboardReply(ProBoardVO proboardInfo,
//											String bo_no,
											String pro_code,
											ModelAndView andView) 
													throws Exception{
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
//		proboardInfo.setBo_group(bo_no);
//		proboardInfo.setPro_code(pro_code);
		String flag="";
		flag = service.insertProBoardReplyInfo(proboardInfo);
		if(flag.equals("")){
			andView.addObject("result", "fail");
		}else{
			andView.addObject("result", "success");
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateProboardReply")
	public ModelAndView updateProboardReply(ProBoardVO proboardInfo,
//											String bo_no,
											String pro_code,
											ModelAndView andView) 
													throws Exception{
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		
		String flag="";
		service.updateProboardReply(proboardInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("deleteProboardReply")
	public ModelAndView deleteProboardReply(Map<String, String> params,
											String bo_no, 
//											String pro_code,
											ModelAndView andView) 
													throws Exception{
//		if(pro_code == null || pro_code.equals("")){
//			pro_code = "1";
//		}
		params.put("bo_no", bo_no);
		service.deleteProBoardInfo(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("proDownload")
	public ModelAndView fileDownload(HttpServletRequest request,
			   HttpServletResponse response,
			   @RequestParam String file_seq,
			   ModelAndView andView) throws Exception{

		Map<String, String> params = new HashMap<String, String>();
		params.put("file_seq", file_seq);
		
		ProBoardFileVO proFileItemInfo = fileService.proFileItemInfo(params);
		proFileItemInfo.getFile_save_name();
		
		File downloadFile = new File(GlobalConstant.FILE_PATH, proFileItemInfo.getFile_save_name()); 
		
		
		
		if(downloadFile.exists()){
		
		String fileName = URLEncoder.encode(proFileItemInfo.getFile_name(), "UTF-8");
		
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
		
		andView.addObject("proFileItemInfo", proFileItemInfo);
		
		return andView;
		
		}

//	@MessageMapping("/echo")
//	@SendTo("/subscribe/notice")
//	public String sendEcho(String message, Principal principal) throws Exception {
//	       return message;
//	} 
}
