package edu.cqut.hr.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;  
        HttpServletResponse httpServletResponse = (HttpServletResponse)response;  
        httpServletRequest.setCharacterEncoding("utf-8");  
        httpServletResponse.setCharacterEncoding("utf-8");  
        
        String path = httpServletRequest.getContextPath();  
        String username = (String)httpServletRequest.getSession().getAttribute("username");  
        String url = httpServletRequest.getRequestURI();
        System.out.println(url);
        if(username == null && !url.equals(path + "/login.jsp") && !url.equals(path + "/LoginAction") && (
        		!(url.contains(".css") || url.contains(".js") || url.contains(".png")|| url.contains(".jpg")))){  
            System.out.println("zzz");
        	httpServletResponse.sendRedirect(path + "/login.jsp");  
            return;
        }  
        chain.doFilter(request, response);  
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
