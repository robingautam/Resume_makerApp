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
 
      <h1 style="color: white;text-align: center;">Generate your QRCode</h1><br><br><br>

      
     

<br><br><br><br><br><br><br><br>
<div class="container">
 
  <div class="row jumbotron" style="background-color: black; opacity: 0.5;" >
  <div class="row">
  <div class="col-sm-2">
  <img class="img-responsive" src="assets/icon3.png" style="padding-top: 20px;">
  
  </div>
  <div class="col-sm-10">
  <h3 style="color: white;font-size:25px;">Dynamic QRCode Generate</h3>
  <p3 style="color: white;">
With Dynamic QR Codes, you have full flexibility, because only a short URL that points to the content is encoded. 
Thus you can modify the stored links or files without having to generate and print the Codes again. 
This will save resources and enable you to respond to any changes in the campaign as quickly as possible.
  </p3>
  
  </div>
  </div>
  
  </div>
  
  
  </div>

</body>
</html>