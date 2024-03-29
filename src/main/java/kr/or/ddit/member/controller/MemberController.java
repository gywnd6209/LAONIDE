package kr.or.ddit.member.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.MemberVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/member/")
public class MemberController {
	
	private SendEmail sendMail = new SendEmail();
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("sendCode")
	public ModelAndView sendCode(
								String mem_id,
								String mem_mail, 
								Map<String, String> params,
								HttpSession session,
								ModelAndView andView) throws Exception{
		andView.addObject("result", "등록된 이메일로 인증코드를 발송하였습니다.");
//		andView.setViewName("jsonConvertView");
		
		sendMail.sendEmailJoin(mem_mail);
		params.put("mem_id", mem_id);
		params.put("mem_pass", sendMail.tmp);
		
		andView.addObject("keycode", sendMail.tmp);
		System.out.println(sendMail.tmp);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("insertMember")
	public String insertMember(MemberVO memberInfo, HttpServletRequest request, RedirectAttributes redirectAttributes){
		
		this.service.insertMember(memberInfo);
		
		redirectAttributes.addFlashAttribute("message","회원가입이 완료되었습니다.");
		
		
		return "redirect:/login/loginForm.do";
	}
	
	
	@RequestMapping("memberList")
	public Model memberList(Map<String, String> params
							, Model model
							, String search_keyword, String search_keycode
							, String startCount, String endCount
							, HttpServletResponse response
							, HttpServletRequest request
							) throws SQLException{
		
		String currentPage = request.getParameter("currentPage");
		if (currentPage==null||request.equals("")) {
			currentPage = "1";
		}
		
		search_keyword = request.getParameter("search_keyword");
		search_keycode = request.getParameter("search_keycode");
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<MemberVO> memberList = this.service.memberList(params);
		
		model.addAttribute("memberList", memberList);
		
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagingUtiles", pagingUtiles);
		model.addAttribute("pageHtmls", pagingUtiles.getPageHtmls());
		
		return model;
	}
	
	@RequestMapping("memberForm")
	public void memberForm(){
		
	}
	
	/**
	 * 회원 상세정보 보기
	 * @param mem_id
	 * @param andView
	 * @param params
	 * @param search_keyword
	 * @param search_keycode
	 * @param currentPage
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memberView")
	public ModelAndView memberdInfo(@RequestParam String mem_id, ModelAndView andView,
									Map<String, String> params, String search_keyword,
									String search_keycode, String currentPage,
									HttpServletRequest request, HttpServletResponse response
									) throws Exception{
		params.put("mem_id", mem_id);
				
		MemberVO memberInfo = this.service.memberInfo(params);
		
		if (search_keyword != null) {
			search_keyword = URLEncoder.encode(search_keyword, "UTF-8");
		}
		
//		System.out.println("인포인포 : "+ memberInfo);
//		System.out.println("인포인포 id: "+ memberInfo.getMem_id());
		
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("currentPage", currentPage);
		
		return andView;
	}
	
	/**
	 * 회원정보 수정
	 * @param memberInfo
	 * @return
	 */
//	@RequestMapping("updateMember")
//	public String updateMember(MemberVO memberInfo){
//		this.service.updateMember(memberInfo);
//		System.out.println("여기오니? 업데이트 : " + memberInfo);
//		
//		return "redirect:/admin/member/memberList.do";
//	}
	
	@RequestMapping("updateMember")
	public String updateMember(String mem_id, Map<String, String> params,
									MemberVO memberInfo,
									ModelAndView andView){
		params.put("mem_id", mem_id);
		
//		System.out.print("왔다갔니???업데이트, update ::: ");
//		System.out.println(mem_id);
		
		this.service.updateMember(memberInfo);
		
		andView.addObject("andView","정상적으로 변경 되었습니다.");
//		andView.setViewName("jsonConvertView");
//		return andView;
		
		return "redirect:/admin/member/memberView.do?mem_id="+memberInfo.getMem_id();
	}
	
	@RequestMapping("updatePass")
	public ModelAndView updatePass(ModelAndView andView, String mem_id
								, Map<String, String> params
//								, MemberVO memberInfo
								){
//		String flag = "";
		
//		this.service.updatePass(memberInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	/**
	 * 회원 탈퇴
	 * @param params
	 * @param mem_id
	 * @return
	 */
	@RequestMapping("deleteMember")
	public String deleteMember(Map<String, String> params, String mem_id){
		params.put("mem_id", mem_id);
		
		this.service.deleteMember(params);
		
		return "redirect:/admin/member/memberList.do";
	}
	
	/**
	 * 아이디 중복검사
	 * @param mem_id
	 * @param params
	 * @param andView
	 * @return
	 */
	@RequestMapping("memberForm/idChk")
	public ModelAndView idChk(String mem_id, Map<String, String> params,
								ModelAndView andView){
		params.put("mem_id", mem_id);
		System.out.println("아이디 : " + mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);
		
		if (memberInfo != null) {
			andView.addObject("result", "이미 사용중인 ID입니다.");
			andView.setViewName("jsonConvertView");
		}else {
			andView.addObject("result", "사용 가능한 ID입니다.");
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}
	
	/**
	 * 닉네임 중복검사
	 * @param mem_nick
	 * @param params
	 * @param andView
	 * @return
	 */
	@RequestMapping("memberForm/nickChk")
	public ModelAndView nickChk(String mem_nick, Map<String, String> params,
								ModelAndView andView){
		params.put("mem_nick", mem_nick);
		MemberVO vo = new MemberVO();
		MemberVO memberInfo = this.service.nickChk(params);
		
		System.out.println(memberInfo);
		
		if (memberInfo != null) {
			andView.addObject("result", "이미 사용중인 별명입니다.");
			andView.setViewName("jsonConvertView");
		}else if(memberInfo == null){
			System.out.println("닉네임 : "+vo.getMem_nick());
			andView.addObject("result", "사용 가능한 별명입니다.");
			andView.setViewName("jsonConvertView");
		}
		return andView;
	}
	
	
	/**
	 * 체크박스에 체크된 회원을 일괄탈퇴
	 * @param checkbox
	 * @param params
	 * @param andView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("deleteChecked")
	public ModelAndView deleteChecked(String checkbox, 
									Map<String, String> params,
									ModelAndView andView) throws Exception{
		String[] mem_id_arr = checkbox.split(",");
		System.out.println(mem_id_arr[0]);

		for (int i = 0; i < mem_id_arr.length; i++) {
			params.put("checkbox", mem_id_arr[i]);
			this.service.deleteChecked(params);
		}
		
		andView.addObject("result", "정상적으로 삭제되었습니다.");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
}
