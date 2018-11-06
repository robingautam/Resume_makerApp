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
     <script src="jquery.js"></script>
     <script src="script.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<title>Insert title here</title>
<style>
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
</head>


<body>
<% 

String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    String gender = (String)session.getAttribute("gender");
    int uid = (int) session.getAttribute("id");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	
%>
<%  String msg = (String)session.getAttribute("gen_msg");
String msg2 = (String)session.getAttribute("gen_msg2");
String msg3 = (String)session.getAttribute("gen_msg3");%>

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
           <li class="dropdown" ><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="<% out.print(name); %>" src="getProfileImage?uid=<% out.print(uid);%>" width="20px" height="22px" style=""> <% out.print(name); %><span class="caret"></span></a>
        <ul class="dropdown-menu  navbar-right">
            <li style="text-align: center;"><a href="profile.jsp">Profile</a></li>
            <li style="text-align: center;"><a href="setting.jsp">Settings</a></li>
            <li style="text-align: center;"><a href="logout.jsp">Log out</a></li>
            
            </ul>
        </li>
        
    </ul>
        </div>
        </div>
    
    </nav><br><br>
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
    <div class="well well-lg" style="text-align: center;font-size: 20px;font-family: serif;">QR Code Generator</div>
   <div class="container">
   <div class="row">
   <div class="col-sm-4">
   
   <img class="responsive" src="assets/icon3.png" height="150px">
   
   </div>
   <div class="col-sm-8">
   <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">Text</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">URL</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Contact</button>
</div>

<div id="London" class="tabcontent">
  <h3>Text</h3>
 <form action="generate_qr1" method="post">
  <div class="form-group">
    <textarea class="form-control" id="text" name="textarea" style="width: 300px;"></textarea>
  </div>
  <button type="submit" class="btn btn-success">Save</button>
</form>
</div>

<div id="Paris" class="tabcontent">
  <h3>URLs</h3>
  <form action="generate_qr2" method="post">
  <div class="form-group">
    <input type="text" class="form-control" id="email" name="url" style="width: 300px;" placeholder="http://example.com">
  </div>
  <button type="submit" class="btn btn-success">Save</button>
</form> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Contact</h3>
  <form action="generate_qr3" method="post" >
  <div class="form-group">
    <label for="email">Full Name:</label>
    <input type="text" class="form-control" id="name" name="full_name">
  </div>
  <div class="form-group">
    <label for="email">Email:</label>
    <input type="email" class="form-control" id="email" name="email">
  </div>
  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" class="form-control" id="add" name="address">
  </div>
  <div class="form-group">
    <label for="address">Organization:</label>
    <input type="text" class="form-control" id="add" name="organization">
  </div>
  <div class="form-group">
    <label for="address">Fax:</label>
    <input type="text" class="form-control" id="add" name="fax">
  </div>
  
  <div class="form-group">
    <label for="pwd">phone:</label>
    <input type="text" class="form-control" id="phone" name="phone">
  </div>
   <div class="form-group">
    <label for="pwd">City:</label>
    <input type="text" class="form-control" id="phone" name="city">
  </div>
   <div class="form-group">
    <label for="pwd">Country:</label>
    <input type="text" class="form-control" id="phone" name="country">
  </div>
  
  
  <button type="submit" class="btn btn-success">Save</button>
</form>
  
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