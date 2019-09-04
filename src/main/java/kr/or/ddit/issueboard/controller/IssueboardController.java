package kr.or.ddit.issueboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.alramboard.service.IAlramboardService;
import kr.or.ddit.aop.Loggable;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.issueEndboard.service.IIssueEndboardService;
import kr.or.ddit.issueboard.service.IIssueboardService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.AlramBoardVO;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.IssueEndVO;
import kr.or.ddit.vo.IssueboardVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//http://localhost/user/issuetracker/board/projectboardList.do
//http://localhost/user/issuetracker/board/projectboardForm.do
@Controller
@RequestMapping("/user/issuetracker/issueboard/")
public class IssueboardController {
	@Loggable
	private Logger logger;
	@Autowired
	private IIssueboardService service;
	@Autowired
	private ICrewInfoService crew_service;
	@Autowired
	private IIssueEndboardService issue_end_service;
	// 은혜 추가
	@Autowired
	private IAlramboardService alramboardService;
	
	@RequestMapping("issueboardList")
	public Model projectboardList(Model model, 
									Map<String, String> params,
									HttpServletRequest request,
									@RequestParam String pro_code, 
									@RequestParam String pro_name) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		 
		pro_code = request.getParameter("pro_code");
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
		
		List<IssueboardVO> issueboardList = this.service.issueboardList(params);
		model.addAttribute("issueboardList", issueboardList);
		
		model.addAttribute("pro_name", pro_name);
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("issueboardForm")
	public Model issueboardForm(Map<String, String> params, 
									Model model, 
									CrewInfoVO crewInfo,
									@RequestParam String pro_code) throws Exception{
		
		params.put("pro_code", pro_code);
		
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("crewList", crew_service.crewList(params));
		
		return model;
	}
	
	@RequestMapping("issueboardView")
	public ModelAndView issueboardView (@RequestParam String isu_no,
											@RequestParam String rnum,
											@RequestParam String search_keyword,
											@RequestParam String search_keycode,
											@RequestParam String currentPage,
											@RequestParam String pro_code,
											String pro_name,
											Map<String, String> params,
											Map<String, String> replyParams,
											HttpServletRequest request,
											IssueboardVO issueboardInfo,
											CrewInfoVO crewInfo,
											IssueEndVO issueboardReplyList,
											ModelAndView andView) throws Exception{
		
		// 게시글 정보 불러오기
		params.put("isu_no", isu_no);
		params.put("rnum", rnum);
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		params.put("pro_code", pro_code);
		issueboardInfo = service.issueboardInfo(params);
		// 해당 댓글 가져오기
		
		replyParams.put("isu_no", isu_no);
		
		// 변수 넣어주기
		andView.addObject("pro_code", pro_code);
		andView.addObject("pro_name",pro_name);
		andView.addObject("issueboardInfo", issueboardInfo);
		andView.addObject("crewList", crew_service.crewList(params));
		andView.addObject("issueboardReplyList", issue_end_service.issueEndboardList(replyParams));
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
		
	}
	
	@RequestMapping("insertIssueboard")
	public String insertIssueboard(IssueboardVO issueboardInfo, 
			@RequestParam String pro_code,
			@RequestParam String isu_priority,
			@RequestParam String pro_name, RedirectAttributes redirect) throws Exception{
				
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
			issueboardInfo.setPro_code(pro_code);
		}
		issueboardInfo.setIsu_rank(isu_priority);
		String sel_isu_no = service.insertIssueBoardInfo(issueboardInfo);
		
		//schedule 등록 
		issueboardInfo.setIsu_no(sel_isu_no);
		service.insertSchedule(issueboardInfo);
		
		
		
		// 프로젝트 게시판 들어가기
		AlramBoardVO alramboardInfo = new AlramBoardVO();
		alramboardInfo.setBo_no(sel_isu_no);
		alramboardInfo.setAlram_content(issueboardInfo.getIsu_title());
		alramboardInfo.setPro_code(pro_code);
		alramboardInfo.setMem_id(issueboardInfo.getMem_id());
		alramboardInfo.setAlram_code("ISSUE");
		alramboardInfo.setPri_code(issueboardInfo.getIsu_rank());
		alramboardInfo.setBo_writer(issueboardInfo.getIsu_writer());
		alramboardService.insertAlramboardInfo(alramboardInfo);
		
		redirect.addAttribute("pro_name", pro_name); 
		
		return "redirect:/user/issuetracker/issueboard/issueboardList.do?pro_code="+pro_code;
	}
	
	@RequestMapping("updateIssueboard")
	public String updateIssueboard(IssueboardVO issueboardInfo, 
									@RequestParam String pro_code, 
									@RequestParam String isu_priority,
									@RequestParam String pro_name,
									RedirectAttributes redirect) throws Exception{
		
		issueboardInfo.setIsu_rank(isu_priority);
		service.updateIssueBoardInfo(issueboardInfo);
		redirect.addAttribute("pro_name", pro_name); 
		return "redirect:/user/issuetracker/issueboard/issueboardList.do?pro_code="+pro_code;
	}
	
	@RequestMapping("deleteIssueboard")
	public String deleteIssueboard(Map<String, String> params,
								String isu_no, @RequestParam String pro_code,
								@RequestParam String pro_name,
								RedirectAttributes redirect) throws Exception{
		params.put("isu_no", isu_no);
		service.deleteIssueBoardInfo(params);
		redirect.addAttribute("pro_name", pro_name); 
		return "redirect:/user/issuetracker/issueboard/issueboardList.do?pro_code="+pro_code;
	}

	// 댓글 등록, 수정, 삭제
	// 등록, 수정, 삭제 = ajax
	@RequestMapping("insertIssueboardReply")
	public ModelAndView insertIssueboardReply(IssueEndVO issueEndboardInfo,
											IssueboardVO issueboardInfo,
											@RequestParam String isu_end_ok,
											ModelAndView andView) 
													throws Exception{
		String flag="";
		flag = issue_end_service.insertIssueEndBoardInfo(issueEndboardInfo);
		
		
		issueboardInfo.setIsu_no(issueEndboardInfo.getIsu_no());
		
		if(isu_end_ok.equals("Y")){
			issueboardInfo.setIsu_end_ok(isu_end_ok);
			issueboardInfo.setIsu_no(issueEndboardInfo.getIsu_no());
			service.updateIssueBoardInfo_end(issueboardInfo);
		}
		
		if(flag.equals("")){
			andView.addObject("result", "fail");
		}else{
			andView.addObject("result", "success");
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateIssueboardReply")
	public ModelAndView updateIssueboardReply(IssueEndVO issueEndboardInfo,
											ModelAndView andView) 
													throws Exception{
		
//		String flag="";
		issue_end_service.updateIssueEndBoardInfo(issueEndboardInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("deleteIssueboardReply")
	public ModelAndView deleteIssueboardReply(Map<String, String> params,
											String isu_end_no, 
											ModelAndView andView) 
													throws Exception{
		params.put("isu_end_no", isu_end_no);
		issue_end_service.deleteIssueEndBoardInfo(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
}
