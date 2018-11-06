<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in</title>
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
   background-image: url("assets/5.jpg");
   background-size: 1500px 800px;
   background-repeat: no-repeat;
   -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
   
}
</style>
<body>
<nav class="nav navbar-inverse navbar-fixed-top" >
        <div class="container">
            <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#robin">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
    </div>
            <div class="collapse navbar-collapse" id="robin">
    <ul class="nav navbar-nav">
        <li><a href="index.html">Home</a></li>
            <li ><a href="resume.jsp">Resume</a></li>
            <li><a href="qrcode.jsp">QRCode</a></li>
            <li><a href="pdf.jsp">PDFGenerator</a></li>
                   <li><a href="#">Contact Us</a></li>
        
        </ul>
            <ul class="nav navbar-nav navbar-right">
         <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
        </div>
        </div>
    
    </nav><br><br><br><br><br><br>
    
    <div class="container">
    <div class="row">
    <div class="col-sm-12">
    <div class="panel panel-primary">
    <div class="panel-heading">
    <h3 style="text-align: center;">Login</h3>
    </div>
    <div class="panel-body">
    <% String msg = (String)session.getAttribute("pas_err_msg"); %>
    <% if (msg!=null){out.print(msg);}session.removeAttribute("pas_err_msg"); %>
     <form action="login" method="post">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <a href="forget.jsp">Forget Password?</a><br><br>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
    </div>
    
    </div>
    </div>
    
    </div>
    </div>
    
    
    

</body>
</html>