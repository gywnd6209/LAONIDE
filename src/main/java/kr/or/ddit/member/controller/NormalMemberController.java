package kr.or.ddit.member.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/")
public class NormalMemberController {
	
	@Autowired
	private MemberService service;
	
	private SendEmail sendMail = new SendEmail();
	
	@RequestMapping("provision")
	public void provision(){
		
	}
	
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
	
	
	@RequestMapping("memberForm")
	public void memberForm(){
		System.out.println("잘 오니????????");
	}
	
	@RequestMapping("memberView")
	public ModelMap memberInfo(ModelMap modelMap, String mem_id,
			@RequestParam(required=false, defaultValue="null입니다요") String mem_pass,
			Map<String, String> params){
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);
		modelMap.addAttribute("memberView", memberInfo);
		
		return modelMap;
	}
	
	@RequestMapping("updateMember")
	public String updateMember(MemberVO memberInfo){
		
		this.service.updateMember(memberInfo);
		
		return "redirect:/admin/member/memberList.do";
	}
	
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
}
