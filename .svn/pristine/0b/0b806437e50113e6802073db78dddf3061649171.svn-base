package kr.or.ddit.filter;

import java.io.IOException;
import java.net.URLEncoder;
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

public class UserLoginCheckFilter implements Filter {

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
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String requestURI = request.getRequestURI(); 
		
    	if(memberInfo == null ){
    		message = URLEncoder.encode("잘못된 접근입니다.", "UTF-8");
    		response.sendRedirect("/login/loginForm.do?message=" + message);
//    			servletRequest.getRequestDispatcher("/admin/adminLoginForm.do?message=" + message).forward(servletRequest, servletResponse); 
    	} else{
			filterChain.doFilter(servletRequest, servletResponse);
    	}

        
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
