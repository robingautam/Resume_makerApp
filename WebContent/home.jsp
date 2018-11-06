<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
 <meta name="vieport" content="width=device-width initial-state=1">
      <link rel="stylesheet" type="text/css" href="indexstyle.css" />
	
     <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
     <script src="bootstrap/js/bootstrap.js"></script>
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    
</head>
<body>
<% 

String name = (String)session.getAttribute("name");
int uid = (int)session.getAttribute("id");
    String email = (String)session.getAttribute("email");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	
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
    
    </nav><br><br><br><br><br><br><br><br><br><br>
    <div class="container">
 
  <div class="row jumbotron" style="background-color: black; opacity: 0.5;" >
  <div class="row">
  <div class="col-sm-1">
  <img class="img-responsive" src="assets/icon2.png">
  
  </div>
  <div class="col-sm-5">
  <h7 style="color: white; font-size: 25px; text-align: center;">Professional</h7><br>
  <p5 style="color: white;">Our HR-approved resume templates will get you more callbacks.Applicant Tracking System Friendly</p5><br><br>
  <a href="resume_basic.jsp" class="btn btn-primary" role="button">Create Resume</a>
  
  
  
  </div>
  <div class="col-sm-1">
  <img class="img-responsive" src="assets/icon3.png">
  
  </div>
  <div class="col-sm-5">
  <h7 style="color: white; font-size: 25px; text-align: center;">QRCode Generator</h7><br>
  <p5 style="color: white;">You can create your own QRCode online. This is very fast website for generating the QRCode </p5><br><br>
  <a href="qrcode1.jsp" class="btn btn-primary" role="button">Create QRCode</a>
  
  
  </div>
  
  </div>
  
  <div class="row" style="margin-top: 35px;">
  <div class="col-sm-1">
  <img class="img-responsive" src="assets/icon4.png">
  
  </div>
  <div class="col-sm-5">
    <h7 style="color: white; font-size: 25px; text-align: center;">PDF File Maker</h7><br>
  <p5 style="color: white;">Convert your Documents to PDF We take care of the complexity and make converting PDFs simple for you </p5><br><br>
  <a href="#" class="btn btn-primary" role="button">Create PDF File</a>
  
  </div>
  <div class="col-sm-1">
  <img class="img-responsive" src="assets/icon5.png">
  
  </div>
  <div class="col-sm-5">
  <h7 style="color: white; font-size: 25px; text-align: center;">Start Your Online File Zip/UnZip Now</h7><br>
  <p5 style="color: white;"> We make compressing files simple with our fast and reliable online zip creator. 
   We also offer a zip file extractor to easily unpack all your files. </p5><br><br>
  
  
  </div>
  
  </div>
  
  </div>
  
  
  </div>
    





</body>
</html>