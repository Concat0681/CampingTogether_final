package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.PatternMatchUtils;


public class LoginFilter implements Filter {

	private static final String[] blacklist = {"*Update*", "/update*", "/insert*", "*Insert*", "/delete*", "*Delete*", "*Write*"};
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String requestURI = httpRequest.getRequestURI();
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		if(isLoginCheckPath(requestURI)) {
			HttpSession session = httpRequest.getSession(false);
			if (session == null || session.getAttribute("login") == null) {
				//로그인으로 redirect
				httpRequest.setAttribute("title", "잘못된 경로");
				httpRequest.setAttribute("msg", "로그인이 필요합니다");
				httpRequest.setAttribute("icon", "error");
				httpRequest.setAttribute("loc", "/loginFrm.do");
				RequestDispatcher view = httpRequest.getRequestDispatcher("/WEB-INF/views/common/modalAlert.jsp");
				view.forward(httpRequest, httpResponse);
				return; //여기가 중요, 미인증 사용자는 다음으로 진행하지 않고 끝!
			}
		}
		chain.doFilter(request, response); 
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	private boolean isLoginCheckPath(String requestURI) {
 		return PatternMatchUtils.simpleMatch(blacklist, requestURI);
	 }
	
}
