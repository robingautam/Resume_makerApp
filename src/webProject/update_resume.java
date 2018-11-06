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

@WebServlet("/update_resume")
public class update_resume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String first_name = request.getParameter("fname");
		String last_name = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String ten_school_name = request.getParameter("school_name");
		//float ten_marks = float request.getParameter("ten_marks");
		String ten_marks = request.getParameter("percentage");
		String ten_yoc = request.getParameter("ten_complete");
		String twelve_school_name = request.getParameter("twelve_school_name");
		String twelve_percentage = request.getParameter("twelve_percentage");
		String twelve_complete = request.getParameter("twelve_complete");
		String college_name = request.getParameter("college_name");
		String under_percentage = request.getParameter("under_percentage");
		String college_complete = request.getParameter("college_complete");
		String course_name = request.getParameter("course");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String company = request.getParameter("comp_name");
		String position = request.getParameter("position");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
	
		try {
			java.util.Date udate = sdf.parse(dob);
	        long l = udate.getTime();
	        java.util.Date udate1 = sdf.parse(ten_yoc);
			long l1 = udate1.getTime();
			java.util.Date udate2 = sdf.parse(twelve_complete);
			long l2= udate2.getTime();
			java.util.Date udate3 = sdf.parse(college_complete);
			long l3 = udate3.getTime();
			java.util.Date udate4 = sdf.parse(start_date);
			long l4 = udate4.getTime();
			java.util.Date udate5 = sdf.parse(end_date);
			long l5 = udate5.getTime();
			
			
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			// PreparedStatement st = connection.prepareStatement("INSERT INTO basic (uid, uemail, email, first, last, phone, dob) VALUES (?, ?, ?, ?, ?, ?, ?)");
    	 PreparedStatement st = connection.prepareStatement("UPDATE basic SET uid=?, uemail=?,email=?,first = ?,last=?,phone=?,dob = ? WHERE uemail = '"+uemail+"'");
    	    
    	 st.setInt(1, uid);
    	 st.setString(2, uemail);
    	 st.setString(3, email);
    	 st.setString(4, first_name);
    	 st.setString(5, last_name);
    	 st.setString(6, phone);
    	 st.setDate(7, new java.sql.Date(l));
    	 int i = st.executeUpdate();
    	 PreparedStatement pst = connection.prepareStatement("UPDATE education set uid=?, uemail=?, tenyoc=?, tenmarks=?, tenschool=?, twelvemarks=?, twelveschool=?, twelveyoc=? WHERE uemail = '"+uemail+"'");
    	 pst.setInt(1, uid);
    	 pst.setString(2, uemail);
    	 pst.setDate(3, new java.sql.Date(l1));
    	 pst.setString(4, ten_marks);
    	 pst.setString(5, ten_school_name);
    	 pst.setString(6, twelve_percentage);
    	 pst.setString(7, twelve_school_name);
    	 pst.setDate(8, new java.sql.Date(l2));
    	 int j = pst.executeUpdate();
    	 PreparedStatement pst1 = connection.prepareStatement("UPDATE education_undergraduate SET uemail=?, college=?, percentage=?, college_yoc=?, course=? WHERE uemail = '"+uemail+"'");
    	 pst1.setString(1, uemail);
    	 pst1.setString(2, college_name);
    	 pst1.setString(3, under_percentage);
    	 pst1.setDate(4, new java.sql.Date(l3));
    	 pst1.setString(5, course_name);
    	 int k = pst.executeUpdate();
    	 PreparedStatement stat = connection.prepareStatement("UPDATE  work SET uid=?, uemail=?, company_name=?, position=?, start_date=?, end_date=? WHERE uemail = '"+uemail+"'");
			stat.setInt(1, uid);
			stat.setString(2, uemail);
			stat.setString(3, company);
			stat.setString(4, position);
			stat.setDate(5, new java.sql.Date(l4));
			stat.setDate(6, new java.sql.Date(l5));
			int work = stat.executeUpdate();
    	
    	if (i!=0 && j!=0 && k!=0 && work!=0) {
    		String msg = "Your Resume Has been Updated Successfully";
			session.setAttribute("updatemsg", msg);
			
    		/*RequestDispatcher rd = request.getRequestDispatcher("view_resume.jsp");
    		rd.forward(request, response);*/
			response.sendRedirect("resumedemo1");
    	}
    	else {
    		out.print("value not updated");
    	}
    	
			
		}
		catch(Exception e) {
			
		}
		
		
	}

}
