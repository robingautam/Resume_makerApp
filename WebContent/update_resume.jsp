<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Resume</title>
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
 <div class="background" style="background-color: white;">
    <h2 style="text-align: center;color:red;padding-top: 15px;">Basic Information</h2>
    <form action="update_resume" style="margin-left: 15px;margin-right: 10px;" method="post">
    <%  if (rs1.next()) {
		String email2 = rs1.getString("email");
		String first = rs1.getString("first");
		String last = rs1.getString("last");
		String phone = rs1.getString("phone");
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date date = rs1.getDate("dob");
	 %>
    <div class="form-group">
      <label for="email">First Name:</label>
      <input type="text" class="form-control" id="email"  name="fname" value="<% out.print(first); %>" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Last Name:</label>
      <input type="text" class="form-control" id="pwd"  name="lname" value="<% out.print(last); %>" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Email:</label>
      <input type="email" class="form-control" id="pwd"  name="email" value="<% out.print(email2); %>" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Phone:</label>
      <input type="text" class="form-control" id="pwd"  name="phone"  value="<% out.print(phone); %>" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Date Of Birth:</label>
      <input type="date" class="form-control" id="pwd" name="dob" value="<% out.println(sdf1.format(date)); %>" required="">
    </div>
    <% } %>
    <h2 style="text-align: center;color:red;padding-top: 15px;">Education</h2>
    <%  
    if (rs2.next()) {
		SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM yyyy");
		java.sql.Date date2 = rs2.getDate("tenyoc");
		String ten_marks = rs2.getString("tenmarks");
		String ten_school = rs2.getString("tenschool");
		String twelve_marks = rs2.getString("twelvemarks");
		String twelve_school = rs2.getString("twelveschool");
		java.sql.Date date3 = rs2.getDate("twelveyoc");
	
    %>
     <div class="form-group">
      <label for="email">Class 10:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Board Name" value="<% out.print(ten_school); %>" name="school_name" required=""><br>
      <input type="text" class="form-control" id="email" placeholder="Percentage" value="<% out.print(ten_marks); %>" name="percentage" required=""><br>
      <label for="email">Year of Completion:</label>
      <input type="date" class="form-control" id="email" placeholder="Enter Board Name" name="ten_complete" value="<% out.print(sdf2.format(date2)); %>" required=""><br>
    </div>
   <div class="form-group">
      <label for="email">Class 12:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Board Name" value="<% out.print(twelve_school); %>" name="twelve_school_name" required=""><br>
      <input type="text" class="form-control" id="email" placeholder="Percentage" value="<% out.print(twelve_marks); %>" name="twelve_percentage" required=""><br>
      <label for="email">Year of completion:</label>
      <input type="date" class="form-control" id="email" placeholder="Enter Board Name" value="<% out.print(sdf2.format(date3)); %>" name="twelve_complete" required="">
    </div><br><% } %>
    <div class="form-group">
    <% if (rs3.next()) {
		String college = rs3.getString("college");
		String percentage = rs3.getString("percentage");
		SimpleDateFormat sdf3 = new SimpleDateFormat("MMMM yyyy");
	    java.sql.Date date3 = rs3.getDate("college_yoc");
	    String course = rs3.getString("course");
	 %>
      <label for="email">Undergraduate:</label>
      <input type="text" class="form-control" id="email" placeholder="College or University Name" value="<% out.println(college); %>" name="college_name" >
      <label for="email">Course Name:</label>
      <input type="text" class="form-control" id="email" placeholder="Course Name" value="<% out.println(course); %>" name="course" >
       <label for="email">Percentage:</label>
      <input type="text" class="form-control" id="email" placeholder="percentage" value="<% out.println(percentage); %>" name="under_percentage" >
       <label for="email">Year of completion:</label>
      <input type="date" class="form-control" id="email" name="college_complete" value="<% out.println(sdf3.format(date3)); %>"><% } %>
    </div>
     <h2 style="text-align: center;color:red;padding-top: 15px;">Work</h2>
   <% if (rs6.next()) {
		String company = rs6.getString("company_name");
		String position = rs6.getString("position");
		SimpleDateFormat sdf4 = new SimpleDateFormat("MMM yyyy");
		java.sql.Date date4 = rs6.getDate("start_date");
		java.sql.Date date5 = rs6.getDate("end_date");
	 %>
     <div class="form-group">
      <label for="email">Company Name:</label>
      <input type="text" class="form-control" id="email" placeholder="Company  Name" value="<% out.print(company); %>" name="comp_name" >
       <label for="email">Position:</label>
      <input type="text" class="form-control" id="email" placeholder="percentage" value="<% out.print(position); %>" name="position" >
       <label for="email">Start Date:</label>
      <input type="date" class="form-control" id="email" value="<% out.print(sdf4.format(date4)); %>" name="start_date" >
      <label for="email">End Date:</label>
      <input type="date" class="form-control" id="email" value="<% out.print(sdf4.format(date5)); %>" name="end_date" ><% } %>
      </div>
   
    
    
    <button type="submit" class="btn btn-primary ">Update</button>
  </form>
    
    </div>
   
</div>

</body>
</html>