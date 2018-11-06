package webProject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.List;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/resumedemo")
public class resumedemo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uemail = (String) session.getAttribute("email");
		int uid = Integer.parseInt(session.getAttribute("id").toString());
		String connectionurl = "jdbc:mysql://localhost:3306/project";
		String connectionusername = "root";
		String connectionpassword = "";
		Connection connection = null;
		try {
			Document doc = new Document(new Rectangle(PageSize.A4));
		    PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream("E:\\demo2.pdf"));
			//PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream("C:\\Users\\Robin\\eclipse-workspace\\DBdemo\\WebContent\\assets\\demo.pdf"));
			
			doc.open();
			Font font1 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 21f, Font.NORMAL, BaseColor.BLUE);
			Font f2 = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 12f, Font.NORMAL, BaseColor.GRAY);
			Font f3 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 22f, Font.NORMAL, BaseColor.GREEN);
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionurl, connectionusername, connectionpassword);
			Statement stat1 = connection.createStatement();
			ResultSet rs1 = stat1.executeQuery("SELECT * FROM basic WHERE uemail = '"+uemail+"'");
			Statement stat2 = connection.createStatement();
			ResultSet rs2 = stat2.executeQuery("SELECT * FROM education WHERE uemail = '"+uemail+"'");
			
			Statement stat3 = connection.createStatement();
			ResultSet rs3 = stat3.executeQuery("SELECT * FROM education_undergraduate WHERE uemail = '"+uemail+"'");
			Statement stat4 = connection.createStatement();
			ResultSet rs4 = stat4.executeQuery("SELECT * FROM skills WHERE uemail = '"+uemail+"'");
			Statement stat5 = connection.createStatement();
			ResultSet rs5 = stat5.executeQuery("SELECT * FROM hobbies WHERE uemail = '"+uemail+"'");
			Statement stat6 = connection.createStatement();
			ResultSet rs6 = stat6.executeQuery("SELECT * FROM work WHERE uemail = '"+uemail+"'");
	
	
			if (rs1.next()) {
				String email = rs1.getString("email");
				String first = rs1.getString("first");
				String last = rs1.getString("last");
				String phone = rs1.getString("phone");
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
				java.sql.Date date = rs1.getDate("dob");
				 doc.add(new Paragraph(first+" "+last, font1));
				 doc.add(new Paragraph(email+"\n", f2));
				 doc.add(new Paragraph("+91 "+phone+"\n", f2));
				doc.add(new Paragraph("Delhi", f2));
			
				
					
				
			}
			else {
				out.print("values not found in basic table");
			}
			rs1.close();
			
			if (rs3.next()) {
				String college = rs3.getString("college");
				String percentage = rs3.getString("percentage");
				SimpleDateFormat sdf3 = new SimpleDateFormat("MMMM yyyy");
			    java.sql.Date date3 = rs3.getDate("college_yoc");
			    String course = rs3.getString("course");
				doc.add(new Paragraph("Education\n", f3));
			    doc.add(new Paragraph(course));
				doc.add(new Paragraph(college, f2));
				doc.add(new Paragraph("Year of Completion: "+sdf3.format(date3)+"\n\n", f2));
		
				
			}
			else {
				out.println("values not found in education_undergraduate table");
			}
			rs3.close();
			if (rs2.next()) {
				SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM yyyy");
				java.sql.Date date2 = rs2.getDate("tenyoc");
				String ten_marks = rs2.getString("tenmarks");
				String ten_school = rs2.getString("tenschool");
				String twelve_marks = rs2.getString("twelvemarks");
				String twelve_school = rs2.getString("twelveschool");
				java.sql.Date date3 = rs2.getDate("twelveyoc");
				doc.add(new Paragraph("12th(Senior Secondary)"));
				doc.add(new Paragraph(twelve_school, f2));
				doc.add(new Paragraph("Percentage: "+twelve_marks, f2));
				doc.add(new Paragraph("Year Of Completion: "+sdf2.format(date3)+"\n\n", f2));
				doc.add(new Paragraph("10th(Senior Secondary)"));
				doc.add(new Paragraph(ten_school, f2));
				doc.add(new Paragraph("Percentage: "+ten_marks, f2));
				doc.add(new Paragraph("Year Of Completion: "+sdf2.format(date2)+"\n\n", f2));
				
				
				
			}
			else {
				out.println("values not found in education table");
			}
			if (rs6.next()) {
				String company = rs6.getString("company_name");
				String position = rs6.getString("position");
				SimpleDateFormat sdf4 = new SimpleDateFormat("MMM yyyy");
				java.sql.Date date4 = rs6.getDate("start_date");
				java.sql.Date date5 = rs6.getDate("end_date");
				doc.add(new Paragraph("Work Experience\n", f3));
				doc.add(new Paragraph(position));
				doc.add(new Paragraph("Company: "+company, f2));
				doc.add(new Paragraph(sdf4.format(date4)+"-"+sdf4.format(date5)+"\n\n", f2));
				
				
			}
			doc.add(new Paragraph("Skills\n", f3));
				
			while(rs4.next()) {
				String skills = rs4.getString("skill");
					
				List list = new List();
				list.add(skills);
				doc.add(list);
			}
			rs4.close();
			rs4.close();
			doc.add(new Paragraph("Hobbies\n", f3));	
			while(rs5.next()) {
				String hobby = rs5.getString("hobbies");
				
				doc.add(new Paragraph(hobby));
				doc.close();
				//out.print("resume created");
			}
			rs5.close();
		
			
			
			
			
		}
		catch(Exception e) {
			out.print(e);
		}
		//out.println("outside");
	File f = new File("E:\\demo2.pdf");
	FileInputStream fis = new FileInputStream(f);
	try {
		PreparedStatement stat = connection.prepareStatement("INSERT INTO resume(uemail, file) VALUES (?, ?)");
		stat.setString(1, uemail);
		stat.setBinaryStream(2, fis, (int)fis.available());
		int i = stat.executeUpdate();
		if (i!=0) {
	     RequestDispatcher rd = request.getRequestDispatcher("view_resume.jsp");
	     rd.forward(request, response);
		}
		else {
			out.println("Image not inserted");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		
	}		
        
        
}
