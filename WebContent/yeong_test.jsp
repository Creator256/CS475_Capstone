<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>



<head>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="PageLayout.css" rel="stylesheet">
    <link href="bootstrap-responsive.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>tester</title>
</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#0c2340">

      <a class="navbar-brand" href="Dashboard.jsp"> <img src="images/clogo.png" class="img-rounded"> </a>
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
          		<a class="nav-link disabled" href="#">Signed in as, userName</a>
          	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="Logout.jsp">Logout</a>
          	</li>
        </ul>
      </div>
    </nav>

<div class="container" style="padding-top:1%">
	<div class="col-xs-12">
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">eNumber</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Major</th>
					<th scope="col">field</th>
					<th scope="col">field</th>
				</tr>
			</thead>
			<tbody>
				<tr class='clickable-row' data-href='url:https://www.elmhurst.edu/academics/departments/computer-science-information-systems/faculty/'>
					<th scope="row">e000000</th>
					<th scope="col">Rotator Rotator Rotator</th>
					<th scope="col">No lemon, no melon </th>
					<th scope="col">Mathematics and the Foundations of Computer Science</th>
					<th scope="col">field</th>
					<th scope="col">field</th>
				</tr>
			</tbody>
		</table>
 	</div>
</div> 

	<!-- <div class="container-fluid">
		<div class="row-fluid">
			<div style="width:100%; height:100%;">
					<ul class="nav nav-list">
						<li style="border: 5px solid black; padding: 10px; margin: 0px; width:100%">
                  <h2>Students</h2>
                  <button class="accordion" id="CourseButton">CS435 Concepts</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            Tags: N/A
                          </li>
                          <li>
                            AoKs: N/A
                          </li>
                      </ul>
                    </div>
                		</li>
					</ul>
				</div>
			</div>
	</div> -->
</body>

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


</html>