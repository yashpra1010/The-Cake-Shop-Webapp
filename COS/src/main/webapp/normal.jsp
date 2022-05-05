<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="True" errorPage="Error.jsp"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="components/common_css.jsp"%>
</head>
<body>
<%@include file="components/common_modals.jsp" %>
	<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/myproject" user="root" password="" />
	
	<%@include file="components/header.jsp"%>
	<%@include file="message.jsp"%>
<br><br><br>

		<div style="display: flex;">
		<!-- show categories -->
		<div class="col-md-2">
		<%
		String cat = request.getParameter("category");
		if(cat==null){
			cat = "all";
		}
		%>
			<sql:query var="category" dataSource="${con}">
					SELECT * FROM `category`;
			</sql:query>
			
			<div class="list-group">
				<a href="normal.jsp?category=all" class="list-group-item list-group-item-action active">All Cakes</a>
				<c:forEach var="data" items="${category.rows}">

				<a href="normal.jsp?category=${data.cId}" class="list-group-item list-group-item-action">${data.cTitle}</a>
				
				</c:forEach>
			</div>
		</div>

		<!-- show products -->
		<% if(cat.trim().equals("all")){
			%>
			<sql:query var="prod" dataSource="${con}">
				SELECT * FROM `product`;
			</sql:query>
		<%} else{ %>
			<sql:query var="prod" dataSource="${con}">
				SELECT * FROM `product` WHERE cId=<%=cat %>;
			</sql:query>
			<% } %>
		
		<div class="col-md-10">
		<!-- row -->
			<div class="row mt-4 mx-2">
			<!-- col of 12 grid -->	
				<div class="col-md-12">
					<div class="card-columns">
					
						<!-- traversing products -->
						<c:forEach var="data" items="${prod.rows}">
						
						<div class="card product-card" style="width: 20rem;">
							<div class="container text-center" style="height: 200px !important; width: 200px !important;">
								<img class="card-img-top image-fluid" src="images/${data.pPic}" alt="${data.pPic}">
							</div>
  								<div class="card-body">
    								<h5 class="card-title">${data.pTitle}</h5>
    								<p class="card-text">${data.pSmallDesc}</p>
    								<div class="card-footer text-center" style="background: white !important;">
    									<button class="btn text-white" style="background: #3C1053FF !important;" >&#8377;&nbsp;${data.pDiscPrice} /- <span style="font-size: 12px !important; font-style: italic !important;"><span style="font-size: 12px !important; font-style: italic !important; text-decoration: line-through;">&#8377;&nbsp;${data.pPrice}/-</span> ${data.pDiscount}% off</span></button><br><br>
    									<button class="btn text-white" onclick="add_to_cart('${data.pId}','${data.pTitle}','${data.pDiscPrice}','${data.pQuantity}')" style="background: #ff4562 !important;">Add To Cart </button>
    								</div>
  								</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	
	
	
	</div>
	<br><br><br>
	<%@include file="components/footer.jsp" %>
	
</body>
<script src="js/myfun.js"></script>
<%@include file="components/common_js.jsp"%>
</html>