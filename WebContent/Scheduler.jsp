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
    	
    	String[] courseInfoVar;
  		String creditVar;
  		String tagVar;
  		String aokVar;
    	
  		String[] majors = currUsrBeanId.getMajors();
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
                        <li>Student: $StudentName</li>
                        <li>eNumber: $StudentNumber</li>
                        <li>Advisor: $StudentAdvisor</li>
                	</ul>
            	</div>
            	<div class="" id="">
                   	<ul class="nav navbar-nav navbar-center">
                        <li>Major: $StudentMajor</li>
                        <li>Year: $StudentYear<br></li>
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
        
        <div class="row">
        	<div class="col-md-9">
        		Area for schedule/plan
        		<div class="row">
            		<div class="col-md-6">
            			First Year Courses
            			<div class="courseCell" id="firstYear" ondrop="drop(event)" ondragover="allowDrop(event)">
            				Drag Course Here...
            			</div>
            		</div>
            		<div class="col-md-6">
            			Second Year Courses
            			<div class="courseCell" id="secondYear" ondrop="drop(event)" ondragover="allowDrop(event)">
            				Drag Course Here...
            			</div>
            		</div>
          		</div>
        	</div>
        	<div class="col-md-3">
        		Planned Schedule
        		<ul class="">
                  <li>Credits: #.##</li>
                  <li>Tags: I, O, etc..</li>
                  <li>AoKs: IEJ, etc..</li>
                </ul>
        		Remaining Requirements
        		<ul class="">
                  <li>Credits: #.##</li>
                  <li>Tags: I, O, etc..</li>
                  <li>AoKs: IEJ, etc..</li>
                </ul>
        		<ul class="nav nav-list">
                  <li>
                  	<div id="drag2" draggable="true" draggable="true" ondragstart="drag(event)" width="336" height="69">
                  		Draggable Course
                  	</div>
                  	<div class="CoursePanel" id="drag3" draggable="true" draggable="true" ondragstart="drag(event)">
                  		CS475 Software
                  		<ul>
                  			<li>Credits: 1.00</li>
                  			<li>Tags: N/A</li>
                  			<li>AoKs: N/A</li>
                  		</ul>
                  	</div>
                  </li>
                </ul>
        	</div>
      	</div>
      	
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
        		
        		for(int x=0; x < majors.length; x++) {
        			majorCourses = currUsrBeanId.getMajorCourses(majors[x]);
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
            <li>
                <a href="#CGESubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">CGE Courses</a>
                	<ul class="list-unstyled collapse" id="CGESubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Page 1</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
            </li>
           	<li>
           		<a href="#IGSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">IG Courses</a>
                	<ul class="list-unstyled collapse" id="IGSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Page 1</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
            </li>
            <li>
            	<a href="#MTHSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">MTH Courses</a>
                	<ul class="list-unstyled collapse" id="MTHSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Page 1</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
            </li>
            <li>
            	<a href="#ENGSubmenu" data-toggle="collapse" aria-expanded="false" class="collapsed">ENG Courses</a>
                	<ul class="list-unstyled collapse" id="ENGSubmenu" aria-expanded="false" style="height: 0px;">
                		<li><a href="#">Page 1</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
            </li>
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

		function drop(ev) {
    		ev.preventDefault();
    		var data = ev.dataTransfer.getData("text");
    		ev.target.appendChild(document.getElementById(data));
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