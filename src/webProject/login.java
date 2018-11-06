package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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




@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String TABLE_NAME = "user";
		 String AlgoName = "AES";
	     String keyString = "Desire_SecretKey";
	     
	     String email = request.getParameter("email");
	     String pwd = request.getParameter("pwd");
	     try {
	    	 SecretKeySpec keyspec = new SecretKeySpec(keyString.getBytes(), AlgoName);
	    	  Cipher cipher = Cipher.getInstance(AlgoName);
	    	  cipher.init(Cipher.ENCRYPT_MODE, keyspec);
	    	  byte[] encrypted = cipher.doFinal(pwd.getBytes());
	    	  String password = Base64.encodeBase64String(encrypted);
	    	  pwd = password;
	    	  DBConnection conn = new DBConnection();
	  		Connection connection = conn.getConnection();
	    	  Statement st = connection.createStatement();
	    	 ResultSet rs = st.executeQuery("SELECT * FROM user WHERE email = '"+email+"' AND password = '"+pwd+"'");
	    	 if (rs.next()) {
	    		 String name = rs.getString("name");
	    		 int uid = rs.getInt("id");
	    		 //String email = rs.getString("email");
	    		 HttpSession session = request.getSession();
	    		 session.setAttribute("name", name);
	    		 session.setAttribute("email", email);
	    		 session.setAttribute("id", uid);
	    		 Statement st3 = connection.createStatement();
	    		 ResultSet rs2 = st3.executeQuery("SELECT * FROM bio WHERE uemail = '"+email+"'");
	    		 rs2.next();
	    		 String bio = rs2.getString("bio");
	    		 session.setAttribute("bio", bio);
	    		 response.sendRedirect("home.jsp");
	    		 
	    	 }
	    	 else {
	    		 response.setContentType("text/html");
	    		 String err_msg = "<html><head></head><body><p style='color: red;'>Invalid Username or Password</p></body></html>";
	    		 HttpSession sess = request.getSession();
	    		 sess.setAttribute("pas_err_msg", err_msg);
	    		 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	    		 rd.forward(request, response);
	    	 }
	    	 
	     }
	     catch(Exception e) {
	    	 out.println(e);
	     }
	     
	       
	}

}
