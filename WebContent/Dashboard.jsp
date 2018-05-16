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
    <link href="sidebar.css" rel="stylesheet">
  </head>

  <body>
	<%
    	String studentName = currUsrBeanId.getName();
    	String studentNumber = currUsrBeanId.getENumber();
    	String studentAdvisor = "tempAdvisor";
    	String[] studentFirstYear = currUsrBeanId.getStudent().getYearOneClasses();
    	String[] studentSecondYear = currUsrBeanId.getStudent().getYearTwoClasses();
    	String[] studentThirdYear = currUsrBeanId.getStudent().getYearThreeClasses();
    	String[] studentFourthYear = currUsrBeanId.getStudent().getYearFourClasses();
    	String studentMajorID = currUsrBeanId.getStudent().getMajorID();
    	String studentMajor = currUsrBeanId.getStudent().getMajor();
    	String studentRemainingCourses = currUsrBeanId.getStudent().getRemainingCourses();
    	System.out.println("DASHBOARD REMAINING COURSES: " + studentRemainingCourses);
    	double studentRemainingCredits = currUsrBeanId.getStudent().getRemainingCredits();
    	System.out.println("DASHBOARD REMAINING CREDITS: " + studentRemainingCredits);
    	String[] studentRemainingFields = currUsrBeanId.getStudent().getRemainingGeneralFields();
    	
    	String[] courseInfoVar;
  		String creditVar;
  		String tagVar;
  		String aokVar;
    	
  		String[] majors = currUsrBeanId.getAllMajorsAbbreviations();
  		String[] majorCourses;
    %>

	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#0c2340">

		<a class="navbar-brand page-scroll" href="Dashboard.jsp"><img src="images/clogo.png" class="img-rounded" style="width:200px; height:auto;"></a>
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse" id="navbarsExampleDefault" style="">
			<ul class="navbar-nav mr-auto">
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
    
	<div class="wrapper" style="margin-top: -40px;">
      <div class="content" style="padding: 30px; width: 100%;">
      
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="" id="">
                   	<ul class="nav navbar-nav navbar-left">
                   	<% 
                   		out.println("<li>Student: " + studentName + "</li>");
                   		out.println("<li>eNumber: " + studentNumber + "</li>");
                   		out.println("<li>Advisor: " + studentAdvisor + "</li>");
                   	%>
                   	<!-- 
                   	<li>Student: studentName</li>
                   	<li>eNumber: studentNumber</li>
                   	<li>Advisor: studentAdvisor</li>
                   	 -->
                   	
                	</ul>
            	</div>
            	<div class="" id="">
                   	<ul class="nav navbar-nav navbar-center">
                   	<% 
                   		out.println("<li>Major: " + studentMajor + "</li>");
                   	%>
                        <li>Year: 1<br></li>
                	</ul>
            	</div>
            	<div class="navbar-header pull-right">
                 	<button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                    	<span></span>
                	</button>
                </div>
            	
        	</div>
      	</nav>
        <!-- Example row of columns -->
        <div class="row" style="overflow-x: auto;">
          <div class="col-md-4" style="min-width: 250px; wordwrap: break-word">
            <ul class="nav nav-list">
                <li id="DashboardPanel">
                  <button class="accordion active" id="CourseButton"><h2>Current Courses</h2></button>
                  <div class="panel" style="display: block;">
                  	<%
                  	if(studentFirstYear != null) {
                    	for(int i=0; i < studentFirstYear.length; i++){
                  			courseInfoVar = currUsrBeanId.getCourseInfo(studentFirstYear[i]);
                  			creditVar = courseInfoVar[4];
                  			aokVar = courseInfoVar[5];
                  			tagVar = courseInfoVar[6];
                  			
                  			
                  			out.println("<div class=\"CoursePanel\">");
              					out.println(studentFirstYear[i]);
              					out.println("<ul>");
              						out.println("<li>Credits: " + creditVar + "</li>");
              						out.println("<li>AoKs: " + aokVar + "</li>");
              						out.println("<li>Tags: " + tagVar + "</li>");
              					out.println("</ul>");
              				out.println("</div>");	
                  		}
                  	}

                  	%>
                  </div>
                </li>
              </ul>
          </div>
          <div class="col-md-4" style="min-width: 250px; wordwrap: break-word">
            <ul class="nav nav-list">
                <li id="DashboardPanel">
                	<button class="accordion active" id="CourseButton"><h2>Upcoming Courses</h2></button>
                  		<div class="panel" style="display: block;">
                  			<%
                  			if(studentSecondYear != null) {
                  				for(int i=0; i < studentSecondYear.length; i++){
                  					courseInfoVar = currUsrBeanId.getCourseInfo(studentSecondYear[i]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  			
                  					out.println("<div class=\"CoursePanel\">");
              							out.println(studentSecondYear[i]);
              							out.println("<ul>");
              								out.println("<li>Credits: " + creditVar + "</li>");
              								out.println("<li>AoKs: " + aokVar + "</li>");
              								out.println("<li>Tags: " + tagVar + "</li>");
              							out.println("</ul>");
              						out.println("</div>");	
                  				}
                  			}
                  			%>
                  		</div>
                  	</li>
                </ul>
          </div>
          <div class="col-md-4" style="min-width: 250px; wordwrap: break-word">
          	<ul class="nav nav-list">
                <li id="DashboardPanel">
                  <button class="accordion active" id="CourseButton"><h2>Remaining Requirements</h2></button>
                  	<div class="panel" style="display: block;">
                 		<button class="accordion" id="CourseButton">Major Requirements</button>
                    		<div class="panel">
                      			<ul class="ClassList">
                      			<%
                      				String[] remainingCourses;
                      				if(studentRemainingCourses == null || studentRemainingCourses.isEmpty()) {
                      					out.println("<li>" + "No major courses unscheduled" + "</li>");
                      				}
                      				else {
	                          			remainingCourses = studentRemainingCourses.split(", ");
	                  					for(int i=0; i < remainingCourses.length; i++){
	              							out.println("<li>" + remainingCourses[i] + "</li>");
	                  					}
                      				}

                  				%>
                      			</ul>
                    		</div>
                  		<button class="accordion" id="CourseButton">General Requirements</button>
                    		<div class="panel">
                      			<ul class="ClassList">
                      				<%
                      					out.println("<strong><u>Remaining Credits:</u></strong> " + studentRemainingCredits + "<br>");
                      					out.println("<strong><u>Remaining Fields:</u></strong>");
                  						for(int i=0; i < studentRemainingFields.length; i++){
              								out.println("<li> " + studentRemainingFields[i] + "</li>");
                  						}
                  					%>
                      			</ul>
                    		</div>
                    </div>
                  </li>
           	</ul>
          </div>
        </div>

        <hr>

      </div> <!-- /container -->
      <nav id="sidebar" class="">
    	<div class="sidebar-header">
    		<h3>Course Catalog</h3>
        </div>
        <ul class="list-unstyled components">
        	<li style="padding: 10px;">
        		<form id="form_search" name="form_search" method="get" action="" class="form-inline">
              		<div class="input-group">
      					<input type="text" class="form-control" placeholder="Search Catalog...">
      					<span class="input-group-btn">
        					<button class="btn btn-secondary" type="button" style="background: #154073;">Search</button>
      					</span>
    				</div>
           		</form>
        	</li>
        
        	<%
        		String[] majorIds = currUsrBeanId.getAllMajorsIds();
        		for(int x=0; x < majorIds.length; x++) {
        			majorCourses = currUsrBeanId.getIdcoursesByMajorId(majorIds[x]);
        			if(majorCourses[0] != null && !majorCourses[0].isEmpty()){
        				out.println("<li class=\"\">");
        					out.println("<a href=\"#" + majors[x] + "Submenu\" data-toggle=\"collapse\" aria-expanded=\"false\" class=\"collapsed\">" + majors[x] + " Major</a>");
        					out.println("<ul class=\"list-unstyled collapse\" id=\"" + majors[x] + "Submenu\" aria-expanded=\"false\" style=\"height: 0px;\">");
        						for(int y=0; y < majorCourses.length; y++){
        							out.println("<li><a href=\"#\">" + majorCourses[y] + "</a></li>");
        						}
        					out.println("</ul>");
        				out.println("</li>");	
        			}
        		}
        	%>  	
<!--             <li>
                <a href="#CGESubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">CGE Courses</a>
                	<ul class="list-unstyled collapse" id="CGESubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Example 1</a></li>
                        <li><a href="#">Example 2</a></li>
                        <li><a href="#">Example 3</a></li>
                    </ul>
            </li>
           	<li>
           		<a href="#IGSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">IG Courses</a>
                	<ul class="list-unstyled collapse" id="IGSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Example 1</a></li>
                        <li><a href="#">Example 2</a></li>
                        <li><a href="#">Example 3</a></li>
                    </ul>
            </li>
            <li>
            	<a href="#MTHSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">MTH Courses</a>
                	<ul class="list-unstyled collapse" id="MTHSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Example 1</a></li>
                        <li><a href="#">Example 2</a></li>
                        <li><a href="#">Example 3</a></li>
                    </ul>
            </li>
            <li>
            	<a href="#ENGSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">ENG Courses</a>
                	<ul class="list-unstyled collapse" id="ENGSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Example 1</a></li>
                        <li><a href="#">Example 2</a></li>
                        <li><a href="#">Example 3</a></li>
                    </ul>
            </li> -->
      	</ul>
      	
      	<ul class="list-unstyled CTAs">
        	<li><a href="#" class="download">Download source</a></li>
        	<li><a href="#" class="article">Back to article</a></li>
       	</ul>
	</nav>
    </div>  
    </main>

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
    	
    	$(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
</body>
</html>