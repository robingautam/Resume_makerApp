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

@WebServlet("/resume_work")
public class resume_work extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String company = request.getParameter("comp_name");
		String position = request.getParameter("position");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate = sdf.parse(start_date);
			long l2 = udate.getTime();
			java.util.Date udate1 = sdf.parse(end_date);
			long l3 = udate1.getTime();
			
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			PreparedStatement stat = connection.prepareStatement("INSERT INTO work(uid, uemail, company_name, position, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?)");
			stat.setInt(1, uid);
			stat.setString(2, uemail);
			stat.setString(3, company);
			stat.setString(4, position);
			stat.setDate(5, new java.sql.Date(l2));
			stat.setDate(6, new java.sql.Date(l3));
			int i = stat.executeUpdate();
			if (i!=0) {
				RequestDispatcher rd = request.getRequestDispatcher("resume_skills.jsp");
				rd.forward(request, response);
				
			}
			else {
				out.println("value not inserted");
			}
			
			
		}
		catch(Exception e) {
			
		}
		
		        
        
        
		
		
	}

}








