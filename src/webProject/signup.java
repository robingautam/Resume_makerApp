package webProject;

import java.io.File;
import java.io.FileInputStream;
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


@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
 		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String TABLE_NAME = "user";
		 String AlgoName = "AES";
	     String keyString = "Desire_SecretKey";
	        
	     String name = request.getParameter("name");
	     String email = request.getParameter("email");
	     String pwd = request.getParameter("pwd");
	     // it is used for getting defualt profile pic image
	     File f = new File("E:\\boyprofile.png");
	     FileInputStream fis = new FileInputStream(f);
	     
	      try {
	    	  SecretKeySpec keyspec = new SecretKeySpec(keyString.getBytes(), AlgoName);
	    	  Cipher cipher = Cipher.getInstance(AlgoName);
	    	  cipher.init(Cipher.ENCRYPT_MODE, keyspec);
	    	  byte[] encrypted = cipher.doFinal(pwd.getBytes());
	    	  String password = Base64.encodeBase64String(encrypted);
	    	  DBConnection conn = new DBConnection();
	  		Connection connection = conn.getConnection();
	  		 Statement st = connection.createStatement();
	    	 ResultSet rst = st.executeQuery("SELECT email FROM user WHERE email = '"+email+"'");
	  		 if (rst.next()) {
	    		 response.setContentType("text/html");
	    		 String err_msg = "<html><head></head><body><p style='color: red;'>Sorry Email Already Taken</p></body></html>";
	    		
	    		 session.setAttribute("sorry", err_msg);
	    		 RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
	    		 rd.forward(request, response);
	    		 
	    		 
	    	 }
	    	 else {
	    	 
	    	 PreparedStatement stat = connection.prepareStatement("INSERT INTO "+TABLE_NAME+"(name, email, password) VALUES (?, ?, ?)");
	    	
	    	 stat.setString(1, name);
	    	 stat.setString(2, email);
	    	 stat.setString(3, password);
	 
	    	 int i = stat.executeUpdate();
	    	 if (i!=0) {
	    		 Statement st1 = connection.createStatement();
	    		 ResultSet rs = st1.executeQuery("SELECT * FROM user WHERE email = '"+email+"'");
	    		 if (rs.next()) {
	    			 int uid = rs.getInt("id");
	    			  session.setAttribute("name", name);
		    		  session.setAttribute("email", email);
		    		  session.setAttribute("id", uid);
		    		  PreparedStatement stat1 = connection.prepareStatement("INSERT INTO bio(uid, uemail, bio) VALUES (?, ?, ?)");
		    		  stat1.setInt(1, uid);
		    		  stat1.setString(2, email);
		    		  stat1.setString(3, "edit your bio");
		    		  stat1.executeUpdate();
		    		  // it is used for getting biography of an user and set the session for the biography
		    		  Statement st2 = connection.createStatement();
		    		  ResultSet rst2 = st2.executeQuery("SELECT * FROM bio WHERE uemail = '"+email+"'");
		    		  rst2.next();
		    		  String bio = rst2.getString("bio");
		    		  session.setAttribute("bio", bio);
		    		  // it is used for inserting default profile pic of the user on signup
		    		  PreparedStatement pst3 = connection.prepareStatement("INSERT INTO profile (uid, uemail, picture) VALUES (?, ?, ?)");
		    		  pst3.setInt(1, uid);
		    		  pst3.setString(2, email);
		    		  pst3.setBinaryStream(3, fis, fis.available());
		    		  pst3.executeUpdate();
		    		
		    		  
		    		  response.sendRedirect("home.jsp");
	    		 }
	    		  
	    	 }
	    	 else {
	    		 out.print("some problem");
	    	 }
	    	 connection.close();
	    	 
	     }
	      }
	     
	     catch(Exception e) {
	    	 out.println(e);
	    	 
	     }
	     
	}

}
