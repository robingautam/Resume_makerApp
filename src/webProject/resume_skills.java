package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resume_skills")
public class resume_skills extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String[] skill = request.getParameterValues("skill");
		
		for (String skills: skill) {
			try {
				DBConnection conn = new DBConnection();
				Connection connection = conn.getConnection();
				 PreparedStatement pst = connection.prepareStatement("INSERT INTO skills(uid, uemail, skill) VALUES (?, ?, ?)");
		    	 pst.setInt(1, uid);
		    	 pst.setString(2, uemail);
		    	 pst.setString(3, skills);
		    	 int i = pst.executeUpdate();
		    	 if ( i!=0) {
		    		 RequestDispatcher rd = request.getRequestDispatcher("resume_hobbies.jsp");
		    		 rd.forward(request, response);
		    		
		    	 }
		    	 else {
		    		 out.println("value not inserted");
		    	 }
		    	 
				
			}
			catch(Exception e) {
			   out.println(e);	
			}
			
		}
	}

}
