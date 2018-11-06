<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
  body {
   background-color: #ddd;
  }
</style>
<%  
String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");
String biography = (String)session.getAttribute("bio");
String profile = (String)session.getAttribute("profile");
int uid = (int) session.getAttribute("id");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
<body>

<% if (name!=null){ %>
<div class="container">

<div class="alert alert-success">
  <strong>Your password has been changed successfully</strong> 
  <p><a style="text-decoration: none;" href="setting.jsp">Keep Me logged In</a></p><br>
  <p><a style="text-decoration: none;" href="logout.jsp">Log out</a></p>
</div>
</div>

<%} else{ response.sendRedirect("index.html"); }%>



</body>
</html>