package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resume_graduation")
public class resume_graduation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String college_name = request.getParameter("college_name");
		String under_percentage = request.getParameter("under_percentage");
		String college_complete = request.getParameter("college_complete");
		String course_name = request.getParameter("course");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			java.util.Date udate3 = sdf.parse(college_complete);
			long l3 = udate3.getTime();
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			 PreparedStatement pst = connection.prepareStatement("INSERT INTO education_undergraduate (uemail, college, percentage, college_yoc, course) VALUES (?, ?, ?, ?, ?)");
	    	 pst.setString(1, uemail);
	    	 pst.setString(2, college_name);
	    	 pst.setString(3, under_percentage);
	    	 pst.setDate(4, new java.sql.Date(l3));
	    	 pst.setString(5, course_name);
	    	 int i = pst.executeUpdate();
	    	 if (i!=0) {
	    		 RequestDispatcher rd = request.getRequestDispatcher("resume_work.jsp");
	    		 rd.forward(request, response);
	    		
	    	 }
	    	 else {
	    		 RequestDispatcher rd = request.getRequestDispatcher("resume_graduation.jsp");
	    		 rd.forward(request, response);
	    	 }
	    	
			
		}
		catch(Exception e) {
			
			out.print(e);
		}
		
		
	}

}
