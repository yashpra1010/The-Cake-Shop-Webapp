
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>

</head>
<body>
		<%
		session.removeAttribute("email");
		session.invalidate();
		response.sendRedirect("index.jsp");
		%>
</body>
</html>