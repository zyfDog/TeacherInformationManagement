package edu.cqut.hr.action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.cqut.hr.dao.LoginDao;
import edu.cqut.hr.service.LoginService;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private LoginService loginservice;
	private static final long serialVersionUID = 1L;
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println("username = " + username);  
        System.out.println("pswd = " + password); 

		boolean flag = loginservice.login("'"+username+"'", password);

		System.out.println("username = " + username);  
        System.out.println("pswd = " + password);  
        
		if(flag)
		{
			request.getSession().setAttribute("username", username);  
			request.getRequestDispatcher("table.jsp").forward(request, response);;
		}
		else
			response.sendRedirect("login.jsp");
	}
	
	public void init() {
		loginservice = new LoginDao();
	}
}
