<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.net.*" %>
<%@ page import ="java.io.*" %>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
</jsp:useBean>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<%
			System.out.println("*********PROCESS SCHEDULE*********");
			
			String schedule =  request.getParameter("scheduleFormString");
			System.out.println(schedule);
			currUsrBeanId.setSchedule(schedule);
			response.sendRedirect("http://localhost:8080/Capstone_Final/Scheduler.jsp");
		%>
	</body>
</html>