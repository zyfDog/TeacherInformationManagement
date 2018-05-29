package edu.cqut.hr.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.cqut.hr.dao.TeacherDao;
import edu.cqut.hr.model.Teacher;
import edu.cqut.hr.service.TeacherService;

/**
 * Servlet implementation class TeacherAction
 */
@WebServlet("/TeacherAction")
public class TeacherAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TeacherService teacherService;
    
    public void init() {
		teacherService = new TeacherDao();
	}
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherAction() {
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
	 * @throws UnsupportedEncodingException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, UnsupportedEncodingException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		
		if("Insert".equals(type)) {
			try {
				Insert(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		else if("delete".equals(type)) {
			try {
				delete(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		else if("update".equals(type)) {
			try {
				update(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		
		try {
			queryAll(request, response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
	
	public void Insert(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Integer id = Integer.valueOf(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(request.getParameter("birthday"));
		
		Float salary = Float.valueOf(request.getParameter("salary"));
		String college = request.getParameter("college");
		String major = request.getParameter("major");
		
		Teacher T = new Teacher(id,name,sex,birthday,salary,college,major);
	    teacherService.addTeacher(T);
	}
	
	public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Integer id = Integer.valueOf(request.getParameter("id"));
		teacherService.deleteTeacher(id);
	}
	
	public void update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Integer id = Integer.valueOf(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(request.getParameter("birthday"));
		
		Float salary = Float.valueOf(request.getParameter("salary"));
		String college = request.getParameter("college");
		String major = request.getParameter("major");
		
		Teacher T = new Teacher(id,name,sex,birthday,salary,college,major);
	    teacherService.updateTeacher(T);
	}
	
	public void queryAll(HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<Teacher> teachers = teacherService.queryAll();
		request.setAttribute("Teachers", teachers);
	}
	

}
