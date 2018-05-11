<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
	</jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
		
		<title>Scheduler Login</title>
	</head>

	<body>
	<!--  <div class="col-sm-4">.col-sm-4</div>
	
	<label>Password:</label>
			<input type="password" class="form-control" placeholder="Your Password">

	<div>
		<label for="user" >ENumber:</label>
			<input type="text" class="form-control" >
	</div>
	 -->

	<div style="background-color:#0c2340;" align="center">
		<a href="https://my.elmhurst.edu/" >
 		 <img src="images/clogo.png" class="img-rounded" alt="logo">
		</a>
 	</div>
 	
	<div >
		<div align="center" style="padding-top:2%; padding-bottom:2%">
	 		<!--  <img src="images/icon.png" class="img-rounded" alt="icon"> -->
	 		<img src="images/BLU_AVA_ICON.png" class="img-rounded" alt="avatar" width="15%" height="15%">
	 	</div>
	
	 	
	 	<!-- currUsrBeanId -->
		<form action="ProcessLogin.jsp" >
			<div  align="center">
				<label style="desplay:inline-block; width:9%"><b>ENumbers</b></label>
				<input type="text" placeholder="Your ENumber" name="user" value="e0011111">
			</div>
			<div align="center">	
				<label style="desplay:inline-block; width:9%; "><b>Password</b></label>
				<input type="password" placeholder="Your Password" name="pass" value="123456">
			</div>
			<div align="center">
				<input type="submit" value="Login" button type="button" class="btn btn-primary" style="background-color:#0c2340;"></button>
			</div>
		</form>
	</div>



		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	</body>
</html>