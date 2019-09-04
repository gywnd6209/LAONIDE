package kr.or.ddit.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/member/")
public class MemberContorollerUser {
	
	@Autowired
	private MemberService service;
	
	private SendEmail sendMail = new SendEmail();
	
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
	
	@RequestMapping("memberForm")
	public void memberForm(){
		
	}
	
	@RequestMapping("insertMember")
	public String insertMember(MemberVO memberInfo, HttpServletRequest request, RedirectAttributes redirectAttributes){
		
		this.service.insertMember(memberInfo);
		
		redirectAttributes.addFlashAttribute("message","회원가입이 완료되었습니다.");
		
		
		return "redirect:/login/loginForm.do";
	}
	
	
	@RequestMapping("memberProfile")
	public ModelMap memberInfo(ModelMap modelMap, String mem_id,
			@RequestParam(required=false, defaultValue="null입니다요") String mem_pass,
			Map<String, String> params){
		System.out.println("혹시 먼저 들어가나?? : " + mem_id);
		params.put("mem_id", mem_id);
		
		System.out.println("들어가니?? : "+mem_id);
		
		MemberVO memberInfo = this.service.memberInfo(params);
		modelMap.addAttribute("memberProfile", memberInfo);
		
		return modelMap;
	}
	
	@RequestMapping("updateMember")
	public String updateMember(String mem_id, Map<String, String> params,
									MemberVO memberInfo,
									ModelAndView andView){
		params.put("mem_id", mem_id);
		
		System.out.print("왔다갔니???업데이트, update ::: ");
		System.out.println(mem_id);
		
		this.service.updateMember(memberInfo);
		
		andView.addObject("andView","정상적으로 변경 되었습니다.");
//		andView.setViewName("jsonConvertView");
//		return andView;
		
		return "redirect:/user/member/memberProfile.do?mem_id="+memberInfo.getMem_id();
	}
	
	@RequestMapping("updateProfile")
	public ModelAndView updateProfile(MemberVO memberInfo,
										ModelAndView andView) throws Exception{
//		params.put("mem_id", memberInfo.getMem_id());
//		params.put("mem_nick", memberInfo.getMem_nick());
//		params.put("mem_mail", memberInfo.getMem_mail());
//		params.put("lang_code", memberInfo.getLang_code());
//		params.put("lang_level", memberInfo.getLang_level());
		
//		System.out.println("Profile 에서 받아온 아이ㄴ디 : "+memberInfo.getMem_id());
		
		this.service.updateProfile(memberInfo);
		andView.addObject("andView", "정상적으로 변경 되었습니다.");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
//	@RequestMapping("deleteMember")
//	public String deleteMember(Map<String, String> params, String mem_id){
//		params.put("mem_id", mem_id);
//		System.out.println("딜리트트트");
//		this.service.deleteMember(params);
//		
//		return "redirect:/user/member/memberProfile.do";
//	}
	
	@RequestMapping("deleteMember")
	public String deleteMember(String mem_id, Map<String, String> params,
									ModelAndView andView){
		params.put("mem_id", mem_id);
		
		System.out.println("왔다감???딜리트틑");
		System.out.println(mem_id);
		
		this.service.deleteMember(params);
		
//		andView.addObject("result","정상적으로 탈퇴 되었습니다.");
//		andView.setViewName("jsonConvertView");
//		return andView;
		
		return "redirect:/${pageContext.request.contextPath}/login/loginForm.do";
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
