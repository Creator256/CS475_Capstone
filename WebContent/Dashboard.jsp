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
  </head>

  <body>

   <nav class="navbar navbar-expand-md navbar-dark" style="background-color:#0c2340">

      <a class="navbar-brand page-scroll" href="Dashboard.jsp"> <img src="images/clogo.png" class="img-rounded" style="width:200px; height:auto;"> </a>
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

    <main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <div class="container">
          <h1 class="display-3"><em>Elmhurst Planner</em></h1>
          <p>The fast and simple way to plan.</p>
          <p><a class="btn btn-primary btn-lg" href="Contact.jsp" role="button">Learn more »</a></p>
        </div>
      </div>

      <div class="container">
        <!-- Example row of columns -->
        <div class="row">
          <div class="col-md-4" style="wordwrap: break-word">
            <ul class="nav nav-list">
                <li style="border: 5px solid black; padding: 10px; margin: 0px; width: 100%;">
                  <h2>Current Courses</h2>
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
                  <button class="accordion" id="CourseButton">CS475 Software</button>
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
                <li style="border: 5px solid black; padding: 10px; margin-top: 25px; width: 100%;">
                  <h2>Upcoming Courses</h2>
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
                  <button class="accordion" id="CourseButton">CS475 Software</button>
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
          <div class="col-md-4">
            <ul class="nav nav-list">
                <li style="border: 5px solid black; padding: 10px; margin: 0px; width: 100%;">
                  <h2>Remaining Requirements</h2>
                  <button class="accordion" id="CourseButton">Major Requirements</button>
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
                  <button class="accordion" id="CourseButton">Tag Requirements</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            To be generated using database...
                          </li>
                          <li>
                            I Tag
                          </li>
                          <li>
                            O Tag
                          </li>
                      </ul>
                    </div>
                  <button class="accordion" id="CourseButton">AoK Requirements</button>
                    <div class="panel">
                      <ul class="ClassList">
                          <li>
                            To be generated using database...
                          </li>
                          <li>
                            IEJ
                          </li>
                          <li>
                            RSC
                          </li>
                      </ul>
                    </div>
                  </li>
                </ul>

          </div>
          <div class="col-md-4">
            <ul class="nav nav-list">
                <li style="border: 5px solid black; padding: 10px; margin: 0px; width: 100%;">
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
                </ul>
          </div>
        </div>

        <hr>

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