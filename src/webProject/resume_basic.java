package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resume_basic")
public class resume_basic extends HttpServlet {
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
		/*String ten_school_name = request.getParameter("school_name");
		//float ten_marks = float request.getParameter("ten_marks");
		String ten_marks = request.getParameter("percentage");
		String ten_yoc = request.getParameter("ten_complete");
		String twelve_school_name = request.getParameter("twelve_school_name");
		String twelve_percentage = request.getParameter("twelve_percentage");
		String twelve_complete = request.getParameter("twelve_complete");
		String college_name = request.getParameter("college_name");
		String under_percentage = request.getParameter("under_percentage");
		String college_complete = request.getParameter("college_complete");
		String post_college_name = request.getParameter("post_college_name");
		String post_percentage = request.getParameter("post_percentage");
		String post_college_complete = request.getParameter("post_college_complete");
		String company = request.getParameter("comp_name");
		String position = request.getParameter("position");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill3 = request.getParameter("skill3");
		String skill4 = request.getParameter("skill4");
		String skill5 = request.getParameter("skill5");*/
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date udate = sdf.parse(dob);
	        long l = udate.getTime();
	       /* java.util.Date yoc_date = sdf.parse(ten_yoc);
	        long l1 = yoc_date.getTime();
	        java.util.Date college_yoc = sdf.parse(college_complete);
	        long l2 = college_yoc.getTime();

	        java.util.Date post_college_yoc = sdf.parse(post_college_complete);
	        long l3 = post_college_yoc.getTime();
	        java.util.Date date_start = sdf.parse(start_date);
	        long l4 = date_start.getTime();

	        java.util.Date date_end = sdf.parse(end_date);
	        long l5 = date_end.getTime();*/



		
	        DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			 PreparedStatement st = connection.prepareStatement("INSERT INTO basic (uid, uemail, email, first, last, phone, dob) VALUES (?, ?, ?, ?, ?, ?, ?)");
    	/* PreparedStatement pst = connection.prepareStatement("INSERT INTO education (uid, uemail, tenyoc, tenmarks, tenschool, twelvemarks, twelveschool, twelveyoc) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    	 PreparedStatement ps = connection.prepareStatement("INSERT INTO education_graduate (uid, uemail, college, college_yoc, college_marks, post_college, post_marks, post_yoc) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    	 PreparedStatement stat = connection.prepareStatement("INSERT INTO work (uid, uemail, company_name, position, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?)");
    	 PreparedStatement stat1 = connection.prepareStatement("INSERT INTO skills (uid, uemail, skill1, skill2, skill3, skill4, skill5) VALUES (?, ?, ?, ?, ?, ?, ?)");*/
    	 st.setInt(1, uid);
    	 st.setString(2, uemail);
    	 st.setString(3, email);
    	 st.setString(4, first_name);
    	 st.setString(5, last_name);
    	 st.setString(6, phone);
    	 st.setDate(7, new java.sql.Date(l));
    	 int i = st.executeUpdate();
    	/* pst.setInt(1, uid);
    	 pst.setString(2, uemail);
    	 pst.setDate(3, new java.sql.Date(l1));
    	 pst.setString(4, ten_marks);
    	 pst.setString(5, ten_school_name);
    	 pst.setString(6, twelve_percentage);
    	 pst.setString(7, twelve_school_name);
    	 pst.setString(8, twelve_complete);
    	 int j = pst.executeUpdate();
    	 ps.setInt(1, uid);
    	 ps.setString(2, uemail);
    	 ps.setString(3, college_name);
    	 ps.setDate(4, new java.sql.Date(l2));
    	 ps.setString(5, under_percentage);
    	 ps.setString(6, post_college_name);
    	 ps.setString(7, post_percentage);
    	 ps.setDate(8, new java.sql.Date(l3));
    	 int k = ps.executeUpdate();
    	 stat.setInt(1, uid);
    	 stat.setString(2, uemail);
    	 stat.setString(3, company);
    	 stat.setString(4, position);
    	 stat.setDate(5, new java.sql.Date(l4));
    	 stat.setDate(6, new java.sql.Date(l5));
    	 int m = stat.executeUpdate();
    	 stat1.setInt(1, uid);
    	 stat1.setString(2, uemail);
    	 stat1.setString(3, skill1);
    	 stat1.setString(4, skill2);
    	 stat1.setString(5, skill3);
    	 stat1.setString(6, skill4);
    	 stat1.setString(7, skill5);
    	 int n = stat1.executeUpdate();*/
    	 if (i!=0) {
          RequestDispatcher rd = request.getRequestDispatcher("resume_school.jsp");
          rd.forward(request, response);
          }
    	 else {
    		 out.print("data not inserted");
    	 }
    	 
		}
		catch(Exception e) {
			out.println(e);
		}
		
		 
	}

}
