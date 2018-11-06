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

@WebServlet("/deleteQRCode1")
public class deleteQRCode1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("id");
		String uemail = request.getParameter("uemail");
		 try {
			    DBConnection conn = new DBConnection();
				Connection connection = conn.getConnection();
				PreparedStatement ps = connection.prepareStatement("DELETE FROM qr_code2 WHERE id = '"+id+"' AND uemail = '"+uemail+"'");
				int i = ps.executeUpdate();
				if (i!=0) {
					String msg = "QRCode deleted Successfully";
					session.setAttribute("msg", msg);
					RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
					rs.forward(request, response);
				}
				else {
					out.println("some problem");
				}
				
		 }
		 catch(Exception e) {
			 out.print(e);
		 }
	
	}

	

}
