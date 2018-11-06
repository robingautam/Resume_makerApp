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

/**
 * Servlet implementation class resume_hobbies
 */
@WebServlet("/resume_hobbies")
public class resume_hobbies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String[] hobbies = request.getParameterValues("hobbies");
		
		for (String hobby: hobbies) {
			try {
				DBConnection conn = new DBConnection();
				Connection connection = conn.getConnection();
				 PreparedStatement pst = connection.prepareStatement("INSERT INTO hobbies(uid, uemail, hobbies) VALUES (?, ?, ?)");
		    	 pst.setInt(1, uid);
		    	 pst.setString(2, uemail);
		    	 pst.setString(3, hobby);
		    	 int i = pst.executeUpdate();
		    	 if ( i!=0) {
		    		/* RequestDispatcher rd = request.getRequestDispatcher("resumedemo");
		    		 rd.forward(request, response);*/
		    		 response.sendRedirect("resumedemo");
		    		
		    		// out.print("your resume generated succesfully");
		    		
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
