<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="jakarta.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Insert Signup</title>
</head>
<body>
	<%
	String url = "jdbc:mysql://localhost:3306/myproject";
	String db_user = "root";
	String db_pass = "";
	Connection con = DriverManager.getConnection(url, db_user, db_pass);

	String Name = request.getParameter("name");
	String phn = request.getParameter("phone");
	String gen = request.getParameter("flexRadioDefault");
	String addr = request.getParameter("address");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String re_password = request.getParameter("re_password");
	String gender;
	
	if(gen.equals("M")){
		gender = "male.png";
	}
	else{
		gender = "female.png";
	}
	
	String query = "INSERT INTO `user` (`userName`, `userPhone`, `userAddress`, `userEmail`, `userPassword`, `userPic`,`userType`) VALUES (?,?,?,?,?,?,?);";

	PreparedStatement ps = con.prepareStatement(query);

	if (re_password.equals(password)) {
		if(email.contains("@tcs.com")){
			ps.setString(1, Name);
			ps.setString(2, phn);
			ps.setString(3, addr);
			ps.setString(4, email);
			ps.setString(5, password);
			ps.setString(6, gender);
			ps.setString(7, "admin");
			ps.executeUpdate();

			session.setAttribute("message", "Registration Successful !!! "+Name);
			response.sendRedirect("index.jsp");	
		}
		else{
		ps.setString(1, Name);
		ps.setString(2, phn);
		ps.setString(3, addr);
		ps.setString(4, email);
		ps.setString(5, password);
		ps.setString(6, gender);
		ps.setString(7, "normal");
		ps.executeUpdate();
		
		session.setAttribute("message", "Registration Successful !!! "+Name);
		response.sendRedirect("index.jsp");
		}
	} else {
		out.println("<center><b><h1>Please enter same password.</h1></b></center>");
		out.println("<b><h1><button class=\"btn\" onclick=\"history.back()\">Go Back</button></h1></b>");

	}
	%>
</body>
</html>