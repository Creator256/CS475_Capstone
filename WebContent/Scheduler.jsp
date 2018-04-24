<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <style>
#div1, #div2 {
    float: left;
    width: 100px;
    height: 35px;
    margin: 10px;
    padding: 10px;
    border: 1px solid black;
}
</style>
  </head>

  <body>

    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="Dashboard.jsp">Elmhurst Planner</a>
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="navbar-collapse collapse" id="navbarsExampleDefault" style="">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="Dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
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
        <!--
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        -->
      </div>
    </nav>

    <main role="main">

      <div class="container" style="padding-top: 50px;">
        <!-- Container for Scheduler -->
        <h1><em>My Scheduler</em></h1>
        <div class="row">
        	<div class="col-md-9">
        		Area for schedule/plan
        		<div class="row">
            		<div class="col-md-6">
            			First Year Courses
            			<div id="courseCell" ondrop="drop(event)" ondragover="allowDrop(event)">
            				Drag Course Here...
            			</div>
            		</div>
            		<div class="col-md-6">
            			Second Year Courses
            		</div>
          		</div>
        	</div>
        	<div class="col-md-3">Area for course catalog
        		<ul class="nav nav-list">
                <li style="background-color: white; border: 5px solid black; padding: 10px; margin: 0px; width: 100%;">
                  <h2>Course Catalog</h2>
                  <form id="form_search" name="form_search" method="get" action="" class="form-inline">
                    <div class="input-group">
      					<input type="text" class="form-control" placeholder="Search Catalog...">
      						<span class="input-group-btn">
        						<button class="btn btn-secondary" type="button">Search</button>
      						</span>
    				</div>
                  </form>
                  <button class="accordion" id="CourseButton">CS Catalog</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            To be generated using database...
                          </li>
                          <li>
                            CS###
                          </li>
                          <li>
                            MTH###
                          </li>
                      </ul>
                    </div>
                  <button class="accordion" id="CourseButton">CGE Catalog</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            To be generated using database...
                          </li>
                          <li>
                            CGE###
                          </li>
                          <li>
                            MTH###
                          </li>
                      </ul>
                    </div>
                  <button class="accordion" id="CourseButton">IS Catalog</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            To be generated using database...
                          </li>
                          <li>
                            IS###
                          </li>
                          <li>
                            IS###
                          </li>
                      </ul>
                    </div>
                  </li>
                  <li>
                  	<div id="drag2" draggable="true" draggable="true" ondragstart="drag(event)" width="336" height="69">
                  		Draggable Course
                  	</div>
                  </li>
                </ul>
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
    </script>

</body>
</html>