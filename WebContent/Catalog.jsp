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
  	<%	if(currUsrBeanId.isLoggedIn()){ %>
  	
	<%
    	String fullName = currUsrBeanId.getName();
    	String eNumber = currUsrBeanId.getENumber();
    	String studentAdvisor = "tempAdvisor";
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
					<a class="nav-link disabled" href="#">Signed in as
					<%=currUsrBeanId.getName() %></a>
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
	 <div class="col-sm"></div>
    <div class="col-sm"></div>
	<div style="padding-top:1%;" class="col-sm"><label>Search:  <input type="text" id="searchStringInput"></label></div>
	
	<div class="container" style="padding-top:1%; ">
		<div class="col">
			<table class="table table-bordered table-hover" data-link="row" id="coursesTable">
				<thead class="thead-dark">
					<tr id="row0">
						<th scope="col">Course ID</th>
						<!-- <th scope="col">idMajor</th> -->
						<th scope="col">Name</th>
						<th scope="col" id="description">Description</th>
						<th scope="col">Credits</th>
						<th scope="col">Areas of Knowledge</th>
						<th scope="col">Tags</th>
						<th scope="col">Other Requirements</th>
						<th scope="col">Requisite Courses</th>
					</tr>
				</thead>
				<tbody >
		
		<% String[][] allCourses = currUsrBeanId.getAllCourses(); 
			if(allCourses.length > 0 && allCourses[0].length != 9) throw new Exception("Bad query for all courses!");
        	for (int i=0; i < allCourses.length; i++) {
			    out.println("<tr id=\"row" + (i + 1) + "\" class=\"myrow\" >");
			    String[] courseI = allCourses[i]; 
		    	if(courseI[0] == null)
		    		out.println("<td>--</td>"); 
		    	else 
		    		out.println("<td>" + courseI[0] + "</td>"); 
		    	// out.println("<td> -- </td>");  // j = 1
		    	if(courseI[2] == null)
		    		out.println("<td>--</td>"); 
		    	else 
		    		out.println("<td>" + courseI[2] + "</td>"); 
			    out.println("<td class=\"descr\"> -- </td>");  // j = 3
			    for(int j = 4; j < courseI.length; j++) { 
			    	if(courseI[j] == null)
			    		out.println("<td>--</td>"); 
			    	else 
			    		out.println("<td>" + courseI[j] + "</td>"); 
			    } 
			    out.println("</tr>");
			 } %>
				</tbody>
			</table>
 		</div>
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

	<script>
	function sortTable(table, col, reverse) {
	    var tb = table.tBodies[0], // use `<tbody>` to ignore `<thead>` and `<tfoot>` rows
	        tr = Array.prototype.slice.call(tb.rows, 0), // put rows into array
	        i;
	    reverse = -((+reverse) || -1);
	    tr = tr.sort(function (a, b) { // sort rows
	        return reverse // `-1 *` if want opposite order
	            * (a.cells[col].textContent.trim() // using `.textContent.trim()` for test
	                .localeCompare(b.cells[col].textContent.trim())
	               );
	    });
	    for(i = 0; i < tr.length; ++i) tb.appendChild(tr[i]); // append each row in order
	}
	
	function makeSortable(table) {
	    var th = table.tHead, i;
	    th && (th = th.rows[0]) && (th = th.cells);
	    if (th) i = th.length;
	    else return; // if no `<thead>` then do nothing
	    while (--i >= 0) (function (i) {
	        var dir = 1;
	        th[i].addEventListener('click', function () {sortTable(table, i, (dir = 1 - dir))});
	    }(i));
	}
	
	function makeAllSortable(parent) {
		makeSortable(document.getElementById('coursesTable'));
	}
	document.addEventListener('DOMContentLoaded',function() {
	    document.querySelector('input[id="searchStringInput"]').onkeyup=changeEventHandler2;
	},false);
	
	function changeEventHandler2(event) {
		//console.log(event.target.value);
		var rows =  document.getElementById("coursesTable").rows;
		let searchLowerCase = event.target.value.toLowerCase();
    
		if(searchLowerCase == null || searchLowerCase == "") {
			for(i = 0; i < rows.length; i++) {
				$('#row' + i).show();
			}
		}
		else {
			for(var i = 0; i < rows.length; i++) {
				//console.log(i);
				var cells = rows[i].cells;
				var id = "#row" + i;
				var element = document.getElementById(id);
				$('#row' + i).hide();
				for(var j = 0; j < cells.length; j++) {
					let cellLowerCase = cells[j].innerHTML.toLowerCase();
					if(cellLowerCase != "" && searchLowerCase.includes(cellLowerCase) || cellLowerCase.includes(searchLowerCase)) {
						//console.log("cell[" + i + "," + j + "]:" + cellLowerCase + " vs " + searchLowerCase);
						$('#row' + i).show();
						break;
					}
				}
			}
		}
	}
	
	window.onload = function () {makeAllSortable();};
	</script>
	
	<% } else { %>
	<% response.sendRedirect("http://localhost:8080/Capstone_Final/Login.jsp");} %>
</body>
</html>