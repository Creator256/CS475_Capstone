<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
	</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<%
			currUsrBeanId.setLoggedIn(false);
 			response.sendRedirect("http://localhost:8080/Capstone_Final/Login.jsp");
			session.invalidate();
		%>
	</body>
</html>