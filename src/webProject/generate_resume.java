package webProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/generate_resume")
public class generate_resume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		try {
			DBConnection conn = new DBConnection();
			Connection connection = conn.getConnection();
			Statement stat1 = connection.createStatement();
			ResultSet rs1 = stat1.executeQuery("SELECT * FROM basic WHERE uemail = '"+uemail+"'");
			Statement stat2 = connection.createStatement();
			ResultSet rs2 = stat2.executeQuery("SELECT * FROM education WHERE uemail = '"+uemail+"'");
			
			Statement stat3 = connection.createStatement();
			ResultSet rs3 = stat3.executeQuery("SELECT * FROM education_undergraduate WHERE uemail = '"+uemail+"'");
			Statement stat4 = connection.createStatement();
			ResultSet rs4 = stat4.executeQuery("SELECT * FROM skills WHERE uemail = '"+uemail+"'");
			Statement stat5 = connection.createStatement();
			ResultSet rs5 = stat4.executeQuery("SELECT * FROM hobbies WHERE uemail = '"+uemail+"'");
	
			if (rs1.next()) {
				String email = rs1.getString("email");
				String first = rs1.getString("email");
				String last = rs1.getString("email");
				String phone = rs1.getString("email");
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
				java.sql.Date date = rs1.getDate("dob");
				
			}
			else {
				out.print("values not found in basic table");
			}
			if (rs2.next()) {
				SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
				java.sql.Date date2 = rs1.getDate("tenyoc");
				String ten_marks = rs1.getString("tenmarks");
				String ten_school = rs1.getString("tenschool");
				String twelve_marks = rs1.getString("twelvemarks");
				String twelve_school = rs1.getString("twelveschool");
				java.sql.Date date3 = rs1.getDate("twelveyoc");
			}
			else {
				out.println("values not found in education table");
			}
			if (rs3.next()) {
				String college = rs4.getString("college");
				String percentage = rs4.getString("percenatge");
				SimpleDateFormat sdf3 = new SimpleDateFormat("dd/MM/yyyy");
			    java.sql.Date date3 = rs4.getDate("college_yoc");
			    String course = rs4.getString("course");
			}
			else {
				out.println("values not found in education_undergraduate table");
			}
			while(rs4.next()) {
				String skills = rs4.getString("skill");
				
			}
			while(rs5.next()) {
				String hobby = rs5.getString("hobbies");
				
			}
			
			
			
			
		}
		catch(Exception e) {
			out.print(e);
		}
	}

}
