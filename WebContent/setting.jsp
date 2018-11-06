<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="vieport" content="width=device-width initial-state=1">
      
	
     <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
     <script src="bootstrap/js/bootstrap.js"></script>
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

</head>
<style>
body {
  background-color: #ddd;
}
.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 80%;
    border-radius: 5px;
    background-color: white;
    
   
}
.card img {

}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
    border-radius: 5px 5px 0 0;
}

.container {
    padding: 2px 16px;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}

[hidden] {
  display: none !important;
}

</style>


<body>

<% 

String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");
String biography = (String)session.getAttribute("bio");
String profile = (String)session.getAttribute("profile");
int uid = (int) session.getAttribute("id");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	
%>
 <% String msg2 = (String)session.getAttribute("msg2"); %>
  <% String msg = (String)session.getAttribute("msg"); %>
   
   
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
        <li ><a href="#">Home</a></li>
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
    
    </nav><br><br><br><br><br>
    <div class="container">
    <% if (msg2!=null){ %>
   <div class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="margin-right: 20px;">&times;</a>
    <strong>Incorrect!</strong> Please Enter the Correct Old Password.
  </div>
<%} session.removeAttribute("msg2");  %>
<% if (msg!=null){ %>
    <div class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Incorrect!</strong> Two Password did not match.
  </div>
<%} session.removeAttribute("msg");  %>
</div>
    <div class="container">
    <div class="row">
    <div class="col-sm-4">
    <div class="card">
  
  <img src="getProfileImage?uid=<% out.print(uid); %>" alt="<% out.print(name); %>" style="width:100%" height="300px" />
 
 
  <div class="container">
    <h4><b><% if (name != null){out.print(name);}  %></b></h4> 
    <p><% out.print(biography); %></p> 
  </div>
  </div><br>
  <form action="profilePicture" method="post" enctype="multipart/form-data" >
  <label class="btn btn-default">
    Choose Photo <input type="file" hidden name="image" required>
</label><br><br>
   <button type="submit" name="Upload" class="btn btn-success">Upload</button>
  </form>
 
  </div>
  <div class="col-sm-8">
  <form action="updateProfile" method="POST">
    <div class="row">
      
        <label for="fname"> Name</label>
      
      
        <input type="text" id="fname" name="fulltname" value="<%  out.print(name); %>">
     
    </div>
    <div class="row">
    
        <label for="lname">Email</label>
      
     
        <input type="text" id="lname" name="email" value="<% out.println(email); %>">
      
    </div>
     <div class="row">
        <label for="subject">Subject</label>
     
      <div class="col-75">
        <textarea id="subject" name="bio"  style="height:200px" ><% out.println(biography); %></textarea>
      </div>
    </div><br>
    <div class="row">
      <input type="submit" value="Update">
    </div>
  </form>
  <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">Change Password</button>
  <div id="demo" class="collapse">
   <form action="changePassword" method="post">
   OLD Password:
    <input type="password" class="form-control" id="email" name="old-pwd">
    <% if (msg2!=null){out.print(msg2);}session.removeAttribute("msg2"); %>
   New Password:
    <input type="password" class="form-control" id="pwd" name="new-pwd">
    <% if (msg!=null){out.print(msg);}session.removeAttribute("msg"); %>
  
    Re-New Password
    <input type="password" class="form-control" id="pwd" name="re-pwd">
  
  <button type="submit" class="btn btn-info">Change</button>
</form>
  </div>
  
  </div>
</div>

</div>

    


</body>
</html>