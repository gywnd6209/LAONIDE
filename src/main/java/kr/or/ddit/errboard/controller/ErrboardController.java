package kr.or.ddit.errboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.alramboard.service.IAlramboardService;
import kr.or.ddit.aop.Loggable;
import kr.or.ddit.crewInfo.service.ICrewInfoService;
import kr.or.ddit.errboard.service.IErrboardService;
import kr.or.ddit.solboard.service.ISolboardService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.AlramBoardVO;
import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ErrboardVO;
import kr.or.ddit.vo.SolboardVO;

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
@RequestMapping("/user/issuetracker/errboard/")
public class ErrboardController {
	@Loggable
	private Logger logger;
	@Autowired
	private IErrboardService service;
	@Autowired
	private ICrewInfoService crew_service;
	@Autowired
	private ISolboardService sol_service;
	// 은혜
	@Autowired
	private IAlramboardService alramboardService;
	
	@RequestMapping("errboardList")
	public Model projectboardList(Model model, 
									Map<String, String> params,
									HttpServletRequest request,
									@RequestParam String pro_name
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
		
		List<ErrboardVO> errboardList = this.service.errboardList(params);
		model.addAttribute("errboardList", errboardList);
		
		model.addAttribute("pro_name", pro_name);
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("errboardForm")
	public Model errboardForm(Map<String, String> params, 
									Model model, 
									CrewInfoVO crewInfo,
									@RequestParam String pro_code) throws Exception{
		
		params.put("pro_code", pro_code);
		
		model.addAttribute("pro_code", pro_code);
		model.addAttribute("crewList", crew_service.crewList(params));
		
		return model;
	}
	
	@RequestMapping("errboardView")
	public ModelAndView errboardView (@RequestParam String err_no,
											@RequestParam String rnum,
											@RequestParam String search_keyword,
											@RequestParam String search_keycode,
											@RequestParam String currentPage,
											@RequestParam String pro_code,
											String pro_name,
											Map<String, String> params,
											Map<String, String> replyPrarams,
											HttpServletRequest request,
											ErrboardVO errboardInfo,
											CrewInfoVO crewInfo,
											SolboardVO errboardReplyList,
											ModelAndView andView) throws Exception{
		
		// 게시글 정보 불러오기
		params.put("err_no", err_no);
		params.put("rnum", rnum);
		
//		if(search_keyword !=null){
//			search_keyword=URLEncoder.encode(search_keyword,"UTF-8");
//		}
		
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
		}
		params.put("pro_code", pro_code);
		errboardInfo = service.errboardInfo(params);
		
		// 해당 댓글 가져오기
		
		replyPrarams.put("err_no", err_no);
		
		// 변수 넣어주기
		andView.addObject("pro_code", pro_code);
		andView.addObject("pro_name",pro_name);
		andView.addObject("errboardInfo", errboardInfo);
		andView.addObject("crewList", crew_service.crewList(params));
		andView.addObject("errboardReplyList", sol_service.solboardList(replyPrarams));
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
		
	}
	
	@RequestMapping("insertErrboard")
	public String insertErrboard(ErrboardVO errboardInfo, 
			@RequestParam String pro_code,
			@RequestParam String err_priority,
			@RequestParam String pro_name, RedirectAttributes redirect) throws Exception{
				
		if(pro_code == null || pro_code.equals("")){
			pro_code = "1";
			errboardInfo.setPro_code(pro_code);
		}
		errboardInfo.setErr_rank(err_priority);
		String sel_err_no = service.insertErrBoardInfo(errboardInfo);
		
		//스케줄 등록용
		service.insertSchedule(errboardInfo);
		
		System.out.println("입력이 되었는가 ::: " +errboardInfo);
		
		AlramBoardVO alramboardInfo = new AlramBoardVO();
		alramboardInfo.setBo_no(sel_err_no);
		alramboardInfo.setAlram_content(errboardInfo.getErr_title());
		alramboardInfo.setPro_code(pro_code);
		alramboardInfo.setMem_id(errboardInfo.getMem_id());
		alramboardInfo.setAlram_code("ERROR");
		alramboardInfo.setPri_code(errboardInfo.getErr_rank());
		alramboardInfo.setBo_writer(errboardInfo.getErr_writer());
		alramboardService.insertAlramboardInfo(alramboardInfo);
		
		redirect.addAttribute("pro_name", pro_name); 
		
		return "redirect:/user/issuetracker/errboard/errboardList.do?pro_code="+pro_code;
	}
	
	@RequestMapping("updateErrboard")
	public String updateErrboard(ErrboardVO errboardInfo, 
									@RequestParam String pro_code, 
									@RequestParam String err_priority,
									@RequestParam String pro_name,
									RedirectAttributes redirect) throws Exception{
		
		errboardInfo.setErr_rank(err_priority);
		service.updateErrBoardInfo(errboardInfo);
		redirect.addAttribute("pro_name", pro_name); 
		
		return "redirect:/user/issuetracker/errboard/errboardList.do?pro_code="+pro_code;
	}
	
	@RequestMapping("deleteErrboard")
	public String deleteErrboard(Map<String, String> params,
								String err_no, @RequestParam String pro_code,
								@RequestParam String pro_name,
								RedirectAttributes redirect) throws Exception{
		params.put("err_no", err_no);
		service.deleteErrBoardInfo(params);
		redirect.addAttribute("pro_name", pro_name); 
		
		return "redirect:/user/issuetracker/errboard/errboardList.do?pro_code="+pro_code;
	}

	// 댓글 등록, 수정, 삭제
	// 등록, 수정, 삭제 = ajax
	@RequestMapping("insertErrboardReply")
	public ModelAndView insertErrboardReply(SolboardVO solboardInfo,
											ErrboardVO errboardInfo,
											@RequestParam String sol_ok,
											ModelAndView andView) 
													throws Exception{
		String flag="";
		flag = sol_service.insertSolBoardInfo(solboardInfo);
		
		
		errboardInfo.setErr_no(solboardInfo.getErr_no());
		
		if(sol_ok.equals("Y")){
			errboardInfo.setErr_end_ok(sol_ok);
			errboardInfo.setErr_no(solboardInfo.getErr_no());
			service.updateErrBoardInfo_end(errboardInfo);
		}
		
		if(flag.equals("")){
			andView.addObject("result", "fail");
		}else{
			andView.addObject("result", "success");
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateErrboardReply")
	public ModelAndView updateErrboardReply(SolboardVO solboardInfo,
											ModelAndView andView) 
													throws Exception{
		
		String flag="";
		sol_service.updateSolBoardInfo(solboardInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("deleteErrboardReply")
	public ModelAndView deleteErrboardReply(Map<String, String> params,
											String sol_no, 
											ModelAndView andView) 
													throws Exception{
		params.put("sol_no", sol_no);
		sol_service.deleteSolBoardInfo(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
}
