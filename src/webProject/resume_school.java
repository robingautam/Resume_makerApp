package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resume_school")
public class resume_school extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		
		String ten_school_name = request.getParameter("school_name");
		//float ten_marks = float request.getParameter("ten_marks");
		String ten_marks = request.getParameter("percentage");
		String ten_yoc = request.getParameter("ten_complete");
		String twelve_school_name = request.getParameter("twelve_school_name");
		String twelve_percentage = request.getParameter("twelve_percentage");
		String twelve_complete = request.getParameter("twelve_complete");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date udate = sdf.parse(ten_yoc);
			long l = udate.getTime();
			java.util.Date udate2 = sdf.parse(twelve_complete);
			long l2= udate2.getTime();
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			PreparedStatement pst = connection.prepareStatement("INSERT INTO education (uid, uemail, tenyoc, tenmarks, tenschool, twelvemarks, twelveschool, twelveyoc) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
	    	 pst.setInt(1, uid);
	    	 pst.setString(2, uemail);
	    	 pst.setDate(3, new java.sql.Date(l));
	    	 pst.setString(4, ten_marks);
	    	 pst.setString(5, ten_school_name);
	    	 pst.setString(6, twelve_percentage);
	    	 pst.setString(7, twelve_school_name);
	    	 pst.setDate(8, new java.sql.Date(l2));
	    	 int j = pst.executeUpdate();
	    	 if (j!=0) {
	    		 RequestDispatcher rd = request.getRequestDispatcher("resume_graduation.jsp");
	    		 rd.forward(request, response);
	    	 }
		} 
		catch (ParseException | SQLException e) {
			out.println(e);
		}
        
    
		

	}

}
