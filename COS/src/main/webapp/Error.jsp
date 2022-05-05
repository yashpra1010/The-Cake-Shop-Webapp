<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<style>
.btn{
	border-radius: 5px;
	border: 1px solid #FF4562 !important;
	background-color: #FF4562;
	color: white;
	padding: 16px 20px;
	margin-left:550px;
	border: none;
	cursor: pointer;
	width: 300px;
	opacity: 0.9;
}
.btn:hover{
	opacity: 1;
}
</style>

</head>
<body>
<h1><b><%


if(exception == null){
	out.println("Unknown Error, Please contact admin.");

}else {
	out.println("Exception: "+exception);
}
%></b></h1>
<button class="btn" onclick="history.back()">Go Back</button>
<div class="lgt"><b><h1><button id="logout"class="btn">Logout</button></h1></b></div>
<script type="text/javascript">
		document.getElementById("logout").onclick = function () {
		if (confirm("Do you want to logout?")) {
			location.href = "logout.jsp";
		  }
		};
</script>
</body>
</html>