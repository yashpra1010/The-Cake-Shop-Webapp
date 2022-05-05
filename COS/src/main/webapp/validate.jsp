<%@page import="java.net.URLDecoder"%>
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
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Validate-Login</title>
<link rel="icon" href="images/logo.png">
</head>
<body>
	<%
		String url="jdbc:mysql://localhost:3306/myproject";
		String db_user="root";
		String db_pass="";
		Connection con = DriverManager.getConnection(url,db_user,db_pass);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		int flag=0;
		
		String query="select userEmail,userPassword,userName from `user`";		
		Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			
			if(rs.getString(1).equals(email) && rs.getString(2).equals(password)) 
			{
				session.setAttribute("email", email);
				String username = rs.getString(3);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				flag=1;
				session.setAttribute("message", "Login Successful !!! "+email);
				
				if(email.contains("@tcs.com")){
					response.sendRedirect("admin.jsp");
				}
				else {
					response.sendRedirect("normal.jsp?category=all");
				}
				break;
			}
			else{
				session.setAttribute("message", "Login Unsuccessful !!!");
				flag=0;
			}
		}
		
		if(flag==0){
			session.setAttribute("message", "Login Unsuccessful !!!");
			response.sendRedirect("account.jsp");
		}
		
		flag=1;
		
	%>
</body>
</html>