package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;

@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		 String AlgoName = "AES";
	     String keyString = "Desire_SecretKey";
	     String email = (String) session.getAttribute("email");
	     String old_password = request.getParameter("old-pwd");
	     String new_password = request.getParameter("new-pwd");
	     String re_password = request.getParameter("re-pwd");
	    
	     
	     try {
	    	 SecretKeySpec keyspec = new SecretKeySpec(keyString.getBytes(), AlgoName);
	    	 Cipher cipher = Cipher.getInstance(AlgoName);
	    	 cipher.init(Cipher.ENCRYPT_MODE, keyspec);
	    	 byte[] encrypted = cipher.doFinal(old_password.getBytes());
	    	 String password = Base64.encodeBase64String(encrypted);
	    	 old_password = password;
	    	 DBConnection conn = new DBConnection();
	 		Connection connection = conn.getConnection();
	 		 Statement st = connection.createStatement();
	    	 ResultSet rs = st.executeQuery("SELECT * FROM user WHERE email = '"+email+"' AND password = '"+old_password+"'");
	    	 if (rs.next()) {
	    		 if (new_password.equals(re_password)) {
	    		 SecretKeySpec keyspec2 = new SecretKeySpec(keyString.getBytes(), AlgoName);
	    		 Cipher cipher2 = Cipher.getInstance(AlgoName);
	    		 cipher2.init(Cipher.ENCRYPT_MODE, keyspec2);
	    		 byte[] encrypted2 = cipher2.doFinal(new_password.getBytes());
	    		 String password2 = Base64.encodeBase64String(encrypted2);
	    		 new_password = password2;
	    		 PreparedStatement pst = connection.prepareStatement("UPDATE user SET password = '"+new_password+"' WHERE email = '"+email+"'");
	    		 int i= pst.executeUpdate();
	    		 if (i!=0) {
	    			 RequestDispatcher rd = request.getRequestDispatcher("passwordChanged.jsp");
	    			 rd.forward(request, response);
	    		 }
	    		 }
	    		 else {
	    			 response.setContentType("text/html");
	    			 String msg = "<html><head></head><body><p style='color: red;'>Two Password did not match</p></body></html>";
	    			  session.setAttribute("msg", msg);
	    			  RequestDispatcher rd = request.getRequestDispatcher("setting.jsp");
		    			 rd.forward(request, response);
	    			 
	    		 }
	    		 
	    	 }
	    	 else {
	    		 String msg2 = "<html><head></head><body><p style='color: red;'>Please Enter Correct Old Password</p></body></html>";
	    	session.setAttribute("msg2", msg2);
	    	RequestDispatcher rd = request.getRequestDispatcher("setting.jsp");
			 rd.forward(request, response);
	    		 
	    	 }
	    	
	    	 
	     }
	     catch(Exception e) {
	    	 
	     }
	    
		
	}

}
