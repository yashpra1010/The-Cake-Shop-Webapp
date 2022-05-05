<% 
String user = (String)session.getAttribute("email");

if(user==null){
	session.setAttribute("Message", "Unauthorized Login !!!");
	session.invalidate();
	response.sendRedirect("account.jsp");
	return;
}
else {
	if(user.contains("@tcs.com")){
		session.setAttribute("Message", "You are Admin !!!");
		response.sendRedirect("admin.jsp");
		return;
	}
}
%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css.jsp"%>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/myproject" user="root" password="" />
	<%@include file="components/common_modals.jsp"%>
	<%@include file="components/header.jsp"%>
	<%@include file="message.jsp"%>
	
	<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `user`;
		</sql:query>
		
	<c:set var = "userE" scope = "session" value = "<%=user%>"/>
	<c:forEach var="data" items="${rs.rows}">
	
	<c:if test = "${data.userEmail == userE}">
         <c:set var = "userE" scope = "session" value = "${data.userEmail}"/>
         <c:set var = "userN" scope = "session" value = "${data.userName}"/>
         <c:set var = "userAdd" scope = "session" value = "${data.userAddress}"/>
      </c:if>
	
	</c:forEach>


	<div class="container">
		<div class="row">
			<!-- all products -->
			<div class="col-md-6">
			<!-- card -->
				<div class="card" style="margin-top:100px;">
					<div class="card-body">
					<h2 class="text-center">Your Cart</h2>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>


			<!-- user form details -->
			<div class="col-md-6">
			<!-- card -->
				<div class="card" style="margin-top:100px;">
					<div class="card-body">
					<h2 class="text-center">Your Details</h2>
						<form action="payment.jsp" method="post">
							<div class="form-group">
								<label for="inputEmail"><b>Email address</b></label>
								<input type="email" class="form-control" id="userEmail" aria-describedby="emailHelp" value="${userE}" placeholder="Enter your email" required>
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						
								<label for="inputName"><b>Name</b></label>
								<input type="text" class="form-control" id="inputName" value="${userN}" placeholder="Enter your name" required>							
							
								<label for="inputAddress"><b>Shipping Address</b></label>
								<textarea class="form-control" id="userAddress" rows="3" required>${userAdd}</textarea>
							</div>
							<div class="text-center">
							<button type="submit" onclick="gotoShop()" class="btn btn-outline-secondary">Continue Shopping</button>
							<button type="submit" onclick="gotoPayment()" class="btn btn-success">Place Order</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="components/common_js.jsp"%>
<script src="js/myfun.js"></script>
<script>
function gotoShop(){
	window.location = "normal.jsp";
}

function gotoPayment(){
	window.location = "payment.jsp";
}
</script>
</html>