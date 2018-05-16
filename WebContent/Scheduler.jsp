<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.Math" %>
<%@ page import ="java.net.*" %>
<%@ page import ="java.io.*" %>
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
    <link href="Scheduler.css" rel="stylesheet">
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
		double studentRemainingCredits = currUsrBeanId.getStudent().getRemainingCredits();
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
				<li class="nav-item">
					<a class="nav-link" href="Dashboard.jsp">Dashboard</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="Scheduler.jsp">Scheduler<span class="sr-only">(current)</span></a>
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

	<!-- Create form to encompass scheduler, then create sections Year 1, Year 2, etc..
			YearInfo: CourseName CourseName .. (coursenames seperated by spaces)
			each year will be its own string.		
	 -->
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
        <!-- Container for Scheduler -->
        <form id="form_scheduler" name="form_scheduler" onsubmit="saveSchedule(event)" action="ProcessScheduler.jsp">
        <input form="form_scheduler" type="hidden" name="scheduleFormString" id="scheduleFormString" value="">
        <div class="row">
        	<div class="col-md-9" style="overflow-x: scroll; white-space: nowrap;">
        		Area for schedule/plan
        		<div class="row">
            		<div class="col-md-6" style="min-width: 300px;">
            			First Year Courses
            			<div class="courseCell" id="firstYear" ondrop="drop(event, this)" ondragover="allowDrop(event)">
            				Drag Course Here...
            				<%
            				if(studentFirstYear != null) {
                  				for(int i=0; i < studentFirstYear.length; i++){
                  					courseInfoVar = currUsrBeanId.getCourseInfo(studentFirstYear[i]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  			
                  			
                  					out.println("<div class=\"CoursePanel\" id=\"" + studentFirstYear[i] + "\" draggable=\"true\" draggable=\"true\" ondragstart=\"drag(event)\">");
                  						//out.println("<input form=\"form_scheduler\" type=\"hidden\" name=\"" + studentFirstYear[i] + "\" value=\"" + studentFirstYear[i] + "\">");
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
            		</div>
            		<div class="col-md-6" style="min-width: 300px;">
            			Second Year Courses
            			<div class="courseCell" id="secondYear" ondrop="drop(event, this)" ondragover="allowDrop(event)">
            				Drag Course Here...
            				<%
            				if(studentSecondYear != null) {
                  				for(int i=0; i < studentSecondYear.length; i++){
                  					courseInfoVar = currUsrBeanId.getCourseInfo(studentSecondYear[i]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  			
                  			
                  					out.println("<div class=\"CoursePanel\" id=\"" + studentSecondYear[i] + "\" draggable=\"true\" draggable=\"true\" ondragstart=\"drag(event)\">");
                  						//out.println("<input form=\"form_scheduler\" type=\"hidden\" name=\"" + studentSecondYear[i] + "\" value=\"" + studentSecondYear[i] + "\">");
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
            		</div>
            		<div class="col-md-6" style="min-width: 300px;">
            			Third Year Courses
            			<div class="courseCell" id="thirdYear" ondrop="drop(event, this)" ondragover="allowDrop(event)">
            				Drag Course Here...
            				<%
            				if(studentThirdYear != null) {
                  				for(int i=0; i < studentThirdYear.length; i++){
                  					courseInfoVar = currUsrBeanId.getCourseInfo(studentThirdYear[i]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  			
                  			
                  					out.println("<div class=\"CoursePanel\" id=\"" + studentThirdYear[i] + "\" draggable=\"true\" draggable=\"true\" ondragstart=\"drag(event)\">");
                  						//out.println("<input form=\"form_scheduler\" type=\"hidden\" name=\"" + studentThirdYear[i] + "\" value=\"" + studentThirdYear[i] + "\">");
                  						out.println(studentThirdYear[i]);
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
            		</div>
            		<div class="col-md-6" style="min-width: 300px;">
            			Fourth Year Courses
            			<div class="courseCell" id="fourthYear" ondrop="drop(event, this)" ondragover="allowDrop(event)">
            				Drag Course Here...
            				<%
            				if(studentFourthYear != null) {
                  				for(int i=0; i < studentFourthYear.length; i++){
                  					courseInfoVar = currUsrBeanId.getCourseInfo(studentFourthYear[i]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  			
                  			
                  					out.println("<div class=\"CoursePanel\" id=\"" + studentFourthYear[i] + "\" draggable=\"true\" draggable=\"true\" ondragstart=\"drag(event)\">");
                  						//out.println("<input form=\"form_scheduler\" type=\"hidden\" name=\"" + studentFourthYear[i] + "\" value=\"" + studentFourthYear[i] + "\">");
                  						out.println(studentFourthYear[i]);
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
            		</div>
          		</div>
        	</div>
        	<div class="col-md-3">
        		<input type="submit" value="Save Schedule"><br>
        		<strong><u>Remaining Requirements</u></strong>
        		<ul class="">
        		<%
                    String[] remainingCourses;
                    out.println("<strong><u>Remaining Courses:</u></strong>");
                  	
      				if(studentRemainingCourses == null || studentRemainingCourses.isEmpty()) {
       					out.println("<li>" + "No major courses unscheduled" + "</li>");
       				}
       				else {
            			remainingCourses = studentRemainingCourses.split(", ");
    					for(int i=0; i < remainingCourses.length; i++){
							out.println("<li>" + remainingCourses[i] + "</li>");
    					}
       				}
                  	out.println("<strong><u>Remaining Credits:</u></strong> " + studentRemainingCredits + "<br>");
  					out.println("<strong><u>Remaining Fields:</u></strong>");
  					if(studentRemainingFields == null || studentRemainingFields.length == 0) {
       					out.println("<li>" + "All requirements scheduled" + "</li>");
       				}
       				else {
    					for(int i=0; i < studentRemainingFields.length; i++){
							out.println("<li>" + studentRemainingFields[i] + "</li>");
    					}
       				}
                 %>
                </ul>
        	</div>
      	</div>
      	</form>
      	
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
        					out.println("<a href=\"#" + majors[x] + "Submenu\" data-toggle=\"collapse\" aria-expanded=\"false\" class=\"collapsed\">" + majors[x] + " Courses</a>");
        					out.println("<ul class=\"list-unstyled collapse\" id=\"" + majors[x] + "Submenu\" aria-expanded=\"false\" style=\"height: 0px;\">");
        						for(int y=0; y < majorCourses.length; y++){
        							courseInfoVar = currUsrBeanId.getCourseInfo(majorCourses[y]);
                  					creditVar = courseInfoVar[4];
                  					aokVar = courseInfoVar[5];
                  					tagVar = courseInfoVar[6];
                  					out.println("<li><span>");
                  						out.println("<div class=\"CoursePanel\" id=\"" + majorCourses[y] + "\" draggable=\"true\" draggable=\"true\" ondragstart=\"drag(event)\">");
                  							//out.println("<input form=\"form_scheduler\" type=\"hidden\" name=\"" + majorCourses[y] + "\" value=\"" + majorCourses[y] + "\">");
                  							out.println(majorCourses[y]);
              								out.println("<ul>");
              									out.println("<li>Credits: " + creditVar + "</li>");
              									out.println("<li>AoKs: " + aokVar + "</li>");
              									out.println("<li>Tags: " + tagVar + "</li>");
              								out.println("</ul>");
              							out.println("</div>");	
              						out.println("</span></li>");
        						}
        					out.println("</ul>");
        				out.println("</li>");	
        			}
        		}
        	%>
      	</ul>
      	
      	<ul class="list-unstyled CTAs">
        	<li><a href="#" class="download">Download source</a></li>
        	<li><a href="#" class="article">Back to article</a></li>
       	</ul>
	</nav>
    </div>  
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
    	
    	//Begin Drag and Drop Functions
    	function allowDrop(ev) {
    		ev.preventDefault();
		}

		function drag(ev) {
	    	ev.dataTransfer.setData("text", ev.target.id);
		}

		function drop(ev, el) {
			  ev.preventDefault();
			  var data = ev.dataTransfer.getData("text");
			  el.appendChild(document.getElementById(data));
		}
		
		$(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
		
		function saveSchedule(ev) {
			//ev.preventDefault();
			
			var scheduleString;
			var matchesYearOne = [];
			var matchesYearTwo = [];
			var matchesYearThree = [];
			var matchesYearFour = [];
			var searchYearOne = document.getElementById("firstYear").children;
			var searchYearTwo = document.getElementById("secondYear").children;
			var searchYearThree = document.getElementById("thirdYear").children;
			var searchYearFour = document.getElementById("fourthYear").children;
			
			for(var i = 0; i < searchYearOne.length; i++) {
			    if(searchYearOne[i].tagName == 'DIV') {
			    	matchesYearOne.push(searchYearOne[i].id);
			    	if(scheduleString){
			    		scheduleString += (", " + searchYearOne[i].id);
			    	} else {
			    		scheduleString = searchYearOne[i].id;
			    	}
			    }
			}
			
			scheduleString += " | ";
			for(var i = 0; i < searchYearTwo.length; i++) {
			    if(searchYearOne[i].tagName == 'DIV') {
			    	matchesYearTwo.push(searchYearTwo[i].id);
			    	if(i > 0){
			    		scheduleString += (", " + searchYearTwo[i].id);
			    	} else {
			    		scheduleString += searchYearTwo[i].id;
			    	}
			    }
			}
			
			scheduleString += " | ";
			for(var i = 0; i < searchYearThree.length; i++) {
			    if(searchYearThree[i].tagName == 'DIV') {
			    	matchesYearThree.push(searchYearThree[i].id);
			    	if(i > 0){
			    		scheduleString += (", " + searchYearThree[i].id);
			    	} else {
			    		scheduleString += searchYearThree[i].id;
			    	}
			    }
			}
			
			scheduleString += " | ";
			for(var i = 0; i < searchYearFour.length; i++) {
			    if(searchYearFour[i].tagName == 'DIV') {
			    	matchesYearFour.push(searchYearFour[i].id);
			    	if(i > 0){
			    		scheduleString += (", " + searchYearFour[i].id);
			    	} else {
			    		scheduleString += searchYearFour[i].id;
			    	}
			    }
			}
			document.getElementById("scheduleFormString").value = scheduleString;
			return;
		}
		
    </script>

</body>
</html>