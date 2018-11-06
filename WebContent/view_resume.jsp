<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Resume</title>
<meta name="vieport" content="width=device-width initial-state=1">
      
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
     <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
     <script src="bootstrap/js/bootstrap.js"></script>
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">


</head>
<style>
  body {
   background-color: #ddd;
  }
</style>
<body>
 <%@ page import="java.io.*"%>
   <%@ page import="java.sql.*"%>
   <%@ page import="com.mysql.*"%>
   <%@ page import="java.util.*"%>
   <%@ page import="java.text.*"%>
   <%@ page import="javax.servlet.*"%>
   <%@ page import="javax.servlet.http.*"%>
   <%@ page import="javax.servlet.http.HttpSession"%>
   <%@ page language="java"%>
   <%@ page session="true"%>
   <%@ page import="java.sql.*"%>
  
<% 
String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");
String biography = (String)session.getAttribute("bio");
String profile = (String)session.getAttribute("profile");
int uid = (int) session.getAttribute("id");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
%>
 <%
   String connectionurl = "jdbc:mysql://localhost:3306/project";
  	String connectionusername = "root";
  	String connectionpassword = "";
  	Connection connection;
    
   Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(connectionurl, connectionusername, connectionpassword);
	Statement stat1 = connection.createStatement();
	ResultSet rs1 = stat1.executeQuery("SELECT * FROM basic WHERE uemail = '"+email+"'");
	Statement stat2 = connection.createStatement();
	ResultSet rs2 = stat2.executeQuery("SELECT * FROM education WHERE uemail = '"+email+"'");
	
	Statement stat3 = connection.createStatement();
	ResultSet rs3 = stat3.executeQuery("SELECT * FROM education_undergraduate WHERE uemail = '"+email+"'");
	Statement stat4 = connection.createStatement();
	ResultSet rs4 = stat4.executeQuery("SELECT * FROM skills WHERE uemail = '"+email+"'");
	Statement stat5 = connection.createStatement();
	ResultSet rs5 = stat5.executeQuery("SELECT * FROM hobbies WHERE uemail = '"+email+"'");
	Statement stat6 = connection.createStatement();
	ResultSet rs6 = stat6.executeQuery("SELECT * FROM work WHERE uemail = '"+email+"'");
	String updatemsg = (String)session.getAttribute("updatemsg"); 

   
   
   
   
   %>

<nav class="nav navbar-inverse navbar-fixed-top" >
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#robin">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
    </div>
            <div class="collapse navbar-collapse" id="robin">
    <ul class="nav navbar-nav">
        <li ><a href="home.jsp">Home</a></li>
            <li ><a href="resume_basic.jsp">Resume</a></li>
            <li><a href="qrcode1.jsp">QRCode</a></li>
            <li><a href="#">PDFGenerator</a></li>
            <li><a href="#">Contact Us</a></li>
        
        </ul>
            <ul class="nav navbar-nav navbar-right">
           <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="<% out.print(name); %>" src="getProfileImage?uid=<% out.print(uid);%>" width="20px" height="22px" style=""><% if (name != null){out.print(name);} else {out.print("Login");} %><span class="caret"></span></a>
        <ul class="dropdown-menu  navbar-right">
            <li style="text-align: center;"><a href="profile.jsp">Profile</a></li>
            <li style="text-align: center;"><a href="setting.jsp">Settings</a></li>
            <li style="text-align: center;"><a href="logout.jsp">Log out</a></li>
            
            </ul>
        </li>
        
    </ul>
        </div>
        </div>
    
    </nav><br><br><br><br>
    <div class="container">
      <% if (updatemsg!=null){ %>
   <div class="alert alert-info alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="margin-right: 20px;">&times;</a>
    <strong>Information</strong> <% out.print(updatemsg); %>
  </div>
<%} session.removeAttribute("updatemsg");  %>
   
    <div class="well well-lg" style="background-color: white;">
    <%
    if (rs1.next()) {
		String email1 = rs1.getString("email");
		String first = rs1.getString("first");
		String last = rs1.getString("last");
		String phone = rs1.getString("phone");
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date date = rs1.getDate("dob");
    
    %>
    <p style="color: red;font-size: 25px;"><%  out.println(first+" "+last); %></p>
    <p style="color: #ddd;font-size: 20px;"><%  out.println(email1); %></p>
    <p style="color: #ddd;font-size: 20px;"><%  out.println(phone); %></p><br> <%} %>
    <%
    if (rs3.next()) {
		String college = rs3.getString("college");
		String percentage = rs3.getString("percentage");
		SimpleDateFormat sdf3 = new SimpleDateFormat("MMMM yyyy");
	    java.sql.Date date3 = rs3.getDate("college_yoc");
	    String course = rs3.getString("course");
    %>
    <h1 style="color: blue;">Education</h1>
    <p><% out.print(course); %></p>
     <p style="color: #ddd;"><% out.print(college); %></p>
     <p style="color: #ddd;">Year Of Completion: <% out.print(sdf3.format(date3)); %></p><br><% } %>
     <% 
     if (rs2.next()) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM yyyy");
			SimpleDateFormat sdf3 = new SimpleDateFormat("MMMM yyyy");
			java.sql.Date date2 = rs2.getDate("tenyoc");
			String ten_marks = rs2.getString("tenmarks");
			String ten_school = rs2.getString("tenschool");
			String twelve_marks = rs2.getString("twelvemarks");
	   		String twelve_school = rs2.getString("twelveschool");
	   		java.sql.Date date3 = rs2.getDate("twelveyoc");		
     
     %>
     <p>12th(Senior Secondary)</p>
     <p style="color: #ddd;"><% out.println(twelve_school);%></p>
     <p style="color: #ddd;">Percentage: <% out.println(twelve_marks);%></p>
     <p style="color: #ddd;">Year of Completion: <% out.println(sdf2.format(date3));%></p><br>
      <p>10th(Secondary)</p>
     <p style="color: #ddd;"><% out.println(ten_school);%></p>
     <p style="color: #ddd;">Percentage: <% out.println(ten_marks);%></p>
     <p style="color: #ddd;">Year of Completion: <% out.println(sdf3.format(date2));%></p><br><%} %>
    <%
    if (rs6.next()) {
		String company = rs6.getString("company_name");
		String position = rs6.getString("position");
		SimpleDateFormat sdf4 = new SimpleDateFormat("MMM yyyy");
		java.sql.Date date4 = rs6.getDate("start_date");
		java.sql.Date date5 = rs6.getDate("end_date");
	
    %> 
    <h2 style="color: blue;">Work Experience</h2>
    <p><% out.print(position); %></p>
    <p style="color: #ddd;">Company: <% out.print(company); %></p>
    <p style="color: #ddd;"><% out.print(sdf4.format(date4)+"-"+sdf4.format(date5)); %></p><br><%} %>
    <%
    if (rs4.next()) {
		%>
		<h2 style="color: blue;">Skills</h2><% } %>
	<%	
	while(rs4.next()) {
		String skills = rs4.getString("skill"); 
    %>
    <p><% out.println(skills); %></p><% } %>
    <%
    if (rs5.next()){
    %>
    <h2 style="color: blue;">Hobbies</h2><% } %>
    <%
    while(rs5.next()){
    	String hobby = rs5.getString("hobbies");
    %>
    <p><% out.print(hobby); %></p><% } %>
    
    </div>
    <a href="download_resume" class="btn btn-success">Download resume</a>
    <a href="update_resume.jsp" class="btn btn-success">Edit Resume</a>
   
    </div>


</body>
</html>