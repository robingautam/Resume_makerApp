package webProject;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/profilePicture")
@MultipartConfig

public class profilePicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		InputStream fis = null;
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("id");
		String uemail = session.getAttribute("email").toString();
		


		try {
			Part filepart = request.getPart("image");
			if (filepart != null) {
				fis = filepart.getInputStream();
			}
			else {
				out.print("please choose image");
			}
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
			PreparedStatement ps = conn.prepareStatement("UPDATE profile SET picture = ? WHERE uemail = ?");
			if (fis != null) {
				ps.setBlob(1, fis);
				ps.setString(2, uemail);
			}
			else {
				out.println("please choose image");
			}
			
			int i = ps.executeUpdate();
			if (i!=0) {
				//out.println("image successfully uploaded");
				response.sendRedirect("setting.jsp");
			}
			else {
				out.print("image not uploaded");
			}
		}
		catch(Exception e) {
			out.println(e);
		}
		

		
	}

}
