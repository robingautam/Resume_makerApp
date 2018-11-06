<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="vieport" content="width=device-width initial-state=1">
     
     <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
     <script src="bootstrap/js/bootstrap.js"></script>
     <link rel="stylesheet" type="text/css" href="resume_basic.css" />
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<title>Hobbies</title>
</head>
<style>
body {
 background-color: #ddd;
}

</style>
<body>

<% 

String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    int uid = (int)session.getAttribute("id");
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
           <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="<% out.print(name); %>" src="getProfileImage?uid=<% out.print(uid);%>" width="20px" height="22px" style=""> <% out.print(name); %><span class="caret"></span></a>
        <ul class="dropdown-menu  navbar-right">
            <li style="text-align: center;"><a href="profile.jsp">Profile</a></li>
            <li style="text-align: center;"><a href="setting.jsp">Settings</a></li>
            <li style="text-align: center;"><a href="logout.jsp">Log out</a></li>
            
            </ul>
        </li>
        
    </ul>
        </div>
        </div>
    
    </nav><br><br><br>
    
    <div class="container">
      <div class="row">
       <div class="col-sm-8">
       <div class="well well-lg" style="border: none;background-color: white;"><h1 style="text-align: center;margin-top: 20px;">Make your Resume</h1></div>
       </div>
       <div class="col-sm-4">
       <img class="responsive" src="assets/usericon.png">
       
       </div>
       
      </div>
    </div>
     <div class="container">
    <div class="background" style="background-color: white;">
    <h2 style="text-align: center;color:red;padding-top: 15px;">Hobbies</h2>
    <form action="resume_hobbies" style="margin-left: 15px;margin-right: 10px;" method="post">
    <div id="free">
    <div class="form-group">
      <input type="text" class="form-control" id="email" placeholder="Ex: Dancing, Singing etc.." name="hobbies" ><br>
        </div>
    </div>
    <button type="button" class="btn btn-default center-block" id="btn">Add More Hobbies</button>
    <button type="submit" class="btn btn-primary ">Next</button>
  </form>
    
    </div>
    </div>
    
    
    <script>
      $(document).ready(function(){
    	  $("#btn").click(function(){
    		 	    
    	    var form = '<input type="text" class="form-control" id="email" placeholder="Ex: Dancing, Singing, etc.." name="hobbies" ><br>';     
    	    	     
        	 $(".form-group").append(form);
    		  
    	  });
    	  
      });
    
    
    </script>
        


</body>
</html>