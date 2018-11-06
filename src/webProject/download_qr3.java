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

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/download_qr3")
public class download_qr3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static  final int BUFFER_SIZE = 4096;
	
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("full_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String organization = request.getParameter("organization");
		String fax = request.getParameter("fax");
		//int phone = Integer.parseInt(request.getParameter("phone"));
	     String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("id");
		
		
		try {
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("SELECT image FROM qr_code3 WHERE uid = '"+uid+"' AND name = '"+name+"' AND email = '"+email+"' AND address = '"+address+"' AND organisation='"+organization+"' AND fax='"+fax+"' AND phone='"+phone+"' AND city = '"+city+"' AND country = '"+country+"'");
			if (rs.next()) {
				String filename = "QRcode.png";
				Blob blob = rs.getBlob("image");
				 InputStream inputStream = blob.getBinaryStream();
	                int fileLength = inputStream.available();
	                ServletContext context = getServletContext();
	                String mimeType = context.getMimeType(filename);
	                if (mimeType == null) {        
	                    mimeType = "application/octet-stream";
	                }
	                response.setContentType(mimeType);
	                response.setContentLength(fileLength);
	                String headerKey = "Content-Disposition";
	                String headerValue = String.format("attachment; filename=\"%s\"", filename);
	                response.setHeader(headerKey, headerValue);
	                OutputStream outStream = response.getOutputStream();
	                 
	                byte[] buffer = new byte[BUFFER_SIZE];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outStream.write(buffer, 0, bytesRead);
	                }
	                inputStream.close();
	                outStream.close(); 
	 
			}
			else {
				System.out.println("file not found");
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
     
	}

}
