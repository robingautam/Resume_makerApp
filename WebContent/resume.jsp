<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="vieport" content="width=device-width initial-state=1">
    
     <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
     <link rel="stylesheet" type="text/css" href="indexstyle.css" />
	 <script src="bootstrap/js/bootstrap.js"></script>
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
     
	<script>
	$(document).ready(function(){
	    $("#signupBtn").click(function(){
	        $("#signupModal").modal();
	    });
	});
	</script>
	
</head>
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
        <li ><a href="index.html">Home</a></li>
            <li ><a href="#">Resume</a></li>
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
    
    </nav><br><br><br><br><br>
 
      <h1 style="color: white;text-align: center;">Build your resume online</h1><br><br><br>
      <div class="container">
      <div class="row">
      <div class="col-sm-5">
      
      </div>
      <div class="col-sm-6">
      <button type="button" class="btn btn-default btn-lg btn-success" id="signupBtn" style="position: absolute; right: 65%;white-space: normal;color: white;" >Create Resume</button>
  
  

  <!-- Modal -->
  <div class="modal fade" id="signupModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button  type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> You need to Sign Up</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter Name">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-envelope	
"></span> Email</label>
              <input type="email" class="form-control" id="email" placeholder="Enter Email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="psw" placeholder="Enter password">
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already member? <a href="login.jsp">Log in</a></p>
          <p>Forgot <a href="forget.jsp">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div> 
      
      </div>
      <div class="col-sm-1">
      
      </div>
      </div>
      </div>
      
     

<br><br><br><br><br><br><br><br>
<div class="container">
 
  <div class="row jumbotron" style="background-color: black; opacity: 0.5;" >
  <div class="row">
  <div class="col-sm-2">
  <img class="img-responsive" src="assets/icon2.png" style="padding-top: 20px;">
  
  </div>
  <div class="col-sm-10">
  <h3 style="color: white;font-size:25px;">Professional Resume</h3>
  <p3 style="color: white;">
Create a compelling resume design that organizes all your credentials in an impressive run-through.
Your resume can make or break your job application. 
It's the starting point to a career that may dictate how your life shifts from that point on. 
That's why creating one can be such a daunting challenge.
  </p3>
  
  </div>
  </div>
  
  </div>
  
  
  </div>

</body>
</html>