package kr.or.ddit.filter;

import java.security.Principal;

import javax.servlet.http.HttpSession;

public class PrincipalWithSession implements Principal {
	private final HttpSession session;
	
	public PrincipalWithSession(HttpSession session){
		this.session = session;
	}
	
	public HttpSession getSession() {
		return session;
	}

	@Override
	public String getName() {
		// HttpSession ID 반환
		return this.session.getId();
	}

}
