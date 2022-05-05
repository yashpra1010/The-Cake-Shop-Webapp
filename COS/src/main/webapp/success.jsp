<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="True" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/logo.png">
<title>Payment Successful</title>
<%@include file="components/common_css.jsp"%>
</head>
<body>
<%@include file="components/header.jsp"%>
<%@include file="message.jsp" %>

<div class="card" style="text-align:center;border:none;box-shadow:none;">
 <br><br><br><br>
  <div class="card-body">
    <h5 class="card-title"><img src="images/check.png" style="width:200px;"></h5>
 <br><h2>Payment Successful</h2>
  </div>
</div><br>
<div class="text-center"><a href="normal.jsp"><button class="btn" style="text-transform:capitalize;background:#ff4562;color:#fff">Go Home</button></a></div>

</body>
<%@include file="components/common_js.jsp"%>
</html>