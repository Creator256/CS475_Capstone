<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import ="java.sql.*" %>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
</jsp:useBean>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<%
			currUsrBeanId.setENumber(request.getParameter("user"));
			currUsrBeanId.setPassword(request.getParameter("pass"));
			boolean status = currUsrBeanId.Login();
			if(status){
				currUsrBeanId.setFailedLogin(false);
				if(currUsrBeanId.isStudent()){
    		 		response.sendRedirect("http://localhost:8080/Capstone_Final/Dashboard.jsp");
				}
				else{
    		 		response.sendRedirect("http://localhost:8080/Capstone_Final/Advisor.jsp");
				}
			}
			else{
				currUsrBeanId.setFailedLogin(true);
		 		response.sendRedirect("http://localhost:8080/Capstone_Final/Login.jsp");
			}
		%>
	</body>
</html>