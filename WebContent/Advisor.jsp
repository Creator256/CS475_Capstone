<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*" %>
<%@ page import ="final_project.Advisor" %>
<!-- <%@ page import ="final_project.Advisor" %>  -->
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
</jsp:useBean>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Advisor Page</title>

	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom page CSS  -->
	<link href="PageLayout.css" rel="stylesheet">
</head>

<body>
  	<%			
	  	response.setHeader("Cache-Control","no-cache"); 
		response.setHeader("Cache-Control","no-store"); 
		response.setDateHeader("Expires", -1);
		response.setHeader("Pragma","no-cache"); 
	%>
	<%	if(currUsrBeanId.isLoggedIn() && !currUsrBeanId.isStudent()){ %>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#0c2340">

		<a class="navbar-brand page-scroll" href="Advisor.jsp"><img src="images/clogo.png" class="img-rounded" style="width:200px; height:auto;"></a>
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse" id="navbarsExampleDefault" style="">
			<ul class="navbar-nav mr-auto">
			<!--  
				<li class="nav-item active">
					<a class="nav-link" href="Dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Scheduler.jsp">Scheduler</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Catalog.jsp">Course Catalog</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Contact.jsp">Contact</a>
				</li>
				-->
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link disabled" href="#">Signed in as
					<%=currUsrBeanId.getName() %></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Logout.jsp">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container" style="padding-top:1%; overflow-x:auto;">
		<div class="col-xs-12">
			<form action = "ProcessAdvisor.jsp">
				<table class="table table-bordered table-hover" data-link="row">
					<thead class="thead-dark">
						<tr>
							<th scope="col">eNumber</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Major</th>
						</tr>
					</thead>
					<tbody >
					<% Advisor currentAdvisor = currUsrBeanId.getAdvisor();
					boolean success = currentAdvisor.getStudents();
					if(success) {
						Map<String, String[]> advisorsStudents = currentAdvisor.getStudentinfo();
						
						for (Map.Entry<String, String[]> entry : advisorsStudents.entrySet()) {
						    out.println("<tr>");
						    String key = entry.getKey();
						    String[] values = entry.getValue(); %>
						    <td> <button name="studentEnumber" type="submit" value="<%= key %>"><%=key %></button>  </td>
						    <% for(int i = 0; i < values.length; i++) {
						    //System.out.println(key + ": " + values[i]); %>
						    <td> <%= values[i] %>  </td> 
						    <% } 
						    out.println("</tr>");
						 }
					} %>
	<!-- 					<tr>
							<th scope="col">e000000</th>
							<th scope="col">Rotator Rotator Rotator</th>
							<th scope="col">No lemon, no melon </th>
							<th scope="col">Mathematics and the Foundations of Computer Science</th>
						</tr> -->
					</tbody>
				</table>
			</form>
 		</div>
	</div> 


	<footer class="container">
		<p>� Company 2017-2018</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="rowlink.js"></script>
	<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
	<script src="../../../../assets/js/vendor/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    
	<script type="text/javascript">
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].onclick = function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block")  { panel.style.display = "none";  }
				else                  { panel.style.display = "block"; }
				}
			}
		
		function autoOpen() {
			document.getElementsById("defaultOpen").style.visibility = "block";
		}
	</script>
	    <% } else if(currUsrBeanId.isLoggedIn() && currUsrBeanId.isStudent()) { 
	    	response.sendRedirect("http://localhost:8080/Capstone_Final/Dashboard.jsp");
	    } else{
	    	
	    %>
	<% response.sendRedirect("http://localhost:8080/Capstone_Final/Login.jsp");} %>
</body>
</html>