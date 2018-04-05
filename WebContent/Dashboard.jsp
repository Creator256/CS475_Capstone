<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="PageLayout.css" rel="stylesheet">
    
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <style type="text/css">
      body {
        padding-top: 5px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
      
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>

	
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Elmhurst Planner</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link">Username</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Dashboard</a></li>
              <li><a href="#scheduler">Scheduler</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

      <div>
          <div class="hero-unit">
            <h1><em>Elmhurst Planner</em></h1>
            <p>The fast and simple way to plan.</p>
            <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
          </div>
      </div>
        <div class="container-fluid">
        <div class="row-fluid">
          <div class="span2">
            <div class="well sidebar-nav">
              <ul class="nav nav-list">
                <li class="nav-header">Navigation</li>
                <li class="active"><a href="#">Dashboard</a></li>
                <li><a href="#">Scheduler</a></li>
                <li><a href="#">Course Catalog</a></li>
                <li><a href="#">Student Information</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div><!--/.well -->
          </div><!--/span-->
          <div class="span10">
            <div class="span4">
              <ul class="nav nav-list">
                <li style="border: 5px solid black; padding: 10px; margin: 0px;">
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
                <li style="border: 5px solid black; padding: 10px; margin-top: 25px;">
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
            </div><!--/row-->
            <div class="span4">
              <ul class="nav nav-list">
                <li style="border: 5px solid black; padding: 10px; margin: 0px;">
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
            </div><!--/row-->
          </div><!--/span-->
        </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>

    </div><!--/.fluid-container-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>
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