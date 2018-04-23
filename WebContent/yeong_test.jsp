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
<div class="container">
		<div class="row">
			<div class="col-xs-12">
					<table class="table table-bordered">	
						<tr>1</tr>
						<tr>2</tr>
						<tr>3</tr>
						<tr>4</tr>
					</table>
			</div>
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