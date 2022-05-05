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
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="icon" href="images/logo.png">
<%@include file="components/common_css.jsp"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

body {
    background: linear-gradient(to right, rgba(255, 69, 98,1) 20%, rgba(255, 69, 98,1) 10%, rgba(235, 224, 232, 1) 100%);
    font-family: 'Roboto', sans-serif
}

.card {
    border: none;
    max-width: 450px;
    border-radius: 15px;
    margin: 150px 0 150px;
    padding: 35px;
    padding-bottom: 20px !important
}

.heading {
    color: #000;
    font-size: 14px;
    font-weight: 500
}

img {
    transform: translate(160px, -10px)
}

img:hover {
    cursor: pointer
}

.text-warning {
    font-size: 12px;
    font-weight: 500;
    color: #000 !important
}

#cno {
    transform: translateY(-10px)
}

input {
    border-bottom: 1.5px solid #E8E5D2 !important;
    font-weight: bold;
    border-radius: 0;
    border: 0
}

.form-group input:focus {
    border: 0;
    outline: 0
}

.col-sm-5 {
    padding-left: 90px
}

.btn {
    background: #ff4562 !important;
    border: none;
    border-radius: 30px
}

.btn:focus {
    box-shadow: none
}
</style>
</head>
<body><form action="success.jsp">
<div class="container-fluid">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12">
            <div class="card mx-auto">
                <p class="heading">PAYMENT DETAILS</p>
                <form class="card-details " action="success.jsp" method="post">
                    <div class="form-group mb-0">
                        <p class="text-warning mb-0">Card Number</p> <input type="number" name="card-num" placeholder="1234 5678 9012 3457" size="16" id="cno" minlength="16" maxlength="16"> <img src="https://img.icons8.com/color/48/000000/visa.png" width="54px" height="50px" style="margin-left: -150px;" required/></div>
                    <div class="form-group">
                        <p class="text-warning mb-0">Cardholder's Name</p> <input type="text" name="name" placeholder="Name" size="17" required>
                    </div>
                    <div class="form-group pt-2">
                        <div class="row d-flex">
                            <div class="col-sm-4">
                                <p class="text-warning mb-0">Expiration</p> <input type="text" name="exp" placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" required>
                            </div>
                            <div class="col-sm-3">
                                <p class="text-warning mb-0">Cvv</p> <input type="password" name="cvv" placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" required>
                            </div>
                            <div class="col-sm-5 pt-0"> <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-right px-3 py-2"></i></button> </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div></form>
</body>
<script>
localStorage.clear();
</script>
<%@include file="components/common_js.jsp"%>
</html>