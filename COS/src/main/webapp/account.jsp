<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Login</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" , initial-scale="1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<style>
body {
	font-family: calibri !important;
	background-color: #e6ffec !important;
}

input, button, select {
	border-radius: 5px !important;
	border: 1px solid #4CAF50 !important;
}

.container {
	width: 700px !important;
}

input[type], textarea {
	width: 100% !important;
	padding: 15px !important;
	margin: 5px 0 22px 0 !important;
	display: inline-block !important;
	border: none !important;
	background: #e5e5e5 !important;
}

input[type]:focus {
	background-color: #ffd6dd !important;
	outline: none !important;
}

.container a {
	color: #FF4562 !important;
}

.container {
	margin-top:-30px !important;
}

hr {
	border: 1px solid #FF4562 !important;
	margin-bottom: 25px !important;
}

.loginbtn {
	background-color: #FF4562 !important;
	color: white !important;
	padding: 16px 20px !important;
	margin-left: 180px !important;
	border: none !important;
	cursor: pointer !important;
	width: 50% !important;
	opacity: 0.9 !important;
}

.login_cont {
	margin-top: 10vw !important;
}

.loginbtn:hover {
	opacity: 1 !important;
}
</style>
<%@include file="components/common_css.jsp"%>
</head>
<body>
	<%@include file="components/header.jsp"%><br>
	<%@include file="message.jsp" %>
	<div class="card col-md-12">
		<div class="card-body">
			<div class="login_cont">
				<form action="validate.jsp" method="post">
					<div class="container">
						<center>
							<h1 style="font-size: 50px;">USER - LOGIN</h1>
						</center>
						<hr>
						<b>Email</b> <input type="email" placeholder="Enter Email"
							name="email" required>
							<b>Password</b>
						<input type="password" placeholder="Enter Password" name="password"
							required>
						<button type="submit" class="loginbtn">Login</button>
						<center>
							<br>Don't have account? <a href="signup.jsp">Sign up</a>
						</center>
					</div>
				</form>
			</div>
			<br> <br> <br> <br>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
<%@include file="components/common_js.jsp"%>
</html>