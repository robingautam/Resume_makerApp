package webProject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@WebServlet("/generate_qr2")
public class generate_qr2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		String url = request.getParameter("url");
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("id");
		String uemail = session.getAttribute("email").toString();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		 BitMatrix bitMatrix = null;
			try {
				bitMatrix = new QRCodeWriter().encode(url, BarcodeFormat.QR_CODE, 200, 200);
			} catch (WriterException e) {
				// TODO Auto-generated catch block
			  out.print(e);
			}
			 
			String filepath = "E:\\file5.png";
			File img = new File(filepath);
			FileOutputStream fos = new FileOutputStream(img);
			MatrixToImageWriter.writeToStream(bitMatrix, "gif", fos);
			fos.close();
			out.print("qrcode generated succesfully");
			FileInputStream fis = new FileInputStream(filepath);
			 try {
				 DBConnection conn = new DBConnection();
					Connection connection = conn.getConnection();
					PreparedStatement ps = connection.prepareStatement("INSERT INTO qr_code1(uid, uemail, url, image, date) VALUES (?, ?, ?, ?, ?)");
				ps.setInt(1, uid);
				ps.setString(2, uemail);
				ps.setString(3, url);
				ps.setBinaryStream(4, fis);
				ps.setTimestamp(5, date);
				int i = ps.executeUpdate();
				if (i!=0) {
					//out.println("value inserted succesfully");
					
					response.setContentType("text/html");
					out.println("<html><head></head><body><a href='download_qr2?id="+url+"&&uemail="+uemail+"'>Click here </a> to download file</body></html>");
					
				}
				else {
					out.println("value not inserted in database");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
	    	
		
	
	}

}
