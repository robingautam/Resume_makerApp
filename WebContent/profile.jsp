<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  background-color: white;
}

.title {
  color: grey;
  font-size: 18px;
}


button:hover, a:hover {
  opacity: 0.7;
}

body {font-family: Arial; }

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
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
	String sql1 = "SELECT * FROM qr_code2 WHERE uemail = '"+email+"' ";
	String sql2 = "SELECT * FROM qr_code1 WHERE uemail = '"+email+"'";
	String sql3 = "SELECT * FROM  qr_code3 WHERE uemail = '"+email+"'";
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery(sql1);
	Statement st1 = connection.createStatement();
	ResultSet rs1 = st1.executeQuery(sql2);
	Statement st2 = connection.createStatement();
	ResultSet rs2 = st2.executeQuery(sql3);
	
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
    <%   String msg = (String)session.getAttribute("msg"); 
    String msg2 = (String)session.getAttribute("msg2");
    String msg3 = (String)session.getAttribute("msg3");
    
    %>
    <div class="container">
    <div class="container">
     <% if (msg!=null){ %>
   <div class="alert alert-info alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="margin-right: 20px;">&times;</a>
    <strong>Information</strong> <% out.print(msg); %>
  </div>
<%} session.removeAttribute("msg");  %>
<% if (msg2!=null){ %>
   <div class="alert alert-info alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="margin-right: 20px;">&times;</a>
    <strong>Information</strong> <% out.print(msg2); %>
  </div>
<%} session.removeAttribute("msg2");  %>
<% if (msg3!=null){ %>
   <div class="alert alert-info alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="margin-right: 20px;">&times;</a>
    <strong>Information</strong> <% out.print(msg3); %>
  </div>
<%} session.removeAttribute("msg3");  %>
    </div>
    
    </div>
    <div class="container">
    <div class="row">
    <div class="col-sm-4">
    <div class="card">
  <img src="getProfileImage?uid=<% out.println(uid); %>" alt="John" style="width:100%" height="300px">
  <h1><% out.print(name); %></h1>
  <p class="title"><% out.print(biography); %></p>
  <p style="font-size: 20px;" >Email: <% out.print(email); %></p><br>
  <div style="margin: 24px 0;">
  
 </div>
 
</div><br>
<p><a class="btn btn-success" href="view_resume.jsp">View My Resume</a></p>
 </div>
  
    <div class="col-sm-8">
    <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">Text</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">URL</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Contact</button>
</div>

<div id="London" class="tabcontent">
 <% while(rs.next()){
	 int id = rs.getInt("id");
	 String text = rs.getString("text");
	 SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM d, yyyy");
     java.sql.Date date1 = rs.getDate("date");
    // out.println(sdf2.format(date1));
	 %>
   <div class="media" style="background-color: white;margin-top: 10px;">
    <div class="media-left">
      <img src="getProfileImage?uid=<% out.println(uid); %>" class="media-object" style="width:60px; margin-top: 5px;margin-left: 5px;margin-bottom: 5px;">
    </div>
    <div class="media-body">
      <h4 class="media-heading" style="margin-top: 5px;color:black"><% out.print(name); %></h4>
      <p><% out.print(name); %> generated QRCode of the Text<br><i style="color: #ddd234;"><% out.println(sdf2.format(date1)); %></i> </p>
      
      <p>Title: <% out.print(text); %></p>
      <p><a href="download_qr1?id=<% out.print(text); %>&&uemail=<% out.print(email); %>" style="margin-right: 4px;"><i class="fa fa-download" style="font-size:11px;"></i> Download</a><a href="deleteQRCode1?id=<% out.print(id); %>&&uemail=<% out.print(email); %>" style="margin-left: 6px;"><i class="fa fa-trash" style="font-size:11px;"></i> Delete</a></p>
    </div>
  </div>
  <%} %>
 
 </div>
 
 <div id="Paris" class="tabcontent">
  <% while(rs1.next()){
	  int id1 = rs1.getInt("id");
		 String url = rs1.getString("url");
		 SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM d, yyyy");
	     java.sql.Date date2 = rs1.getDate("date");
	    
	  %>
   <div class="media" style="background-color: white;margin-top: 10px;">
    <div class="media-left">
      <img src="getProfileImage?uid=<% out.println(uid); %>" class="media-object" style="width:60px; margin-top: 5px;margin-left: 5px;margin-bottom: 5px;">
    </div>
    <div class="media-body">
      <h4 class="media-heading" style="margin-top: 5px;"><% out.print(name); %></h4>
      <p><% out.print(name); %> generated QRCode for  URL<br><i style="color: #ddd234;"><% out.println(sdf2.format(date2)); %></i> </p>
      <p>URL: <a href="<% out.print(url); %>"><% out.print(url); %></a></p>
      <p><a href="download_qr2?id=<% out.print(url);  %>&&uemail=<% out.print(email); %>" style="margin-left: 4px;"><i class="fa fa-download" style="font-size:11px;"></i> Download</a><a href="deleteQRCode2?id=<% out.print(id1); %>&&uemail=<% out.print(email); %>"  style="margin-left: 6px;"><i class="fa fa-trash" style="font-size:11px;"></i> Delete</a></p>
    </div>
  </div>
  <%} %>
  
  
</div>
<div id="Tokyo" class="tabcontent">
 <% while(rs2.next()){ 
 int id2 = rs2.getInt("id");
 String fullname = rs2.getString("name");
 String qrcodeemail = rs2.getString("email");
 SimpleDateFormat sdf2 = new SimpleDateFormat("MMMM d, yyyy");
 java.sql.Date date3 = rs2.getDate("date");
 
 %>
   <div class="media" style="background-color: white;margin-top: 10px;">
    <div class="media-left">
      <img src="getProfileImage?uid=<% out.println(uid); %>" class="media-object" style="width:60px; margin-top: 5px;margin-left: 5px;margin-bottom: 5px;">
    </div>
    <div class="media-body">
      <h4 class="media-heading" style="margin-top: 5px;"><% out.print(name); %></h4>
      <p><% out.print(name); %> generated contact QRCode <br><i style="color: #ddd234;"><% out.println(sdf2.format(date3));  %></i> </p>
      <p>Name: <% out.print(fullname); %> Email: <% out.print(qrcodeemail); %></p>
      <p><a href="downloadQRCode?id=<% out.print(id2); %>" style="margin-left: 4px;"><i class="fa fa-download" style="font-size:11px;"></i> Download</a><a href="deleteQRCode3?id=<% out.print(id2); %>&&uemail=<% out.print(email); %>" style="margin-left: 6px;"><i class="fa fa-trash" style="font-size:11px;"></i> Delete</a></p>
    </div>
  </div>
  <% } %>
  
 </div>
  
 </div>
 

    
    
    </div>
   </div>
   
    
    
      <script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
 
    

</body>
</html>