package kr.or.ddit.filter;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.vo.MemberVO;

public class LoginCheckFilter implements Filter {

	String noFilterUri = "";
	String message = "";
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, 
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession(); 
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_ADMININFO");
		String requestURI = request.getRequestURI(); 
		
		message = URLEncoder.encode("관리자가 아닙니다.", "UTF-8");
		
		List<String> publicMap = new ArrayList<String>();

	
	
//		if(!requestURI.contains("adminLogin")){
        	if(memberInfo == null || (!memberInfo.getMem_grade().equals("admin"))){
        		message = URLEncoder.encode("관리자로 로그인해주세요.", "UTF-8");
        		response.sendRedirect("/login/loginForm.do?message=" + message);
//    			servletRequest.getRequestDispatcher("/admin/adminLoginForm.do?message=" + message).forward(servletRequest, servletResponse); 
        	} else{
        		if(!memberInfo.getMem_grade().equals("admin")){
        			message = URLEncoder.encode("관리자가 아닙니다!!", "UTF-8");
        			
            		response.sendRedirect("/login/loginForm.do?message=" + message);
        		}else{
        			filterChain.doFilter(servletRequest, servletResponse);
        		}
        	}
//        }else{
//        	filterChain.doFilter(servletRequest, servletResponse);
//        }
        
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
