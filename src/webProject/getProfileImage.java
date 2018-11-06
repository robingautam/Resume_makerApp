package webProject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/getProfileImage")
public class getProfileImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static  final int BUFFER_SIZE = 4096;   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		HttpSession session = request.getSession();
		try {
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("SELECT picture FROM profile WHERE uid = '"+uid+"'");
			if (rs.next()) {
				
				Blob imageBlob = rs.getBlob("picture");
				 InputStream inputStream = imageBlob.getBinaryStream();
		          response.setContentType("image/gif");
		          OutputStream outStream = response.getOutputStream();
	                 
	                byte[] buffer = new byte[BUFFER_SIZE];
	                int bytesRead = -1;
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outStream.write(buffer, 0, bytesRead);
	                }
	                session.setAttribute("profile", "image found");
	                
	                inputStream.close();
	                outStream.close(); 

			}
			else {
				
			}
			
	
	}
		catch(Exception e) {
			
		}
	}
}

	


