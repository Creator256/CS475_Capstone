<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Elmhurst Planner</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Le styles -->
		<link href="bootstrap.css" rel="stylesheet">
		<link href="bootstrap-responsive.css" rel="stylesheet">
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
		<link href="PageLayout.css" rel="stylesheet">

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
					<a class="brand" href="Advisor.jsp">Elmhurst Planner</a>
					<div class="nav-collapse collapse">
						<p class="navbar-text pull-right">
							Logged in as <a href="userInfo.jsp" class="navbar-link">Username</a> | <a href="logout.jsp" class="navbar-link">Logout</a>
						</p>
						<ul class="nav">
							<li class="active"><a href="Advisor.jsp">Advisor Dashboard</a></li>
							<li><a href="#courseCatalog">Course Catalog</a></li>
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
				<div class="span10"></div>
			</div>
		</div>
		<hr>
	</body>

	<footer>
		<p>&copy; Company 2013</p>
	</footer>

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
				if (panel.style.display === "block")  { panel.style.display = "none";}
				else { panel.style.display = "block"; }
			}
		}

		function autoOpen() {
			document.getElementsById("defaultOpen").style.visibility = "block";
		}
	</script>
</html>