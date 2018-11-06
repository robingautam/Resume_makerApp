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

<title>Insert title here</title>

</head>
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}

#regForm {
  background-color: #ffffff;
  margin: 100px auto;
  font-family: Raleway;
  padding: 40px;
  width: 70%;
  min-width: 300px;
}

h1 {
  text-align: center;  
}

input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
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
   <!--   <div class="container">
    <div class="col-sm-12">
    <form id="regForm" action="resume_basic" method="post">
  <h1>Resume:</h1>
  <!-- One "tab" for each step in the form: 
  <div class="tab">Basic Information:
    <p><input placeholder="First name..." oninput="this.className = ''" name="fname"></p>
    <p><input placeholder="Last name..." oninput="this.className = ''" name="lname"></p>
     <p><input placeholder="E-mail..." oninput="this.className = ''" name="email"></p>
    <p><input placeholder="Phone..." oninput="this.className = ''" name="phone"></p>
    <p><input placeholder="DOB" oninput="this.className = ''" name="dob" type="date"></p>
   
  </div>
  <div class="tab">Class 10:
    <p><input placeholder="School or Board Name" oninput="this.className = ''" name="school_name"></p>
    <p><input placeholder="Percentage" oninput="this.className = ''" name="percentage"></p>
     Year of Completion:
     <p><input placeholder="Year of completion" oninput="this.className = ''" name="ten_complete" type="date"></p>
     Class 12:
     <p><input placeholder="School or Board Name" oninput="this.className = ''" name="twelve_school_name"></p>
    <p><input placeholder="Percentage" oninput="this.className = ''" name="twelve_percentage"></p>
    Year of Completion:
     <p><input placeholder="Year of completion" oninput="this.className = ''" name="twelve_complete" type="date"></p>
     Undergraduate:
     <p><input placeholder="College or University Name.." oninput="this.className = ''" name="college_name"></p>
    <p><input placeholder="Percentage" oninput="this.className = ''" name="under_percentage"></p>
     <p><input placeholder="Year of completion" oninput="this.className = ''" name="college_complete" type="date"></p>
    Postgraduate:
     <p><input placeholder="College or University Name.." oninput="this.className = ''" name="post_college_name"></p>
    <p><input placeholder="Percentage" oninput="this.className = ''" name="post_percentage"></p>
     <p><input placeholder="Year of completion" oninput="this.className = ''" name="post_college_complete" type="date"></p>
    
    
  </div>
  
  <div class="tab">Work Experience:
    <p><input placeholder="Company Name" oninput="this.className = ''" name="comp_name"></p>
    <p><input placeholder="position" oninput="this.className = ''" name="position"></p>
     <p><input placeholder="start date" oninput="this.className = ''" name="start_date" type="date"></p>
     <p><input placeholder="end date" oninput="this.className = ''" name="end_date" type="date"></p>
  </div>
   <div class="tab">Skills:<br>
    <input type="text" id="txtAutoComplete" list="languageList"/ name="skill1"><!--your input textbox<br>
<datalist id="languageList">
<option value="Web development" />
<option value="web designing" />
<option value="JavaScript or jquery" />
<option value="SQL" />
<option value="PHP" />
<option value="java" />
<option value="spring" />
<option value="hibernate" />
<option value="C" />
<option value="C++" />
<option value="C#" />
<option value="python" />
<option value="Software Development" />
<option value="Android" />
<option value="Ruby on Rails" />
<option value="node.js" />
<option value="Angular.js" />
</datalist><br>
<input type="text" id="txtAutoComplete" list="languageList"/ name="skill2"><!--your input textbox<br>
<datalist id="languageList">
<option value="Web development" />
<option value="web designing" />
<option value="JavaScript or jquery" />
<option value="SQL" />
<option value="PHP" />
<option value="java" />
<option value="spring" />
<option value="hibernate" />
<option value="C" />
<option value="C++" />
<option value="C#" />
<option value="python" />
<option value="Software Development" />
<option value="Android" />
<option value="Ruby on Rails" />
<option value="node.js" />
<option value="Angular.js" />
</datalist><br>
<input type="text" id="txtAutoComplete" list="languageList"/ name="skill3"><!--your input textbox<br>
<datalist id="languageList">
<option value="Web development" />
<option value="web designing" />
<option value="JavaScript or jquery" />
<option value="SQL" />
<option value="PHP" />
<option value="java" />
<option value="spring" />
<option value="hibernate" />
<option value="C" />
<option value="C++" />
<option value="C#" />
<option value="python" />
<option value="Software Development" />
<option value="Android" />
<option value="Ruby on Rails" />
<option value="node.js" />
<option value="Angular.js" />
</datalist><br>
<input type="text" id="txtAutoComplete" list="languageList"/ name="skill4"><!--your input textbox<br>
<datalist id="languageList">
<option value="Web development" />
<option value="web designing" />
<option value="JavaScript or jquery" />
<option value="SQL" />
<option value="PHP" />
<option value="java" />
<option value="spring" />
<option value="hibernate" />
<option value="C" />
<option value="C++" />
<option value="C#" />
<option value="python" />
<option value="Software Development" />
<option value="Android" />
<option value="Ruby on Rails" />
<option value="node.js" />
<option value="Angular.js" />
</datalist><br>
<input type="text" id="txtAutoComplete" list="languageList"/ name="skill5"><!--your input textbox<br>
<datalist id="languageList">
<option value="Web development" />
<option value="web designing" />
<option value="JavaScript or jquery" />
<option value="SQL" />
<option value="PHP" />
<option value="java" />
<option value="spring" />
<option value="hibernate" />
<option value="C" />
<option value="C++" />
<option value="C#" />
<option value="python" />
<option value="Software Development" />
<option value="Android" />
<option value="Ruby on Rails" />
<option value="node.js" />
<option value="Angular.js" />
</datalist>
  </div>
  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: 
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>
    
    
    </div>
    </div>
    -->
   
   <!--   <script>

    var currentTab = 0; // Current tab is set to be the first tab (0)
    showTab(currentTab); // Display the crurrent tab

    function showTab(n) {
      // This function will display the specified tab of the form...
      var x = document.getElementsByClassName("tab");
      x[n].style.display = "block";
      //... and fix the Previous/Next buttons:
      if (n == 0) {
        document.getElementById("prevBtn").style.display = "none";
      } else {
        document.getElementById("prevBtn").style.display = "inline";
      }
      if (n == (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = "Submit";
      } else {
        document.getElementById("nextBtn").innerHTML = "Next";
      }
      //... and run a function that will display the correct step indicator:
      fixStepIndicator(n)
    }

    function nextPrev(n) {
      // This function will figure out which tab to display
      var x = document.getElementsByClassName("tab");
      // Exit the function if any field in the current tab is invalid:
      if (n == 1 && !validateForm()) return false;
      // Hide the current tab:
      x[currentTab].style.display = "none";
      // Increase or decrease the current tab by 1:
      currentTab = currentTab + n;
      // if you have reached the end of the form...
      if (currentTab >= x.length) {
        // ... the form gets submitted:
        document.getElementById("regForm").submit();
        return false;
      }
      // Otherwise, display the correct tab:
      showTab(currentTab);
    }

   function validateForm() {
      // This function deals with validation of the form fields
      var x, y, i, valid = true;
      x = document.getElementsByClassName("tab");
      y = x[currentTab].getElementsByTagName("input");
      // A loop that checks every input field in the current tab:
     /* for (i = 0; i < y.length; i++) {
        // If a field is empty...
        if (y[i].value == "") {
          // add an "invalid" class to the field:
          y[i].className += " invalid";
          // and set the current valid status to false
          valid = false;
        }
      }*/
      // If the valid status is true, mark the step as finished and valid:
    /* if (valid) {
        document.getElementsByClassName("step")[currentTab].className += " finish";
      }*/
      return valid; // return the valid status
    }

    function fixStepIndicator(n) {
      // This function removes the "active" class of all steps...
      var i, x = document.getElementsByClassName("step");
      for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
      }
      //... and adds the "active" class on the current step:
      x[n].className += " active";
    }


    </script>-->
    <div class="container">
    <div class="background" style="background-color: white;">
    <h2 style="text-align: center;color:red;padding-top: 15px;">Basic Information</h2>
    <form action="resume_basic" style="margin-left: 15px;margin-right: 10px;" method="post">
    <div class="form-group">
      <label for="email">First Name:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter First Name" name="fname" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Last Name:</label>
      <input type="text" class="form-control" id="pwd" placeholder="Enter Last Name" name="lname" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Email:</label>
      <input type="email" class="form-control" id="pwd" placeholder="Enter Email" name="email" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Phone:</label>
      <input type="text" class="form-control" id="pwd" placeholder="Enter Phone" name="phone" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Date Of Birth:</label>
      <input type="date" class="form-control" id="pwd" name="dob" required="">
    </div>
    <button type="submit" class="btn btn-primary ">Next</button>
  </form>
    
    </div>
    </div>

    
   

</body>
</html>