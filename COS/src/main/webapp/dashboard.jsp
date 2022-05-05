<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/logo.png">
<title>Dashboard</title>
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css"
	rel="stylesheet" />
<style>

.gradient-custom {
background-color: #ee5166;
background-image: linear-gradient(315deg, #ffbac5 0%, #ff4562 74%);}
</style>

<%@include file="components/common_css.jsp"%>
</head>
<body>
<%@include file="components/common_modals.jsp"%>
	<%@include file="components/header.jsp"%>

<%
		String url="jdbc:mysql://localhost:3306/myproject";
		String db_user="root";
		String db_pass="";
		Connection con = DriverManager.getConnection(url,db_user,db_pass);
		
		username = (String) session.getAttribute("username");
		
		String uname="",uphn="",uaddr="",uemail="",upic="",utype="";
		
		String query="select userName,userPhone,userAddress,userEmail,userPic,userType from `user` where `userName`='"+username+"'";
		Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			
			if(rs.getString(1).equals(username)) 
			{
				uname = rs.getString(1);
				uphn = rs.getString(2);
				uaddr = rs.getString(3);
				uemail = rs.getString(4);
				upic = rs.getString(5);
				utype = rs.getString(6);
			}
		}
	%>

	<section class="vh-100" style="background-color: #f4f5f7;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-lg-6 mb-4 mb-lg-0">
					<div class="card mb-3" style="border-radius: .5rem;">
						<div class="row g-0">
							<div class="col-md-4 gradient-custom text-center text-white"
								style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
								<img
									src="images/<%=upic%>"
									alt="Avatar" class="img-fluid my-5" style="width: 120px;" />
								<h5><b><%=uname %></b></h5>
							
							</div>
							<div class="col-md-8">
								<div class="card-body p-4">
									<h6>Information</h6>
									<hr class="mt-0 mb-4">
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6>Email</h6>
											<p class="text-muted"><%=uemail %></p>
										</div>
										<div class="col-6 mb-3">
											<h6>Phone</h6>
											<p class="text-muted"><%=uphn %></p>
										</div>
									</div>
									<h6>Additional Info</h6>
									<hr class="mt-0 mb-4">
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6>Address</h6>
											<p class="text-muted"><%=uaddr %></p>
										</div>
										<div class="col-6 mb-3">
											<h6>User Type</h6>
											<p class="text-muted"><%=utype.toUpperCase() %></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




<%@include file="components/footer.jsp"%>
</body>
<%@include file="components/common_js.jsp"%>
<script src="js/myfun.js"></script>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"></script>
</html>