<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.Math" %>
<%@ page import ="final_project.User" %>
<%@ page import ="final_project.Student" %>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
</jsp:useBean>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Elmhurst Planner</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom page CSS  -->
    <link href="PageLayout.css" rel="stylesheet">
  </head>

  <body>
  	<% String studentName = currUsrBeanId.getName(); %>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color:#0c2340">

		<a class="navbar-brand page-scroll" href="Dashboard.jsp"><img src="images/clogo.png" class="img-rounded" style="width:200px; height:auto;"></a>
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse" id="navbarsExampleDefault" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="Dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Scheduler.jsp">Scheduler</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Catalog.jsp">Course Catalog</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="Contact.jsp">Contact</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link disabled" href="#">Signed in as, <% out.println(studentName); %></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Logout.jsp">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

    <main role="main">
      <div class="container">
        <!-- Container for Scheduler -->
        <div class="row">
        	<div class="col-12-md">
        		<h2><em>About</em></h2>
        		<p>
        		Elmhurst Planner is a web-application aimed to help current, and potential incoming, students design a 4-year plan that is right for them. 
        		The hope is for, by using Elmhurst Planner, students will be able to work together, with their advisor, to conceptualize and form a clear understanding of what the student needs to take during their time here.
        		To these ends, the student Dashboard and Scheduler pages have been designed to offer users an organized, easy to use, experience when developing an unique 4-year plan.
        		<br><br>
        		For any questions contact, <br>
        		<a href="mailto:elmhurst.planner.support@365.elmhurst.edu">elmhurst.planner.support@365.elmhurst.edu</a>
        		</p>
        		<div>
        			<h2><em>Developers</em></h2>
        			<div class="contactContainer">
        				<div class="contactInner">
        					<img src="images/Portrait_Placeholder.png" width="150" height="150" id="placeholder" alt="Placeholder" style="float: right;">
        					<h3><em>Project Lead -- Andrew Dufour</em></h3>
        					<p>
        					You ever need anything done? You call Tony, got it?? (Andrew fill something out so I don't have to...)
        					</p>
        				</div>
        				<div class="contactInner">
        					<img src="images/Portrait_Placeholder.png" width="150" height="150" id="placeholder" alt="Placeholder" style="float: right;">
        					<h3><em>Database Developer -- Matthew Weiss</em></h3>
        					<p>
        					Have you ever tried to use inheritance in SQL? I hope not... that sounds awful (Matt fill this out please)
        					</p>
        				</div>
        				<div class="contactInner">
        					<div style="overflow: auto; margin: 5px;">
        						<img src="images/Portrait_Placeholder.png" width="150" height="150" id="placeholder" alt="Placeholder" style="float: right;">
        						<h3><em>Front-end Developers</em></h3>
        						<h3><em>Yeong-Haw Wang</em></h3>
        						<p>
        						Young Money, enough said... (Yeong you gotta fill your part out too)
        						</p>
        					</div>
        					<div style="overflow: auto; margin: 5px;">
        						<img src="images/Portrait_Placeholder.png" width="150" height="150" id="placeholder" alt="Placeholder" style="float: right;">
        						<h3><em>Eric Henricks</em></h3>
        						<p>
        						I'm supposed to write something here... but i'll do that later...
        						</p>
        					</div>
        				</div>
        			</div>
        		</div>
        		
        		
        	</div>
        </div>
      </div> <!-- /container -->

    </main>

    <footer class="container">
      <p>© Company 2017-2018</p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
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

</body>
</html>