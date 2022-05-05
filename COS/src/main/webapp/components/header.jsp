<%@include file="common_css.jsp"%>
<%
String user1 = (String) session.getAttribute("email");
String username = (String) session.getAttribute("username");
%>
<!--Navbar-->
<nav
	class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark justify-content-start">
	<a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 mr-auto"
		href="index.jsp"><img src="images/whitelogo.png"
		style="width: 120px !important; height: 50px !important;"></a>
	<button class="navbar-toggler align-self-start" type="button">
		<span class="navbar-toggler-icon mr-auto"></span>
	</button>

	<div
		class="collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-end bg-transparent p-3 p-lg-0 mt-5 mt-lg-0 mobileMenu"
		id="navbarSupportedContent">
		<ul class="navbar-nav align-self-stretch">
			
			<%
			if (user1 == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="index.jsp">HOME<span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="account.jsp">LOGIN</a>
			
			</li>
			<%
			} else {
				//normal-user
				if(!user1.contains("@tcs.com")){
			%>
			<li class="nav-item"><a class="nav-link" href="normal.jsp">HOME<span class="sr-only">(current)</span></a></li>
			
			<!-- <li class="nav-item"><a class="nav-item nav-link" href="#!"><i class="fa fa-class-plus"style="color: #fff !important; font-size: 20px !important;" ></i></a></li> -->
			
			<li class="nav-item"><a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> CART <span class="cart-items">( 0 )</span></a>  </li>
			<li class="nav-item"><a class="nav-link" href="dashboard.jsp"><%= username.toUpperCase() %></a></li>
			<!-- <li class="nav-item"><a class="nav-link" href="logout.jsp">LOGOUT</a></li> -->
			<button id="logout" class="btn" style="color:#ff4562 !important; background-color:#fff !important;">LOGOUT</button>
			<%
			} else {
				//admin-user
				%>
				<li class="nav-item"><a class="nav-link" href="admin.jsp">HOME<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="dashboard.jsp"><%= username.toUpperCase() %></a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="logout.jsp">LOGOUT</a></li> -->
				<button id="logout" class="btn" style="color:#ff4562 !important; background-color:#fff !important;">LOGOUT</button>
				<%
				}
			}
			%>
		</ul>
	</div>
</nav>
<%@include file="common_js.jsp"%><br>
<script>
document.getElementById("logout").onclick = function() {
	localStorage.clear();
	if (confirm("Do you want to logout?")) {
		location.href = "logout.jsp";
	}
};
</script>