package kr.or.ddit.login.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//http://localhost/login/loginForm.do
@Controller
@RequestMapping("/login/")
public class LoginController {
	
	private SendEmailJoin sendEmail = new SendEmailJoin();
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("loginForm")
	public Model loginForm(Model model, 
							Map<String, String> publicKeyMap,
							HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		publicKeyMap= CryptoGenerator.getGeneratePairKey(session);
		session.setAttribute("publicKeyMap", publicKeyMap);
		
		return model;
	}
	
	@RequestMapping("ktlogin")
	public Model ktlogin(Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("loginCheck")
	public String loginCheck(@RequestParam String mem_id,
							@RequestParam String mem_pass,
							HttpServletRequest request,
							Map<String, String> params,
							MemberVO memberInfo,
							HttpSession session,
							String message,
							String encryptID,
							String encryptPWD,
							RedirectAttributes redirectAttributes) throws Exception{
		
		encryptID = request.getParameter("mem_id");
		encryptPWD = request.getParameter("mem_pass");
		
		mem_id = CryptoGenerator.decryptRSA(session, encryptID);
		mem_pass = CryptoGenerator.decryptRSA(session, encryptPWD);
		
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);  
		
		memberInfo = service.memberInfo_all(params);
		
		String path = "";
		
		if(memberInfo != null){
			if(memberInfo.getMem_grade().equals("user")){
				session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
				path = "redirect:/user/project/pro_main.do";
			}else if(memberInfo.getMem_grade().equals("admin")){
				session.setAttribute("LOGIN_ADMININFO", memberInfo);
				path = "redirect:/admin/member/memberList.do";
			}
		}else{
			redirectAttributes.addFlashAttribute("message","아이디나 비밀번호를 확인해주세요.");
			path = "redirect:/login/loginForm.do";
		}
		
		return path;
	}
	
	
	@RequestMapping("kakao/kakaologinCheck")
	public String kakaologinCheck(@RequestParam String kt_id,
								Map<String, String> params,
								MemberVO memberKtInfo,
								HttpSession session) throws Exception{
		
		params.put("mem_id", kt_id);
		
		memberKtInfo = service.memberKtInfo(params);
		
		String path = "";
		
		if(memberKtInfo != null){
			session.setAttribute("LOGIN_MEMBERINFO", memberKtInfo);
			path = "redirect:/user/project/pro_main.do";
		}else{
//			message=URLEncoder.encode("회원이 아닙니다.","UTF-8");
			path = "redirect:/login/kakao/joinForm.do?kt_id=" + kt_id;
		}
		
		return path;
	}
	
	@RequestMapping("kakao/joinForm")
	public Model joinForm(Model model,
						@RequestParam String kt_id) throws Exception{
		
		model.addAttribute("kt_id", kt_id);
		
		return model;
	}
	
	@RequestMapping("kakao/nickCheck")
	public ModelAndView nickCheck(String mem_nick, Map<String, String> params,
								ModelAndView andView){
		
		params.put("mem_nick", mem_nick);
		
		MemberVO memberInfo = this.service.ktnickInfo(params);
		
		if(memberInfo != null){
			andView.addObject("result", "중복된 닉네임입니다.");
			andView.setViewName("jsonConvertView");
		}else{
			andView.addObject("result", "사용가능한 닉네임입니다.");
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}
	
	@RequestMapping("kakao/mailCheck")
	public ModelAndView mailCheck(String mem_mail, Map<String, String> params,
								ModelAndView andView){
		
		params.put("mem_mail", mem_mail);
		
		MemberVO memberInfo = this.service.ktmailInfo(params);
		
		if(memberInfo != null){
			andView.addObject("result", "중복된 이메일입니다.");
			andView.setViewName("jsonConvertView");
		}else{
			andView.addObject("result", "사용가능한 이메일입니다.");
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}
	
	@RequestMapping("kakao/insertKt")
	public String insertKt(MemberVO memberKt, RedirectAttributes redirectAttributes){
		
		this.service.insertKt(memberKt);
		
		redirectAttributes.addFlashAttribute("message","회원가입이 완료되었습니다.");
		
		return "redirect:/login/loginForm.do";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/login/loginForm.do";
	}
	
	@RequestMapping("findIDForm")
	public Model findIDForm(Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("findID")
	public ModelAndView findID(String mem_mail, 
								Map<String, String> params,
								ModelAndView andView) throws Exception{
		
		params.put("mem_mail", mem_mail);
		
		MemberVO memberInfo = this.service.memberInfo_id(params);
		
		if(memberInfo != null){
			andView.addObject("result", memberInfo);
			// application-views.xml 내 선언된 빈의 id.
			andView.setViewName("jsonConvertView");
		}else{
			andView.addObject("result", "등록된 이메일이 아닙니다.");
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}
	
	@RequestMapping("findPWForm")
	public Model findPWForm(Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("findPW")
	public ModelAndView findPW(	String mem_id,
								String mem_mail, 
								Map<String, String> params,
								Map<String, String> params1,
								HttpSession session,
								ModelAndView andView) throws Exception{
		
		params.put("mem_id", mem_id);
		params.put("mem_mail", mem_mail);
		
		MemberVO memberInfo = this.service.memberInfo_pw(params);
		
		if(memberInfo != null){
			andView.addObject("result", "등록된 이메일로 임시비밀번호를 발송하였습니다.");
			andView.setViewName("jsonConvertView");
			
			sendEmail.sendEmailJoin(mem_mail);
			params1.put("mem_id", mem_id);
			params1.put("mem_pass", sendEmail.tmp);
			this.service.updateMember_pw(params1);
		}else{
			andView.addObject("result", "가입된 회원이 아닙니다.");
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}
	
}
