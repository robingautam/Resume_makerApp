package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   PrintWriter out = response.getWriter();
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String bio = request.getParameter("bio");
		HttpSession session = request.getSession();
		String uemail = session.getAttribute("email").toString();
		DBConnection conn = new DBConnection();
		Connection connection = conn.getConnection();
		out.print("connection established");
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE bio SET bio = ? WHERE uemail = ?");
				
			ps.setString(1, bio);
			ps.setString(2, uemail);
		    int j =  ps.executeUpdate();
		    if (j!=0) {
		    	//out.println("value has been updated");
		    	//response.sendRedirect("setting.jsp");
		    	RequestDispatcher rd = request.getRequestDispatcher("setting.jsp");
		    	rd.forward(request, response);
		    }
		    else {
		    	out.println("value not updated");
		    }
			
	
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
