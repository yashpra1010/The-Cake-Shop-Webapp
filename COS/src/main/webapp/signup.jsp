<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="ISO-8859-1">
<%@include file="components/common_css.jsp"%>
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
	padding: 10px 0 !important;
}

hr {
	border: 1px solid #FF4562 !important;
	margin-bottom: 25px !important;
}

.registerbtn {
	background-color: #FF4562 !important;
	color: white !important;
	padding: 16px 20px !important;
	margin-left: 180px !important;
	border: none !important;
	cursor: pointer !important;
	width: 50% !important;
	opacity: 0.9 !important;
}

.signup_cont {
	margin-top: 10vw !important;
}

.registerbtn:hover {
	opacity: 1 !important;
}
</style>

</head>
<body>
	<%@include file="components/header.jsp"%><br>
	<div class="card col-md-12">
		<div class="card-body">
			<div class="signup_cont">
				<form action="insert_signup.jsp" method="post">
					<div class="container">
						<center>
							<h1 style="font-size: 50px;">USER - REGISTER</h1>
						</center>
						<hr>
						<label> <b>Name</b>
						</label> <input type="text" name="name" placeholder="Enter Your Name"
							size="15" required><label> <b>Phone</b>
						</label> <input type="text" name="phone" placeholder="Enter Phone no."
							size="10" required> <label for="gender"><b>Gender</b></label>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2" value="M" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								Male </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1" value="F">
							<label class="form-check-label" for="flexRadioDefault1">
								Female </label>
						</div>







						<label for="address"><b>Address</b></label> <input type="text"
							placeholder="Enter Address" name="address" required> <label
							for="email"><b>Email</b></label> <input type="email"
							placeholder="Enter Email" name="email" required> <label
							for="psw"><b>Password</b></label> <input type="password"
							placeholder="Enter Password" name="password" required> <label
							for="psw-repeat"><b>Re-type Password</b></label> <input
							type="password" placeholder="Retype Password" name="re_password"
							required>
						<button type="submit" class="registerbtn">Register</button>
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